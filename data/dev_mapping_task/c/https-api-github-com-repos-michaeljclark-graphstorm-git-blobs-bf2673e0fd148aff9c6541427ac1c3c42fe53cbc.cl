struct tree_global {
  volatile int nextNode;
  volatile int activeNodes;
  int depth;
  int pad;
};

struct tree_node {
  float4 containerCenter;
  float4 containerHalf;
  float4 centerOfGravity;
  int entries[4];
  uint childCount[4];
  uint state;
  int depth;
  int parent;
  float mass;
};

void A(__global struct tree_node* a, const uint b);
int B(__global struct tree_node* a, float4 b);
float4 C(int a);
float D(float a);

void A(__global struct tree_node* a, const uint b) {
  for (int c = 0; c < 4; c++) {
    if (atomic_cmpxchg(&a->entries[c], -1, b) == -1) {
      break;
    }
  }
}

int B(__global struct tree_node* a, float4 b) {
  float4 c = b - a->containerCenter;

  if (c.x <= 0 && c.y <= 0)
    return 0;
  else if (c.x <= 0 && c.y >= 0)
    return 1;
  else if (c.x >= 0 && c.y <= 0)
    return 2;
  else
    return 3;
}

float4 C(int a) {
  switch (a) {
    case 0:
      return (float4)(-1.0f, -1.0f, 0.0f, 0.0f);
    case 1:
      return (float4)(-1.0f, 1.0f, 0.0f, 0.0f);
    case 2:
      return (float4)(1.0f, -1.0f, 0.0f, 0.0f);
    case 3:
    default:
      return (float4)(1.0f, 1.0f, 0.0f, 0.0f);
  }
}
float D(float a) {
  int b;
  float c = frexp(a, &b);

  int d = (int)(1.0f / c);

  d--;
  d |= d >> 1;
  d |= d >> 2;
  d |= d >> 4;
  d |= d >> 8;
  d |= d >> 16;
  d++;

  return (1.0f / d) * __clc_pow(2.0f, b);
}
__kernel void E(__global size_t* a) {
  *a = sizeof(struct tree_node);
}

__kernel void F(__global uint* a) {
  const uint b = get_global_id(0);

  a[b] = 0;
}

__kernel void G(__global struct tree_node* a) {
  const uint b = get_global_id(0);
  __global struct tree_node* c = a + b;

  c->state = 0;
  c->parent = -1;
  c->depth = -1;
  for (int d = 0; d < 4; d++) {
    c->entries[d] = -1;
  }
  for (int d = 0; d < 4; d++) {
    c->childCount[d] = 0;
  }
}

__kernel void H(__global struct tree_global* a, __global float4* b, __global float4* c, __global float4* d, const uint e, const uint f) {
  const uint g = get_global_id(0);
  const uint h = g * e;
  const uint i = min((g + 1) * e, f);

  float4 j = (float4)0x1.fffffep127f;
  float4 k = (float4)-0x1.fffffep127f;
  for (uint l = h; l < i; l++) {
    float4 m = b[l];
    j = min(m, j);
    k = max(m, k);
  }
  c[g] = j;
  d[g] = k;
}

__kernel void I(__global struct tree_global* a, __global struct tree_node* b, __global float4* c, __global float4* d, const uint e) {
  float4 f = (float4)0x1.fffffep127f;
  float4 g = (float4)-0x1.fffffep127f;
  for (uint h = 0; h < e; h++) {
    f = min(c[h], f);
    g = max(d[h], g);
  }

  float i = fmax(fmax(__clc_fabs(f.x), __clc_fabs(g.x)), fmax(__clc_fabs(f.y), __clc_fabs(g.y)));

  b[0].containerCenter = 0.0f;
  b[0].containerHalf = D(i);
  b[0].state = 1;
  b[0].depth = 0;

  a->nextNode = 1;
  a->activeNodes = 1;
}

__kernel void J(__global float4* a, __global struct tree_node* b, __global uint* c, __global uint* d) {
  const uint e = get_global_id(0);
  __global struct tree_node* f = b + c[e];

  if (f->state == 1) {
    float4 g = a[e];
    const uint h = B(f, g);
    d[e] = h;
    atomic_add(&f->childCount[h], 1);
  }
}

__kernel void K(__global struct tree_global* a, __global struct tree_node* b, __global uint* c, __global uint* d, const int e) {
  const uint f = get_global_id(0);
  __global struct tree_node* g = b + f;
  if (g->state == 1) {
    int h = -1;
    for (int i = 0; i < 4; i++) {
      uint j = g->childCount[i];
      if (j == 0)
        continue;

      uint k = atomic_add(&a->nextNode, 1);
      g->entries[i] = k;
      __global struct tree_node* l = b + k;
      l->containerHalf = g->containerHalf / 2.0f;
      l->containerCenter = g->containerCenter + l->containerHalf * C(i);
      l->parent = f;
      l->depth = e;
      a->depth = e;
      if (j <= 4) {
        l->state = 3;
      } else {
        l->state = 1;
        h++;
      }
    }

    g->state = 2;
    atomic_add(&a->activeNodes, h);
  }
}

__kernel void L(__global struct tree_node* a, __global uint* b, __global uint* c) {
  const uint d = get_global_id(0);

  if (a[b[d]].state == 2) {
    uint e = b[d];
    uint f = c[d];
    __global struct tree_node* g = a + e;
    uint h = g->childCount[f];
    uint i = g->entries[f];

    b[d] = i;

    if (h <= 4) {
      A(a + i, d);
    }
  }
}

__kernel void M(__global float4* a, __global float* b, __global struct tree_node* c, const int d) {
  const uint e = get_global_id(0);
  __global struct tree_node* f = c + e;

  if (f->depth == d) {
    if (f->state == 2) {
      float4 g = (float)0;
      float h = (float)0;
      for (uint i = 0; i < 4; i++) {
        int j = f->entries[i];
        if (j < 0)
          continue;
        g += c[j].centerOfGravity;
        h += c[j].mass;
      }
      f->centerOfGravity = g / h;
      f->mass = h;
    } else if (f->state == 3) {
      float4 g = (float)0;
      float h = (float)0;
      for (uint i = 0; i < 4; i++) {
        int k = f->entries[i];
        if (k < 0)
          break;
        g += a[k] * b[k];
        h += b[k];
      }
      f->centerOfGravity = g / h;
      f->mass = h;
    }
  }
}
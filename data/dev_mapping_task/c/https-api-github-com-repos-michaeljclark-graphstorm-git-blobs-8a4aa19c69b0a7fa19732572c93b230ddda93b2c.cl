struct tree_global {
  volatile int nextNode;
  volatile int activeNodes;
  int depth;
  int pad;
};

void A(__global int* a, const uint b);
int B(float4 a);
float4 C(int a);
float D(float a);

void A(__global int* a, const uint b) {
  for (int c = 0; c < 4; c++) {
    if (atomic_cmpxchg(&a[c], -1, b) == -1) {
      break;
    }
  }
}

int B(float4 a) {
  if (a.x <= 0 && a.y <= 0)
    return 0;
  else if (a.x <= 0 && a.y >= 0)
    return 1;
  else if (a.x >= 0 && a.y <= 0)
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
__kernel void E(__global uint* a) {
  const uint b = get_global_id(0);

  a[b] = 0;
}

__kernel void F(__global int* a, __global uint* b, __global uint* c, __global int* d, __global int* e) {
  const uint f = get_global_id(0);

  c[f] = 0;
  d[f] = -1;
  e[f] = -1;
  for (int g = 0; g < 4; g++) {
    a[f * 4 + g] = -1;
  }
  for (int g = 0; g < 4; g++) {
    b[f * 4 + g] = 0;
  }
}

__kernel void G(__global struct tree_global* a, __global float4* b, __global float4* c, __global float4* d, const uint e, const uint f) {
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

__kernel void H(__global struct tree_global* a, __global float4* b, __global float4* c, __global uint* d, __global int* e, __global float4* f, __global float4* g, const uint h) {
  float4 i = (float4)0x1.fffffep127f;
  float4 j = (float4)-0x1.fffffep127f;
  for (uint k = 0; k < h; k++) {
    i = min(f[k], i);
    j = max(g[k], j);
  }

  float l = fmax(fmax(__clc_fabs(i.x), __clc_fabs(j.x)), fmax(__clc_fabs(i.y), __clc_fabs(j.y)));

  b[0] = 0.0f;
  c[0] = D(l);
  d[0] = 1;
  e[0] = 0;

  a->nextNode = 1;
  a->activeNodes = 1;
}

__kernel void I(__global float4* a, __global float4* b, __global uint* c, __global uint* d, __global uint* e, __global uint* f) {
  const uint g = get_global_id(0);
  const uint h = e[g];

  if (c[h] == 1) {
    float4 i = a[g] - b[h];
    const uint j = B(i);
    f[g] = j;
    atomic_add(&d[h * 4 + j], 1);
  }
}

__kernel void J(__global struct tree_global* a, __global float4* b, __global float4* c, __global uint* d, __global uint* e, __global int* f, __global int* g, __global int* h, __global uint* i, __global uint* j, const int k) {
  const uint l = get_global_id(0);
  if (d[l] == 1) {
    int m = -1;
    for (int n = 0; n < 4; n++) {
      uint o = e[l * 4 + n];
      if (o == 0)
        continue;

      uint p = atomic_add(&a->nextNode, 1);
      f[l * 4 + n] = p;
      c[p] = c[l] / 2.0f;
      b[p] = b[l] + c[p] * C(n);
      g[p] = l;
      h[p] = k;
      a->depth = k;
      if (o <= 4) {
        d[p] = 3;
      } else {
        d[p] = 1;
        m++;
      }
    }

    d[l] = 2;
    atomic_add(&a->activeNodes, m);
  }
}

__kernel void K(__global uint* a, __global uint* b, __global int* c, __global uint* d, __global uint* e) {
  const uint f = get_global_id(0);

  if (a[d[f]] == 2) {
    uint g = d[f];
    uint h = e[f];
    uint i = b[g * 4 + h];
    uint j = c[g * 4 + h];

    d[f] = j;

    if (i <= 4) {
      A(c + j * 4, f);
    }
  }
}

__kernel void L(__global float4* a, __global float* b, __global uint* c, __global int* d, __global int* e, __global float* f, __global float4* g, const int h) {
  const uint i = get_global_id(0);

  if (e[i] == h) {
    if (c[i] == 2) {
      float4 j = (float)0;
      float k = (float)0;
      for (uint l = 0; l < 4; l++) {
        int m = d[i * 4 + l];
        if (m < 0)
          continue;
        j += g[m];
        k += f[m];
      }
      g[i] = j / k;
      f[i] = k;
    } else if (c[i] == 3) {
      float4 j = (float)0;
      float k = (float)0;
      for (uint l = 0; l < 4; l++) {
        int n = d[i * 4 + l];
        if (n < 0)
          break;
        j += a[n] * b[n];
        k += b[n];
      }
      g[i] = j / k;
      f[i] = k;
    }
  }
}
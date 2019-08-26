typedef struct {
  union {
    float4 m_min;
    float m_minElems[4];
    int m_minIndices[4];
  };
  union {
    float4 m_max;
    float m_maxElems[4];
    int m_maxIndices[4];
  };
} btAabbCL;

bool A(const btAabbCL* a, __local const btAabbCL* b);
bool A(const btAabbCL* a, __local const btAabbCL* b) {
  bool c = true;
  c = (a->m_min.x > b->m_max.x || a->m_max.x < b->m_min.x) ? false : c;
  c = (a->m_min.z > b->m_max.z || a->m_max.z < b->m_min.z) ? false : c;
  c = (a->m_min.y > b->m_max.y || a->m_max.y < b->m_min.y) ? false : c;
  return c;
}
bool B(__global const btAabbCL* a, __global const btAabbCL* b);
bool B(__global const btAabbCL* a, __global const btAabbCL* b) {
  bool c = true;
  c = (a->m_min.x > b->m_max.x || a->m_max.x < b->m_min.x) ? false : c;
  c = (a->m_min.z > b->m_max.z || a->m_max.z < b->m_min.z) ? false : c;
  c = (a->m_min.y > b->m_max.y || a->m_max.y < b->m_min.y) ? false : c;
  return c;
}

bool C(const btAabbCL* a, __global const btAabbCL* b);
bool C(const btAabbCL* a, __global const btAabbCL* b) {
  bool c = true;
  c = (a->m_min.x > b->m_max.x || a->m_max.x < b->m_min.x) ? false : c;
  c = (a->m_min.z > b->m_max.z || a->m_max.z < b->m_min.z) ? false : c;
  c = (a->m_min.y > b->m_max.y || a->m_max.y < b->m_min.y) ? false : c;
  return c;
}

__kernel void D(__global const btAabbCL* a, __global const btAabbCL* b, volatile __global int2* c, volatile __global int* d, int e, int f, int g, int h) {
  int i = get_global_id(0);
  if (i >= e)
    return;

  int j = get_global_id(1);
  if (j >= f)
    return;

  if (B(&a[i], &b[j])) {
    int2 k;

    k.x = a[i].m_minIndices[3];
    k.y = b[j].m_minIndices[3];

    int l = atomic_add(d, 1);
    if (l < h) {
      c[l] = k;
    }
  }
}

__kernel void E(__global const btAabbCL* a, volatile __global int2* b, volatile __global int* c, int d, int e, int f) {
  int g = get_global_id(0);
  if (g >= d)
    return;
  for (int h = g + 1; h < d; h++) {
    if (a[g].m_maxElems[e] < (a[h].m_minElems[e])) {
      break;
    }
    if (B(&a[g], &a[h])) {
      int2 i;
      i.x = a[g].m_minIndices[3];
      i.y = a[h].m_minIndices[3];
      int j = atomic_add(c, 1);
      if (j < f) {
        b[j] = i;
      }
    }
  }
}

__kernel void F(__global const btAabbCL* a, volatile __global int2* b, volatile __global int* c, int d, int e, int f) {
  int g = get_global_id(0);
  int h = get_local_id(0);

  __local int i[1];
  __local int j[1];

  if (h == 0) {
    i[0] = 0;
    j[0] = 0;
  }
  barrier(1);
  atomic_add(i, 1);
  barrier(1);
  int k = 0;

  int l = g + 1;
  do {
    barrier(1);

    if (l < d) {
      if (a[g].m_maxElems[e] < (a[l].m_minElems[e])) {
        if (!k) {
          atomic_add(j, 1);
          k = 1;
        }
      }
    }

    barrier(1);

    if (l >= d && !k) {
      atomic_add(j, 1);
      k = 1;
    }
    barrier(1);

    if (!k) {
      if (B(&a[g], &a[l])) {
        int2 m;
        m.x = a[g].m_minIndices[3];
        m.y = a[l].m_minIndices[3];
        int n = atomic_add(c, 1);
        if (n < f) {
          b[n] = m;
        }
      }
    }
    l++;

  } while (j[0] < i[0]);
}

__kernel void G(__global const btAabbCL* a, volatile __global int2* b, volatile __global int* c, int d, int e, int f) {
  int g = get_global_id(0);
  int h = get_local_id(0);

  __local int i[1];
  __local int j[1];
  __local btAabbCL k[128];

  btAabbCL l;

  l = (g < d) ? a[g] : a[0];
  float m = l.m_maxElems[e];

  if (h == 0) {
    i[0] = 0;
    j[0] = 0;
  }
  int n = 0;
  int o = 0;
  k[h] = (g + o) < d ? a[g + o] : a[0];
  k[h + 64] = (g + o + 64) < d ? a[g + o + 64] : a[0];

  barrier(1);
  atomic_add(i, 1);
  barrier(1);
  int p = 0;

  int q = g + 1;
  do {
    barrier(1);

    if (q < d) {
      if (m < (k[n + h + 1].m_minElems[e])) {
        if (!p) {
          atomic_add(j, 1);
          p = 1;
        }
      }
    }

    barrier(1);

    if (q >= d && !p) {
      atomic_add(j, 1);
      p = 1;
    }
    barrier(1);

    if (!p) {
      if (A(&l, &k[n + h + 1])) {
        int2 r;
        r.x = l.m_minIndices[3];
        r.y = k[n + h + 1].m_minIndices[3];
        int s = atomic_add(c, 1);
        if (s < f) {
          b[s] = r;
        }
      }
    }

    barrier(1);

    n++;
    if (n == 64) {
      n = 0;
      o += 64;
      k[h] = ((g + o) < d) ? a[g + o] : a[0];
      k[h + 64] = ((g + 64 + o) < d) ? a[g + o + 64] : a[0];
    }
    q++;

  } while (j[0] < i[0]);
}

unsigned int H(float a);
unsigned int H(float a) {
  unsigned int b = *(unsigned int*)&a;
  unsigned int c = -(int)(b >> 31) | 0x80000000;
  return b ^ c;
}
float I(unsigned int a);
float I(unsigned int a) {
  unsigned int b = ((a >> 31) - 1) | 0x80000000;
  unsigned int c = a ^ b;
  return *(float*)&c;
}

__kernel void J(__global const btAabbCL* a, __global btAabbCL* b, int c) {
  int d = get_global_id(0);
  if (d >= c)
    return;
  int e = b[d].m_maxIndices[3];
  b[d] = a[e];
  b[d].m_maxIndices[3] = e;
}

__kernel void K(__global const btAabbCL* a, volatile __global int2* b, int c, int d) {
  int e = get_global_id(0);
  if (e >= c)
    return;

  b[e].x = H(a[e].m_minElems[d]);
  b[e].y = e;
}

__kernel void L(__global const btAabbCL* a, volatile __global const int2* b, __global btAabbCL* c, int d) {
  int e = get_global_id(0);
  if (e >= d)
    return;

  c[e] = a[b[e].y];
}
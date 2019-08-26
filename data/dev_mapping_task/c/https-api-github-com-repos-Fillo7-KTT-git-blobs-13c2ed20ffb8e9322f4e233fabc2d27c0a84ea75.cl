typedef float DATA_TYPE; __kernel void A(__global DATA_TYPE* a, __global DATA_TYPE* b, __global DATA_TYPE* c, int d, int e) {
  int f = get_global_id(0);

  if (f < e) {
    c[f] = 0.0;

    int g;
    for (g = 0; g < d; g++) {
      c[f] += a[f * d + g] * b[g];
    }
  }
}

__kernel void B(__global DATA_TYPE* a, __global DATA_TYPE* b, __global DATA_TYPE* c, int d, int e) {
  int f = get_global_id(0);

  if (f < d) {
    c[f] = 0.0;

    int g;
    for (g = 0; g < e; g++) {
      c[f] += a[g * d + f] * b[g];
    }
  }
}

inline void C(volatile __global float* a, float b) {
  union {
    unsigned int u32;
    float f32;
  } c, d, e;
  e.f32 = *a;
  do {
    d.f32 = e.f32;
    c.f32 = d.f32 + b;
    e.u32 = atomic_cmpxchg((volatile __global unsigned int*)a, d.u32, c.u32);
  } while (e.u32 != d.u32);
}

__kernel void D(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, int f, int g) {
  int h = get_local_id(0);
  int i = get_local_id(1);
  int j = get_group_id(0);
  int k = get_group_id(1);
  int l = get_global_size(1);

  __local float m[32][33];
  __local float n[32];
  __local float o[32];

  float p = 0.0f;

  if (i == 0)
    o[h] = d[j * 32 + h];
  for (int q = f * k; q < f * (k + 1); q += 32) {
    if (i == 1)
      n[h] = b[q + h];
    barrier(1);

    for (int r = 0; r < 32; r += 32 / 8) {
      m[i + r][h] = a[(q + i + r) * g + j * 32 + h];
      p += m[i + r][h] * n[i + r];
    }
    barrier(1);
    float s = 0.0f;

    for (int r = 0; r < 32; r += 32 / 8)
      s += m[h][i + r] * o[i + r];
    m[h][i] = s;
    barrier(1);

    if (i < 2)
      m[h][i] = s = s + m[h][i + 2];
    barrier(1);

    if (i == 0) {
      C(e + q + h, s + m[h][1]);
    }
  }

  barrier(1);
  m[i][h] = p;
  barrier(1);
  if (i < 2) {
    m[i][h] = p = p + m[i + 2][h];
  }
  barrier(1);
  if (i == 0) {
    C(c + j * 32 + h, p + m[1][h]);
  }
}
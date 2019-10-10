inline void A(__local float* a, unsigned int b, unsigned int c, unsigned int d) {
  float e = 0;
  unsigned int f = c * d;

  for (unsigned int g = 0; g < d; g += b) {
    e += a[f + g];
  }
  a[f] = e;
}

inline void B(float* a, __local float* b, unsigned int c, float d) {
  b[c] = *a;
  barrier(1);
  if (c < (256 >> 2))
    A(b, 1, c, 4);
  barrier(1);
  if (c < (256 >> 4))
    A(b, 4, c, 16);
  barrier(1);
  if (c == 0)
    A(b, 16, c, 256);
  barrier(1);
  *a = b[0] * d;
}

inline void C(float* a, float b) {
  float c = 0.;
  *a += __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x111, 0xF, 0xF, 0), float);
  *a += __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x112, 0xF, 0xF, 0), float);
  *a += __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x114, 0xF, 0xF, 0), float);
  *a += __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x118, 0xF, 0xF, 0), float);
  c = __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x142, 0xF, 0xF, 0), float);
  *a += c;
  c = __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x143, 0xF, 0xF, 0), float);
  *a += c;
  *a = __builtin_astype(__builtin_amdgcn_readlane(__builtin_astype(*a, int), 63), float);
  *a *= b;
}

inline void D(float* a, float b) {
  *a += __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x101, 0xF, 0xF, 0), float);
  *a += __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x102, 0xF, 0xF, 0), float);
  *a += __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x104, 0xF, 0xF, 0), float);
  *a += __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x108, 0xF, 0xF, 0), float);
  *a = __builtin_astype(__builtin_amdgcn_readlane(__builtin_astype(*a, int), 0), float);
  *a *= b;
}

inline void E(float* a, __local float* b, unsigned int c, float d) {
  float e = 0.;
  *a = b[c];
  *a += __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x111, 0xF, 0xF, 0), float);
  *a += __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x112, 0xF, 0xF, 0), float);
  *a += __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x114, 0xF, 0xF, 0), float);
  *a += __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x118, 0xF, 0xF, 0), float);
  e = __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x142, 0xF, 0xF, 0), float);
  *a += e;
  e = __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x143, 0xF, 0xF, 0), float);
  *a += e;
  if (c == 63)
    b[0] = *a * d;
  barrier(1);
  *a = b[0];
}

inline void F(float* a, __local float* b, unsigned int c, float d) {
  *a += __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x101, 0xF, 0xF, 0), float);
  *a += __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x102, 0xF, 0xF, 0), float);
  *a += __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x104, 0xF, 0xF, 0), float);
  *a += __builtin_astype(__builtin_amdgcn_mov_dpp(__builtin_astype(*a, int), 0x108, 0xF, 0xF, 0), float);
  if (c == 0)
    b[0] = *a * d;
  barrier(1);
  *a = b[0];
}
__attribute__((reqd_work_group_size(1, 1, 1))) __kernel void G(const __global float* __restrict a, __global float* __restrict b, const __global float* __restrict c, const __global float* __restrict d) {
  float e = 0.;
  float f = 0.;
  float g = 0.;
  float h = 0.;
  float i = 0.;

  __local float j, k, l, m;

  unsigned int n = get_group_id(1);
  unsigned int o = get_global_id(0);
  unsigned int p = get_global_id(1);
  unsigned int q = get_local_size(1);
  unsigned int r;
  unsigned int s = o * 1;
  unsigned int t = s + q * n + 1;
  unsigned int u = s + q * n + 3;

  if (get_local_id(1) == 0) {
    l = c[o];
    m = d[o];
    j = b[t];
    k = b[u];
  }
  barrier(1);

  if (p < 1) {
    e = j;
    f = k;
    h = l;
    i = m;
    for (unsigned int v = 0; v < 1; v++) {
      r = v * 1 + s + p;
      g = (a[r] - e) * f;

      b[r] = mad(h, g, i);
    }
  }
}

__attribute__((reqd_work_group_size(1, 1, 1))) __kernel void H(__global float* __restrict a, float b

                                                               ,
                                                               double c

                                                               ) {
  __private float d = 0.;
  __private float e = 0.;

  unsigned int f = get_local_id(1);
  unsigned int g = get_group_id(1);
  unsigned int h = get_global_id(0);
  unsigned int i = get_local_size(1);
  unsigned int j = get_num_groups(1);
  unsigned int k = h * 1;
  unsigned int l = k + i * g + 3;
  unsigned int m = 0;

  for (int n = 0; n < j; n++) {
    unsigned int o = n * i + f;
    unsigned int p = k + i * o + 2;
    if (o < j) {
      d += a[p];
    }
  }
  m = 0;

  __local float q[16];
  q[f] = d;
  barrier(1);
  d = 0.;
  for (int r = 0; r < 1; r++) {
    d += q[r];
  }
  d *= b;

  e = (1.f / sqrt(d + c));
  if (f == m) {
    a[l] = e;
  }
}

__attribute__((reqd_work_group_size(1, 1, 1))) __kernel void I(const __global float* __restrict a, __global float* __restrict b) {
  float c = 0.;
  float d, e;

  __local float f[256];
  __local float g;
  unsigned int h = get_local_id(1);
  unsigned int i = get_group_id(1);
  unsigned int j = get_global_id(0);
  unsigned int k = get_global_id(1);
  unsigned int l = get_local_size(1);
  unsigned int m = j * 1;
  unsigned int n;

  unsigned int o = m + l * i + 1;

  if (h == 0) {
    g = b[o];
  }
  barrier(1);

  if (k < 1) {
    d = g;
    for (unsigned int p = 0; p < 1; p++) {
      n = p * 1 + m + k;
      e = (a[n] - d);
      c += e * e;
    }
  }

  f[h] = c;
  barrier(1);
  for (unsigned int q = (1 >> 1); q > 256; q >>= 1) {
    if (h < q)
      f[h] += f[h + q];
    barrier(1);
  }
  B(&c, f, h, 1);

  if (h == 0) {
    unsigned int r = m + l * i + 2;
    b[r] = c;
  }
}

__attribute__((reqd_work_group_size(1, 1, 1))) __kernel void J(__global float* __restrict a, float b) {
  float c = 0.;
  unsigned int d = get_local_id(1);
  unsigned int e = get_group_id(1);
  unsigned int f = get_global_id(0);
  unsigned int g = get_local_size(1);
  unsigned int h = get_num_groups(1);
  unsigned int i = f * 1;
  unsigned int j = 0;

  for (int k = 0; k < h; k++) {
    unsigned int l = k * g + d;
    unsigned int m = i + g * l;
    if (l < h) {
      c += a[m];
    }
  }
  __local float n[256];
  B(&c, n, d, b);
  j = 0;
  if (d == j) {
    unsigned int o = i + g * e + 1;
    a[o] = c;
  }
}

__attribute__((reqd_work_group_size(1, 1, 1))) __kernel void K(const __global float* __restrict a, __global float* __restrict b) {
  __local float c[256];

  unsigned int d = get_local_id(1);
  unsigned int e = get_group_id(1);
  unsigned int f = get_global_id(0);
  unsigned int g = get_global_id(1);
  unsigned int h = get_local_size(1);
  unsigned int i;
  unsigned int j = f * 1;
  unsigned int k = j + h * e;
  float l = 0.;

  if (g < 1) {
    for (unsigned int m = 0; m < 1; m++) {
      i = m * 1 + j + g;
      l += a[i];
    }
  }

  c[d] = l;
  barrier(1);
  for (unsigned int n = (1 >> 1); n > 256; n >>= 1) {
    if (d < n)
      c[d] += c[d + n];
    barrier(1);
  }
  B(&l, c, d, 1);

  if (d == 0) {
    b[k] = l;
  }
}
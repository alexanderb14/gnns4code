__attribute__((reqd_work_group_size(64, 1, 1))) __kernel void A(__global volatile float* a, int b, int c) {
  int d, e;
  int f = get_local_id(0);
  __local float __attribute__((memory, numbanks(2), bankwidth(4 * 2), doublepump, numreadports(3), numwriteports(1))) g[64 * 64], __attribute__((memory, numbanks(2), bankwidth(4 * 2), doublepump, numreadports(3), numwriteports(1))) h[64 * 64];

  int i = c * b + c;
  for (d = 0; d < 64; d++) {
    g[d * 64 + f] = a[i + f];
    h[f * 64 + d] = a[i + f];
    i += b;
  }

  barrier(1);

  for (d = 0; d < 64 - 1; d++) {
    if (f > d) {
      float j = 0.0f;
      for (e = 0; e < d; e++) {
        j += g[f * 64 + e] * h[d * 64 + e];
      }
      g[f * 64 + d] = (g[f * 64 + d] - j) / h[d * 64 + d];
      h[d * 64 + f] = g[f * 64 + d];
    }

    barrier(1);

    if (f > d) {
      float j = 0.0f;
      for (e = 0; e < d + 1; e++) {
        j += g[(d + 1) * 64 + e] * h[f * 64 + e];
      }
      g[(d + 1) * 64 + f] -= j;
      h[f * 64 + (d + 1)] = g[(d + 1) * 64 + f];
    }

    barrier(1);
  }

  i = (c + 1) * b + c;
  for (d = 1; d < 64; d++) {
    a[i + f] = g[d * 64 + f];
    i += b;
  }
}

__attribute__((num_compute_units(2))) __attribute__((num_simd_work_items(1))) __attribute__((max_work_group_size(2 * 64))) __kernel void B(__global volatile float* a, int b, int c) {
  int d, e, f, g;
  __local float h[64 * 64], i[64 * 64];

  int j = get_group_id(0);
  int k = get_local_id(0);

  f = c * b + c;
  g = c * b + (j + 1) * 64 + c;
  for (d = 0; d < 64; d++) {
    h[d * 64 + k] = a[f + k];
    i[k * 64 + d] = a[g + k];

    f += b;
    g += b;
  }

  barrier(1);

  f = c * b + (j + 1) * 64 + c;
  for (d = 0; d < 64; d++) {
    float l = 0.0f;
    for (e = 0; e < d; e++) {
      l += h[d * 64 + e] * i[k * 64 + e];
    }
    i[k * 64 + d] -= l;

    a[f + k] = i[k * 64 + d];
    f += b;
  }
}

__attribute__((num_compute_units(2))) __attribute__((num_simd_work_items(1))) __attribute__((max_work_group_size(2 * 64))) __kernel void C(__global volatile float* a, int b, int c) {
  int d, e, f, g;
  __local float h[64 * 64], i[64 * 64];

  int j = get_group_id(0);
  int k = get_local_id(0);

  f = c * b + c;
  g = (c + (j + 1) * 64) * b + c;
  for (d = 0; d < 64; d++) {
    h[k * 64 + d] = a[f + k];
    i[d * 64 + k] = a[g + k];

    f += b;
    g += b;
  }

  barrier(1);

  for (d = 0; d < 64; d++) {
    float l = 0.0f;
    for (e = 0; e < d; e++) {
      l += h[d * 64 + e] * i[k * 64 + e];
    }
    i[k * 64 + d] = (i[k * 64 + d] - l) / h[d * 64 + d];
  }

  f = (c + (j + 1) * 64) * b + c;
  for (d = 0; d < 64; d++) {
    a[f + k * b + d] = i[k * 64 + d];
  }
}

__attribute__((num_compute_units(3))) __attribute__((num_simd_work_items(1))) __attribute__((reqd_work_group_size(64, 64, 1))) __kernel void D(__global float* a, int b, int c) {
  int d;
  float e;
  __local float f[64 * 64], g[64 * 64];

  int h = get_group_id(0);
  int i = get_group_id(1);

  int j = get_local_id(0);
  int k = get_local_id(1);

  int l = c + (i + 1) * 64;
  int m = c + (h + 1) * 64;

  f[k * 64 + j] = a[(c + k) * b + m + j];
  g[k * 64 + j] = a[(l + k) * b + c + j];

  barrier(1);

  e = 0;
  for (d = 0; d < 64; d++) {
    e += g[k * 64 + d] * f[d * 64 + j];
  }
  a[(l + k) * b + m + j] -= e;
}
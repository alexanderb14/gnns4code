__kernel void A(__global int* a, __global int* b, __global int* c, int d, int e, __local int* f, __local int* g, int h) {
  int i, j, k;
  int l = get_global_id(0);
  int m = get_global_id(1);
  int n = get_local_id(0);
  int o = get_local_id(1);

  i = 0;
  for (int p = 0; p < e / h; p++) {
    f[o * h + n] = a[m * d + p * h + n];
    g[o * h + n] = b[(p * h + o) * d + l];
    barrier(1);

    for (int q = 0; q < h; q++) {
      j = f[o * h + q];
      k = g[q * h + n];
      i += j + k;
      i += j - k;
      i += j * k;
      i += j / k;
      i += j < k;
      i += j > k;
      i += j & k;
      i += j | k;
    }
    barrier(1);
  }
  c[m * d + l] = i;
}
__kernel void B(__global int* a, __global int* b, __global int* c, int d, int e, __local int* f, __local int* g, int h) {
  int i, j, k;
  int l = get_global_id(0);
  int m = get_global_id(1);
  int n = get_local_id(0);
  int o = get_local_id(1);

  i = 0;
  for (int p = 0; p < e / h; p++) {
    f[o * h + n] = a[m * d + p * h + n];
    g[o * h + n] = b[(p * h + o) * d + l];
    barrier(1);

    for (int q = 0; q < h; q++) {
      j = f[o * h + q];
      k = g[q * h + n];
      i += j + k;
    }
    barrier(1);
  }
  c[m * d + l] = i;
}
__kernel void C(__global int* a, __global int* b, __global int* c, int d, int e, __local int* f, __local int* g, int h) {
  int i, j, k;
  int l = get_global_id(0);
  int m = get_global_id(1);
  int n = get_local_id(0);
  int o = get_local_id(1);

  i = 0;
  for (int p = 0; p < e / h; p++) {
    f[o * h + n] = a[m * d + p * h + n];
    g[o * h + n] = b[(p * h + o) * d + l];
    barrier(1);

    for (int q = 0; q < h; q++) {
      j = f[o * h + q];
      k = g[q * h + n];
      i += j + k;
      i += j - k;
      i += j * k;
      i += j / k;
    }
    barrier(1);
  }
  c[m * d + l] = i;
}
__kernel void D(__global int* a, __global int* b, __global int* c, int d, int e, __local int* f, __local int* g, int h) {
  int i, j, k;
  int l = get_global_id(0);
  int m = get_global_id(1);
  int n = get_local_id(0);
  int o = get_local_id(1);

  i = 0;
  for (int p = 0; p < e / h; p++) {
    f[o * h + n] = a[m * d + p * h + n];
    g[o * h + n] = b[(p * h + o) * d + l];
    barrier(1);

    for (int q = 0; q < h; q++) {
      j = f[o * h + q];
      k = g[q * h + n];
      i += j + k;
      i += j * k;
    }
    barrier(1);
  }
  c[m * d + l] = i;
}
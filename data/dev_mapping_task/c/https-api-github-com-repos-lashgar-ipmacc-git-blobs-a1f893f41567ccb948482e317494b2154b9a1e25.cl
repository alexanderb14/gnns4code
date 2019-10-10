__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, __local float* e, __local float* f, int g, int h) {
  int i = get_group_id(1);
  int j = get_local_id(0);
  int k = get_local_id(1);

  int l = (h + 1) * 16 * i + (h + 1) * k + j + 1 + (h + 1);

  int m = 16 * i + k + 1;

  if (j == 0)
    e[k] = a[m];
  barrier(1);

  f[k * 16 + j] = c[l];
  barrier(1);

  f[k * 16 + j] = f[k * 16 + j] * e[k];
  barrier(1);

  for (int n = 1; n <= log2((float)16); n++) {
    int o = __clc_pow((float)2, n);

    if (k % o == 0)
      f[k * 16 + j] = f[k * 16 + j] + f[(k + o / 2) * 16 + j];

    barrier(1);
  }

  c[l] = f[k * 16 + j];

  barrier(1);

  if (j == 0) {
    d[i * h + k] = f[j * 16 + k];
  }
}

__kernel void B(__global float* a, int b, __global float* c, int d, __global float* e, __global float* f) {
  int g = get_group_id(1);
  int h = get_local_id(0);
  int i = get_local_id(1);

  int j = (b + 1) * 16 * g + (b + 1) * i + h + 1 + (b + 1);
  int k = 16 * g + i + 1;
  int l = h + 1;

  e[j] += ((0.3f * a[l] * c[k]) + (0.3f * f[j]));
  f[j] = ((0.3f * a[l] * c[k]) + (0.3f * f[j]));

  barrier(1);

  if (i == 0 && g == 0) {
    e[l] += ((0.3f * a[l]) + (0.3f * f[l]));
    f[l] = ((0.3f * a[l]) + (0.3f * f[l]));
  }
}
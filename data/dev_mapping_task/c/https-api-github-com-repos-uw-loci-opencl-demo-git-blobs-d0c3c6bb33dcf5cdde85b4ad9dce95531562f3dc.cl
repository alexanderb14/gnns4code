__kernel void A(__global float* a, __global float* b, __global float* c, int d, int e, int f, int g) {
  int h = get_global_id(0);
  int i = h * d * 2;
  int j = i;
  int k = j + d;
  int l = j + d / 2;
  int m = l + d;
  float n = a[f + j];
  a[f + j] = a[f + j] + a[f + k];
  a[f + k] = n - a[f + k];
  n = a[f + l];
  a[f + l] = a[f + l] + a[f + m];
  a[f + m] = n - a[f + m];
  float o = 0;

  for (int p = 1; p < g; p++) {
    int j = p + i;
    int k = j + d;
    int l = d - g + i;
    int m = l + d;

    int q = g * e;
    n = a[f + k] * b[q] + a[f + m] * c[q];
    o = a[f + m] * b[q] - a[f + k] * c[q];

    a[f + k] = a[f + j] - n;
    a[f + j] = a[f + j] + n;
    a[f + m] = a[f + l] + o;
    a[f + l] = a[f + l] - o;
  }
};
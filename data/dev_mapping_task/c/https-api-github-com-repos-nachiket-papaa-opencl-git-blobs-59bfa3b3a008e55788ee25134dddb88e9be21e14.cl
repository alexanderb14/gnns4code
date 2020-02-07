__kernel void A(__global float* a, __constant float* b, __global float* c, const int d, const int e, const float f, __local float* g) {
  int h = get_local_id(0);
  int i = get_local_id(1);

  int j = get_global_id(1);

  const int k = get_global_size(0);
  const int l = get_global_size(1);

  g[i * (k + d - 1) + h] = a[j * (k + d - 1) + h];
  if (i > (get_local_size(1) - e)) {
    g[(i + e - 1) * (k + d - 1) + h] = a[(j + e - 1) * (k + d - 1) + h];
  }
  barrier(1);

  float m = 0;
  for (int n = 0; n < e; n++) {
    for (int o = 0; o < d; o++) {
      m += b[n * d + o] * g[(i + n) * (k + d - 1) + h + o];
    }
  }
  c[j * k + h] = m + f;
}
__kernel void A(const __global float* a, __constant float* b, __global float* c, const int d, const int e, const int f, const __global float* g) {
  const int h = get_global_size(0);
  const int i = get_global_size(1);

  const int j = get_global_id(0);
  const int k = get_global_id(1);

  __local float l[28 * 28];

  l[j * h + k] = a[j * h + k];
  barrier(1);

  float m = 0;
  int n = 0;

  for (int o = 0; o < d; o++) {
    for (n = 0; n < d; n++) {
      m += b[o * d + n] * l[((k + o) * h + j) + n];
    }
  }
  c[k * h + j] = m + *g;
}
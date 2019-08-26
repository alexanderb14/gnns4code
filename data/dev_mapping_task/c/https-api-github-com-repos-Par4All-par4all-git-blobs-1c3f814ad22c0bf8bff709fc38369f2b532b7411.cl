__kernel void A(const __global float* a, __constant float* b, __global float* c, const int d, const int e) {
  const int f = get_global_size(0);

  const int g = get_global_id(0);
  const int h = get_global_id(1);

  const int i = g;
  const int j = h;

  float k = 0;
  for (int l = 0; l < e; l++) {
    const int m = l * e;

    const int n = j + l;
    const int o = n * d + i;

    for (int p = 0; p < e; p++) {
      const int q = m + p;
      const int r = o + p;
      k += b[q] * a[r];
    }
  }
  const int s = h * f + g;
  c[s] = k;
}
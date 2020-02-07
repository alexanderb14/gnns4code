__kernel void A(__global float* a, __global float* b, const int c, const int d, const int e, const int f, const int g, __local float* h, __constant float* i) {
  const int j = (g - f) / 2;

  const int k = get_local_size(0);
  const int l = get_local_size(0) - f + 1;

  const int m = get_local_id(0);
  const int n = get_local_id(1);

  const int o = get_group_id(0) * l + m;
  const int p = get_group_id(1) * l + n;

  const int q = d + g - 1;
  const int r = e + g - 1;

  for (int s = 0; s < 2 * c * c; s++) {
    if ((o < q) && (p < r)) {
      h[m * k + n] = a[s * q * r + (j + o) * r + j + p];
    }

    barrier(1);

    float t = 0;

    if ((m < l) && (n < l)) {
      for (int u = 0; u < f; u++) {
        for (int v = 0; v < f; v++) {
          t += i[u * f + v] * h[(m + u) * k + n + v];
        }
      }
      if (o < d && p < e) {
        b[s * d * e + o * e + p] = t;
      }
    }
  }
}
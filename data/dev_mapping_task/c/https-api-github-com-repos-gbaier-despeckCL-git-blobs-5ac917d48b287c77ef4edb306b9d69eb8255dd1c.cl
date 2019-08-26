__kernel void A(__global float* a, __global float* b, const int c, const int d, const int e, const int f, __local float* g, __local float* h) {
  const int i = (f - e) / 2;

  const int j = c - f + 1;
  const int k = d - f + 1;

  const int l = get_local_size(0) - e + 1;

  const int m = get_local_id(0);
  const int n = get_local_id(1);
  const int o = get_global_id(2);

  const int p = get_group_id(0) * l + m;
  const int q = get_group_id(1) * l + n;

  if ((p < c) && (q < d)) {
    g[m * get_local_size(1) + n] = a[o * c * d + (i + p) * d + i + q];
  } else {
    g[m * get_local_size(1) + n] = 0;
  }

  barrier(1);

  float r = 0;

  if (n < l) {
    for (int s = 0; s < e; s++) {
      r += g[m * get_local_size(1) + n + s];
    }
    h[m * l + n] = r;
  }

  barrier(1);
  if (m < l) {
    for (int t = 1; t < e; t++) {
      r += h[(m + t) * l + n];
    }
  }

  if ((m < l) && (n < l)) {
    if (p < j && q < k) {
      b[o * j * k + p * k + q] = r;
    }
  }
}
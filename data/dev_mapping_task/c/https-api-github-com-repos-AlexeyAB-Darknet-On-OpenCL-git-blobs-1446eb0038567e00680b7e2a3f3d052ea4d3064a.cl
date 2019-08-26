__kernel void A(const int a, __global const float* b, const int c, const int d, const int e, const int f, const int g, const int h, const int i, __global float* j) {
  int k = get_global_id(1) * get_global_size(0) + get_global_id(0);
  for (; k < a; k += get_global_size(1) * get_global_size(0)) {
    float l = 0;
    int m = k % d + f;
    int n = (k / d) % c + f;
    int o = k / (d * c);

    int p = (m < e) ? 0 : (m - e) / g + 1;
    int q = min(m / g + 1, i);
    int r = (n < e) ? 0 : (n - e) / g + 1;
    int s = min(n / g + 1, h);

    int t = (o * e * e + n * e + m) * h * i;
    int u = (1 - g * e * h) * i;
    int v = (1 - g * h * i);
    for (int w = r; w < s; ++w) {
      for (int x = p; x < q; ++x) {
        l += b[t + w * u + x * v];
      }
    }
    j[k] += l;
  }
}
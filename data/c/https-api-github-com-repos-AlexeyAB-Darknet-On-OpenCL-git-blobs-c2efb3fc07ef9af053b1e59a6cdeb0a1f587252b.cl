__kernel void A(const int a, __global const float* b, const int c, const int d, const int e, const int f, const int g, const int h, const int i, __global float* j) {
  int k = get_global_id(1) * get_global_size(0) + get_global_id(0);
  for (; k < a; k += get_global_size(1) * get_global_size(0)) {
    int l = k % i;
    int m = k / i;
    int n = m % h;
    int o = m / h;
    int p = o * e * e;
    int q = n * g - f;
    int r = l * g - f;

    int s = (p * h + n) * i + l;
    int t = (o * c + q) * d + r;
    for (int u = 0; u < e; ++u) {
      for (int v = 0; v < e; ++v) {
        int w = q + u;
        int x = r + v;

        j[s] = (w >= 0 && x >= 0 && w < c && x < d) ? b[t + u * d + v] : 0;

        s += h * i;
      }
    }
  }
}
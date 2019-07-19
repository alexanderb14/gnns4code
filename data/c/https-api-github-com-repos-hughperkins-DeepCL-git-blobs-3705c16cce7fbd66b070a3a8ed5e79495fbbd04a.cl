void kernel A(const int a, const int b, const int c, const int d, const int e, const int f, global const float* g, global const float* h, global float* i) {
  int j = get_global_id(0);
  const int k = c >> 1;
  const int l = f ? k : 0;

  const int m = b * b;
  const int n = j / m;

  const int o = j % m;
  const int p = o / b;
  const int q = o % b;

  const int r = n % a;
  const int s = n / a;

  const int t = max(0, p + l - (e - 1));
  const int u = min(c - 1, p + l);
  const int v = max(0, q + l - (e - 1));
  const int w = min(c - 1, q + l);

  float x = 0;

  for (int y = 0; y < d; y++) {
    for (int z = t; z <= u; z++) {
      int aa = p + l - z;
      for (int ab = v; ab <= w; ab++) {
        int ac = q + l - ab;
        int ad = ((s * d + y) * e + aa) * e + ac;
        float ae = h[ad];
        int af = ((y * a + r) * c + z) * c + ab;
        float ag = g[af];
        float ah = ag * ae;
        x += ah;
      }
    }
  }
  i[j] = x;
}
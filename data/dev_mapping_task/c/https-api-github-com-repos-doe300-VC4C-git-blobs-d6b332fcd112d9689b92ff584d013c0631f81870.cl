__kernel void A(global float* a, const int b, const int c, const int d, const int e, const int f, const int g, const int h, const int i, const int j, const int k, const int l, const int m, global float* n, size_t o) {
  global float* p = n + o;
  int q = (int)get_global_id(0);

  int r = q / (m * l);
  int s = q % (m * l);
  int t = (s / m) + f;
  int u = (s % m) + g;

  int v = (t < j * (d - 1) + 1) ? 0 : (t - (j * (d - 1) + 1)) / h + 1;
  int w = min(b, t / h + 1);
  int x = (u < k * (e - 1) + 1) ? 0 : (u - (k * (e - 1) + 1)) / i + 1;
  int y = min(c, u / i + 1);

  int z = r * c * b * e * d;
  a += z;

  float aa = 0.0f;
  for (int ab = v; ab < w; ab++) {
    for (int ac = x; ac < y; ac++) {
      if ((t - ab * h) % j == 0 && (u - ac * i) % k == 0) {
        int ad = ab + (((t - ab * h) / j) * e * b);
        int ae = ac + (((u - ac * i) / k) * c * b);

        aa += a[ad * c + ae];
      }
    }
  }
  p[q] = aa;
}
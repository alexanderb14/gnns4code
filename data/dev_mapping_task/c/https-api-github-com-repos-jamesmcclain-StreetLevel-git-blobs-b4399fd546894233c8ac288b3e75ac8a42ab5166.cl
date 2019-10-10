int A(int a, int b, int c) {
  int d = a * (1 << (5));
  int e = b >> (5);
  int f = c >> (5);
  int g = (f * d) + (e * (1 << (5)) * (1 << (5)));

  int h = (1 << (5)) * (1 << (2));
  int i = (b & (0x1f)) >> (2);
  int j = (c & (0x1f)) >> (2);
  int k = (j * h) + (i * (1 << (2)) * (1 << (2)));

  int l = (1 << (2));
  int m = b & (0x03);
  int n = c & (0x03);
  int o = (n * l) + m;

  return g + k + o;
}

int B(int a, int b, int c) {
  return (c * a) + b;
}

__kernel void C(__global float* a, __global float* b, __global float* c, int d, int e, int f, int g, float h, float i, float j, int k, int l, int m, int n, int o, int p) {
  int q = get_global_id(0);
  int r = q * o;

  if (!(r < e) && (r - o < e))
    r = e - 1;

  if (r < e) {
    float s = ((float)(r - g)) / (d - f);
    float t = sqrt(i * i + s * s * j * j);
    float u = g + ((m - f) * s);
    float v = (1 / 0x1.fffffep127f) + ((m - f) * t);
    float w;

    if (m == f)
      w = -__builtin_inff();
    else
      w = c[r];

    for (int x = m; x < n; ++x, u += s, v += t) {
      int y;
      if (!k && !l)
        y = A(d, x, convert_int(u));
      else if (k && !l)
        y = A(d, (d - 1 - x), convert_int(u));
      else if (!k && l)
        y = A(e, convert_int(u), x);
      else if (k && l)
        y = A(e, convert_int(u), (d - 1 - x));
      float z = 6378137 * (1 - cos(v / 6378137));
      float aa = a[y] - h - z;
      float ab = aa / v;

      if (w < ab) {
        if (!k && !l)
          y = B(d, x, convert_int(u));
        else if (k && !l)
          y = B(d, (d - x - 1), convert_int(u));
        else if (!k && l)
          y = B(e, convert_int(u), x);
        else if (k && l)
          y = B(e, convert_int(u), (d - x - 1));
        w = ab;
        b[y] = 1.0;
      }
    }

    for (int ac = r; (ac < r + o) && (ac < e); ++ac)
      c[ac] = w;
  }
}
typedef unsigned char fixed8; void A(global unsigned char* a, global unsigned char* b, global unsigned char* c, global unsigned char* d, int e, int f, int g, int h, int i, int j, int k, int l, int m) {
  int n = m * (f >= h) * h;
  int o = ((((f + 1) - n) < h) ? (j) : (-(j)));
  int p = ((f - n) ? (-(j)) : (j));
  int q = (((f - n == 1) || (f - n + 2 == h)) ? (2) : (l));
  int r;

  global unsigned char* s = i ? b : c;
  global unsigned char* t = i ? c : d;
  int u = e + f * j;
  int v = e + f * k;
  int w = c[u + p];
  int x = (s[u] + t[u]) >> 1;
  int y = c[u + o];
  int z = abs((s[u]) - (t[u]));
  int aa = (abs(b[u + p] - w) + abs(b[u + o] - y)) >> 1;
  int ab = (abs(d[u + p] - w) + abs(d[u + o] - y)) >> 1;
  int ac = max(max(z >> 1, aa), ab);
  int ad = (w + y) >> 1;
  int ae = abs(c[u + p - 1] - c[u + o - 1]) + abs(w - y) + abs(c[u + p + 1] - c[u + o + 1]) - 1;

  r = abs(c[u + p - 2] - c[u + o]) + abs(c[u + p - 1] - c[u + o + 1]) + abs(c[u + p] - c[u + o + 2]);
  if (r < ae) {
    ae = r;
    ad = (c[u + p - 1] + c[u + o + 1]) >> 1;
  }

  r = abs(c[u + p - 3] - c[u + o + 1]) + abs(c[u + p - 2] - c[u + o + 2]) + abs(c[u + p - 1] - c[u + o + 3]);
  if (r < ae) {
    ae = r;
    ad = (c[u + p - 2] + c[u + o + 2]) >> 1;
  }

  r = abs(c[u + p] - c[u + o - 2]) + abs(c[u + p + 1] - c[u + o - 1]) + abs(c[u + p + 2] - c[u + o]);
  if (r < ae) {
    ae = r;
    ad = (c[u + p + 1] + c[u + o - 1]) >> 1;
  }

  r = abs(c[u + p + 1] - c[u + o - 3]) + abs(c[u + p + 2] - c[u + o - 2]) + abs(c[u + p + 3] - c[u + o - 1]);
  if (r < ae) {
    ae = r;
    ad = (c[u + p + 2] + c[u + o - 2]) >> 1;
  }
  if (q < 2) {
    int af = (s[u + (p << 1)] + t[u + (p << 1)]) >> 1;
    int ag = (s[u + (o << 1)] + t[u + (o << 1)]) >> 1;
    int ah = max(max(x - y, x - w), min(af - w, ag - y));
    int ai = min(min(x - y, x - w), max(af - w, ag - y));

    ac = max(max(ac, ai), -ah);
  }
  if (ad > x + ac) {
    ad = x + ac;
  } else if (ad < x - ac) {
    ad = x - ac;
  }

  a[v] = ad;
}

kernel void B(global unsigned char* a, global unsigned char* b, global unsigned char* c, global unsigned char* d, int e, int f, int g, int h, int i, int j) {
  int k = get_global_id(0);
  int l = (get_global_id(1) << 1) + (!e);
  int m = (get_global_size(0) << 1) / 3;
  int n = get_global_size(1) << 1;

  global unsigned char* o = a;
  global unsigned char* p = o + n * h;

  global unsigned char* q = b;
  global unsigned char* r = q + n * f;

  global unsigned char* s = c;
  global unsigned char* t = s + n * f;

  global unsigned char* u = d;
  global unsigned char* v = u + n * f;

  if (k < m) {
    A(o, q, s, u, k, l, m, n, e, f, h, j, 0);
  } else {
    k = k - m;
    A(p, r, t, v, k, l, m >> 1, n >> 1, e, g, i, j, 1);
  }
}
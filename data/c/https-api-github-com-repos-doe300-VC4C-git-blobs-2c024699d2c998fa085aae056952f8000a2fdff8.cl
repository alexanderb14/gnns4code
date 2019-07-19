typedef unsigned char fixed8; kernel void A(global fixed8* a, global float* b, global float* c, global int* d, global int* e, global fixed8* f, int g, int h) {
  int i = get_global_id(0);
  int j = get_global_id(1);
  int k = get_global_size(0);
  int l = get_global_size(1);
  float m = 0, n = 0, o = 0;
  int p = 0;

  global fixed8* q = a;
  global fixed8* r = q + g * l;
  global fixed8* s = r + (g >> 1) * (l >> 1);

  global fixed8* t = f;
  global fixed8* u = t + k * l;
  global fixed8* v = u + (k >> 1) * (l >> 1);

  int w = j * k + i;
  global fixed8* x = q + (j * g);
  for (int p = 0; p < h; p++) {
    m += (b[i + p * k] * x[d[i] + p]);
  }
  t[w] = m;

  if (j < (l >> 1) && i < (k >> 1)) {
    int w = j * (k >> 1) + i;
    global fixed8* y = r + (j * (g >> 1));
    global fixed8* z = s + (j * (g >> 1));
    for (p = 0; p < h; p++) {
      n += (c[i + p * (k >> 1)] * y[e[i] + p]);
      o += (c[i + p * (k >> 1)] * z[e[i] + p]);
    }
    u[w] = n;
    v[w] = o;
  }
}
kernel void B(global fixed8* a, global float* b, global float* c, global int* d, global int* e, global fixed8* f, int g, int h) {
  int i = get_global_id(0);
  int j = get_global_id(1);
  int k = get_global_size(0);
  int l = get_global_size(1);
  float m = 0, n = 0, o = 0;
  int p = 0;

  global fixed8* q = a;
  global fixed8* r = q + g * k;
  global fixed8* s = r + (g >> 1) * (k >> 1);

  global fixed8* t = f;
  global fixed8* u = t + l * k;
  global fixed8* v = u + (l >> 1) * (k >> 1);

  int w = j * k + i;
  for (p = 0; p < h; p++) {
    m += b[j + p * l] * q[(d[j] + p) * k + i];
  }
  t[w] = m;

  if (j < (l >> 1) && i < (k >> 1)) {
    int w = j * (k >> 1) + i;
    for (p = 0; p < h; p++) {
      n += c[j + p * (l >> 1)] * r[(e[j] + p) * (k >> 1) + i];
      o += c[j + p * (l >> 1)] * s[(e[j] + p) * (k >> 1) + i];
    }
    u[w] = n;
    v[w] = o;
  }
}

kernel void C(global char* a, global char* b, int c, int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  int g = f * (c >> 1) + e;
  vstore4((vload4(0, a + (g << 2))), 0, b + (g << 2));
  char2 h = vload2(0, a + (g << 1) + c * d);
  b[g + c * d] = h.s0;
  b[g + c * d + ((c * d) >> 2)] = h.s1;
}
kernel void D(global short* a, const global unsigned char* b, const global short* c, const global int* d, int e, const global short* f, const global int* g, int h, int i, int j, int k, int l, int m, int n, int o, int p) {
  int q = get_global_id(0);
  int r = get_global_id(1);

  int s = get_global_size(0);
  int t = get_global_size(1);

  int u = r * o + d[q];
  int v = r * o + d[q + s];
  int w = (r + (l >> 1)) * o + d[q];
  int x = (r + (l >> 1)) * o + d[q + s];
  int y = o * l + (r) * (p) + g[q];
  int z = y + ((p) * (t));

  int aa = 0;
  int ab = 0;
  int ac = 0;
  int ad = 0;
  int ae = 0;
  int af = 0;

  int ag = e * q;
  int ah = e * (q + s);
  int ai = h * q;

  int aj;
  for (aj = 0; aj < e; aj++) {
    aa += b[u + aj] * c[ag + aj];
    ab += b[v + aj] * c[ah + aj];
    ac += b[w + aj] * c[ag + aj];
    ad += b[x + aj] * c[ah + aj];
    ae += b[y + aj] * f[ai + aj];
    af += b[z + aj] * f[ai + aj];
  }
  int ak = r * m;
  int al = (r + t) * m;

  a[ak + q] = ((aa >> 7) > ((1 << 15) - 1) ? ((1 << 15) - 1) : (aa >> 7));
  a[ak + q + s] = ((ab >> 7) > ((1 << 15) - 1) ? ((1 << 15) - 1) : (ab >> 7));
  a[al + q] = ((ac >> 7) > ((1 << 15) - 1) ? ((1 << 15) - 1) : (ac >> 7));
  a[al + q + s] = ((ad >> 7) > ((1 << 15) - 1) ? ((1 << 15) - 1) : (ad >> 7));

  int am = r * (n) + q + m * j;
  int an = r * (n) + q + m * j + ((n)*t);
  a[am] = ((ae >> 7) > ((1 << 15) - 1) ? ((1 << 15) - 1) : (ae >> 7));
  a[an] = ((af >> 7) > ((1 << 15) - 1) ? ((1 << 15) - 1) : (af >> 7));
}

kernel void E(global short* a, const global unsigned char* b, int c, int d, int e, int f, int g, int h, int i, int j, int k, int l) {
  int m = get_global_id(0);
  int n = get_global_id(1);

  int o = get_global_size(0);
  int p = get_global_size(1);
  int q = 0;
  int r = 0;
  int s = q >> 16;
  int t = (q & 0xFFFF) >> 9;
  a[n * i + m] = (b[n * k + s] << 7) + (b[n * k + s + 1] - b[n * k + s]) * t;
  int u = n + (p);
  a[u * i + m] = (b[u * k + s] << 7) + (b[u * k + s + 1] - b[u * k + s]) * t;

  int v = m * c >> 16;
  if (v >= g - 1) {
    a[n * i + m] = b[n * k + g - 1] * 128;
    a[u * i + m] = b[u * k + g - 1] * 128;
  }

  int w = m + (o);
  s = r >> 16;
  t = (r & 0xFFFF) >> 9;
  a[n * i + w] = (b[n * k + s] << 7) + (b[n * k + s + 1] - b[n * k + s]) * t;
  a[u * i + w] = (b[u * k + s] << 7) + (b[u * k + s + 1] - b[u * k + s]) * t;
  v = w * c >> 16;
  if (v >= g - 1) {
    a[n * i + w] = b[n * k + g - 1] * 128;
    a[u * i + w] = b[u * k + g - 1] * 128;
  }

  int x = 0;
  x = d * m;
  s = x >> 16;
  t = (x & 0xFFFF) >> 9;
  b += k * h;
  a += i * f;
  a[n * (j) + m] = (b[n * (l) + s] * (t ^ 127) + b[n * (l) + s + 1] * t);
  v = m * c >> 16;
  if (v >= (g >> 1) - 1) {
    a[n * (j) + m] = b[n * (l) + (g >> 1) - 1] * 128;
  }

  x = d * (m);
  s = x >> 16;
  b += l * h >> 1;
  a += (j * p);
  a[n * (j) + m] = (b[n * (l) + s] * (t ^ 127) + b[n * (l) + s + 1] * t);

  if (v >= (g >> 1) - 1) {
    a[n * (j) + m] = b[n * (l) + (g >> 1) - 1] * 128;
  }
}

kernel void F(global unsigned char* a, const global short* b, const global short* c, int d, const global short* e, int f, const global int* g, const global int* h, int i, int j, int k, int l, int m, int n, int o, int p) {
  const unsigned char q[8][8] = {
      {
          36, 68, 60, 92, 34, 66, 58, 90,
      },
      {
          100, 4, 124, 28, 98, 2, 122, 26,
      },
      {
          52, 84, 44, 76, 50, 82, 42, 74,
      },
      {
          116, 20, 108, 12, 114, 18, 106, 10,
      },
      {
          32, 64, 56, 88, 38, 70, 62, 94,
      },
      {
          96, 0, 120, 24, 102, 6, 126, 30,
      },
      {
          48, 80, 40, 72, 54, 86, 46, 78,
      },
      {
          112, 16, 104, 8, 118, 22, 110, 14,
      },
  };

  int r = get_global_id(0);
  int s = get_global_id(1);

  int t = get_global_size(0);
  int u = get_global_size(1);
  const unsigned char* v;
  const unsigned char* w;

  v = q[s & 7];
  w = q[(s + u) & 7];

  int x = (g[s]) * o + r;
  int y = (g[s]) * o + r + (t);
  int z = (g[s + u]) * o + r;
  int aa = (g[s + u]) * o + r + t;
  int ab = m * l + (h[s]) * n + (r);
  int ac = m * l + (n * (l >> 1)) + (h[s]) * n + r;

  int ad = (v[r & 7] << 12);
  int ae = (v[(r + t) & 7] << 12);
  int af = (w[r & 7] << 12);
  int ag = (w[(r + t) & 7] << 12);
  int ah = (v[r & 7] << 12);
  int ai = (v[(r + 3) & 7] << 12);

  int aj;
  int ak = s * d;
  int al = (s + u) * d;
  for (aj = 0; aj < d; aj++) {
    ad += b[x] * c[ak + aj];
    x += o;
    ae += b[y] * c[ak + aj];
    y += o;
    af += b[z] * c[al + aj];
    z += o;
    ag += b[aa] * c[al + aj];
    aa += o;
    ah += b[ab] * e[ak + aj];
    ai += b[ac] * e[ak + aj];
    ab += n;
    ac += n;
  }
  a[s * m + r] = (((ad >> 19) & (~0xFF)) ? ((-(ad >> 19)) >> 31) : (ad >> 19));
  a[s * m + r + t] = (((ae >> 19) & (~0xFF)) ? ((-(ae >> 19)) >> 31) : (ae >> 19));
  a[(s + u) * m + r] = (((af >> 19) & (~0xFF)) ? ((-(af >> 19)) >> 31) : (af >> 19));
  a[(s + u) * m + r + t] = (((ag >> 19) & (~0xFF)) ? ((-(ag >> 19)) >> 31) : (ag >> 19));

  int am = m * j + s * (n) + (r);
  int an = (n * u) + am;
  a[am] = (((ah >> 19) & (~0xFF)) ? ((-(ah >> 19)) >> 31) : (ah >> 19));
  a[an] = (((ai >> 19) & (~0xFF)) ? ((-(ai >> 19)) >> 31) : (ai >> 19));
}

kernel void G(global unsigned char* a, const global short* b, const global short* c, int d, const global short* e, int f, const global int* g, const global int* h, int i, int j, int k, int l, int m, int n, int o, int p) {
  const unsigned char q[8] = {64, 64, 64, 64, 64, 64, 64, 64};

  int r = get_global_id(0);
  int s = get_global_id(1);

  int t = get_global_size(0);
  int u = get_global_size(1);
  const unsigned char* v;
  const unsigned char* w;

  v = q;
  w = q;

  int x = (g[s]) * o + r;
  int y = (g[s]) * o + r + (t);
  int z = (g[s + u]) * o + r;
  int aa = (g[s + u]) * o + r + t;
  int ab = m * l + (h[s]) * n + (r);
  int ac = m * l + (n * (l >> 1)) + (h[s]) * n + r;

  int ad = (v[r & 7] << 12);
  int ae = (v[(r + t) & 7] << 12);
  int af = (w[r & 7] << 12);
  int ag = (w[(r + t) & 7] << 12);
  int ah = (v[r & 7] << 12);
  int ai = (v[(r + 3) & 7] << 12);

  int aj;
  int ak = s * d;
  int al = (s + u) * d;
  for (aj = 0; aj < d; aj++) {
    ad += b[x] * c[ak + aj];
    x += o;
    ae += b[y] * c[ak + aj];
    y += o;
    af += b[z] * c[al + aj];
    z += o;
    ag += b[aa] * c[al + aj];
    aa += o;
    ah += b[ab] * e[ak + aj];
    ai += b[ac] * e[ak + aj];
    ab += n;
    ac += n;
  }
  a[s * m + r] = (((ad >> 19) & (~0xFF)) ? ((-(ad >> 19)) >> 31) : (ad >> 19));
  a[s * m + r + t] = (((ae >> 19) & (~0xFF)) ? ((-(ae >> 19)) >> 31) : (ae >> 19));
  a[(s + u) * m + r] = (((af >> 19) & (~0xFF)) ? ((-(af >> 19)) >> 31) : (af >> 19));
  a[(s + u) * m + r + t] = (((ag >> 19) & (~0xFF)) ? ((-(ag >> 19)) >> 31) : (ag >> 19));
  ;

  int am = m * j + s * (n) + (r);
  int an = (n * u) + am;
  a[am] = (((ah >> 19) & (~0xFF)) ? ((-(ah >> 19)) >> 31) : (ah >> 19));
  a[an] = (((ai >> 19) & (~0xFF)) ? ((-(ai >> 19)) >> 31) : (ai >> 19));
}

kernel void H(global unsigned char* a, const global short* b, const global int* c, const global int* d, int e, int f, int g, int h, int i, int j, int k, int l) {
  const unsigned char m[8] = {64, 64, 64, 64, 64, 64, 64, 64};

  int n = get_global_id(0);
  int o = get_global_id(1);

  int p = get_global_size(0);
  int q = get_global_size(1);

  const unsigned char* r;
  const unsigned char* s;

  r = m;
  s = m;

  int t = n + p;
  int u = o + q;
  short v = (b[(c[o]) * i + n] + r[(n + 0) & 7]) >> 7;
  short w = (b[(c[o]) * i + t] + r[t & 7]) >> 7;
  short x = (b[(c[u]) * i + n] + s[n & 7]) >> 7;
  short y = (b[(c[u]) * i + t] + s[t & 7]) >> 7;
  a[o * i + n] = ((v & (~0xFF)) ? ((-v) >> 31) : (v));
  a[o * i + t] = ((w & (~0xFF)) ? ((-w) >> 31) : (w));
  a[u * i + n] = ((x & (~0xFF)) ? ((-x) >> 31) : (x));
  a[u * i + t] = ((y & (~0xFF)) ? ((-y) >> 31) : (y));

  b += i * h;
  a += i * f;
  v = (b[d[o] * (j) + n] + r[n & 7]) >> 7;
  a[o * (j) + n] = ((v & (~0xFF)) ? ((-v) >> 31) : (v));

  b += j * (h >> 1);
  a += j * q;
  v = (b[d[o] * j + n] + r[(n + 3) & 7]) >> 7;
  a[o * j + n] = ((v & (~0xFF)) ? ((-v) >> 31) : (v));
}

__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void I(__global uchar* a, __global const uchar* b, const float c, const float d, const int e, const int f, const int g, const int h, const int i, const int j, const int k, const int l, const int m, const int n, const int o, const int p, const int q, const int r, const int s, const int t, __global const float4* restrict u, __global const float4* restrict v) {
  const int w = get_global_id(0);
  const int x = get_global_id(1);
  const int y = get_global_id(2);

  if ((get_group_id(0) * 64 >= (s >> ((y == 0) ? 0 : 1))) || (get_group_id(1) * 16 >= (t >> ((y == 0) ? 0 : 1))))
    return;

  const int z = (y == 0) ? e : ((y == 1) ? f : g);
  const int aa = (y == 0) ? h : ((y == 1) ? i : j);
  const int ab = (y == 0) ? k : ((y == 1) ? l : m);
  const int ac = (y == 0) ? n : ((y == 1) ? o : p);

  __local uchar ad[64 * 36];
  const int ae = 64;
  const int af = 16;
  const int ag = 2;
  const int ah = get_local_id(0);

  const int ai = __clc_floor((get_group_id(1) * af) / d);
  const int aj = __clc_ceil(af / d) + 2 * ag;

  float4 ak = u[w];
  int4 al = __clc_floor(w / c);
  al += (int4)(-1, 0, 1, 2);
  al = clamp(al, 0, (q >> ((y == 0) ? 0 : 1)) - 1);
  const int am = (r >> ((y == 0) ? 0 : 1)) - 1;

  for (int an = 0; an <= aj; ++an) {
    int4 ao = z + clamp(ai - ag + an, 0, am) * ab;
    ao += al;
        ad[ah + an * ae] = convert_uchar(clamp(__clc_round(dot(ak,
                       (float4)(ao], ao], ao], ao]))), 0.0f, 255.0f));
  }

  barrier(1);

  if (w >= s >> ((y == 0) ? 0 : 1))
    return;

  int ap = aa + w + (get_group_id(1) * af) * ac;

  for (int an = 0; an < af; ++an) {
    if (x >= t >> ((y == 0) ? 0 : 1))
      break;
    int aq = __clc_floor((get_group_id(1) * af + an) / d);
    aq = aq - ai + ag;
    int ar = ah + aq * ae;
        a[ap] = convert_uchar(clamp(__clc_round(dot(v[get_group_id(1) * af + an],
                                (flarar ae                      ,ar ae0f, 255.0f));
        ap += ac;
  }
}

void J(global unsigned char* a, global unsigned char* b, global unsigned char* c, global unsigned char* d, int e, int f, int g, int h, int i, int j, int k, int l, int m) {
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

kernel void K(global unsigned char* a, global unsigned char* b, global unsigned char* c, global unsigned char* d, int e, int f, int g, int h, int i, int j) {
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
    J(o, q, s, u, k, l, m, n, e, f, h, j, 0);
  } else {
    k = k - m;
    J(p, r, t, v, k, l, m >> 1, n >> 1, e, g, i, j, 1);
  }
}
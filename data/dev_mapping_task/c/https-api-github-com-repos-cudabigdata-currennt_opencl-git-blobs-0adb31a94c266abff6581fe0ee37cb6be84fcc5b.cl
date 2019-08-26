__kernel void A(__global float* a, float b) {
  a[get_global_id(0)] = b;
}

__kernel void B(int a, int b, int c, int d, int e, int f, __global float* g, __global float* h, __global float* i, int j) {
  int k = get_global_id(0);

  __global float* l = (g + e) + (k % c) * a;
  __global float* m = (h + f) + (k / c) * b;

  float n = 0;
  for (int o = 0; o < a; ++o)
    n += l[o] * m[o];
  i[k + j] = n;
}

__kernel void C(int a, int b, int c, int d, int e, int f, __global float* g, __global float* h, __global float* i, int j) {
  int k = get_global_id(0);

  __global float* l = (g + e) + (k % a);
  __global float* m = (h + f) + (k / a) * b;

  float n = 0;
  for (int o = 0; o < c; ++o)
    n += l[o * a] * m[o];
  i[k + j] = n;
}

__kernel void D(int a, int b, int c, int d, int e, int f, __global float* g, __global float* h, __global float* i, int j) {
  int k = get_global_id(0);

  __global float* l = (g + e) + (k % a);
  __global float* m = (h + f) + (k / a);

  float n = 0;
  for (int o = 0; o < c; ++o) {
    n += *l * *m;
    l += a;
    m += b;
  }
  i[k + j] = n;
}

__kernel void E(int a, int b, int c, int d, int e, int f, __global float* g, __global float* h, __global float* i, int j) {
  int k = get_global_id(0);

  __global float* l = (g + e) + (k % c) * a;
  __global float* m = (h + f) + (k / c) * b;

  float n = 0;
  for (int o = 0; o < a; ++o)
    n += l[o] * m[o];

  i[k + j] += n;
}

__kernel void F(int a, int b, int c, int d, int e, int f, __global float* g, __global float* h, __global float* i, int j) {
  int k = get_global_id(0);

  __global float* l = (g + e) + (k % a);
  __global float* m = (h + f) + (k / a);

  float n = 0;
  for (int o = 0; o < c; ++o) {
    n += *l * *m;
    l += a;
    m += b;
  }
  i[k + j] += n;
}
__kernel void G(int a, int b, int c, int d, int e, int f, __global float* g, __global float* h, __global float* i, int j) {
  int k = get_global_id(0);

  __global float* l = (g + e) + (k % a);
  __global float* m = (h + f) + (k / a) * b;

  float n = 0;
  for (int o = 0; o < c; ++o)
    n += l[o * a] * m[o];

  i[k + j] += n;
}

__kernel void H(__global float* a, __global float* b) {
  int c = get_global_id(0);
  a[c] += b[c];
}

__kernel void I(int a, __global char* b, __global float* c, __global float* d, __local float* e, __global float* f, int g) {
  int h = get_local_id(0);
  e[get_local_id(0)] = 0;
  barrier(1);
  while (h < g) {
    int i = h / a;
    if (b[i] != 0) {
      float j = c[h * 2];
      float k = d[h];
      float l = c[h * 2 + 1];

      float m = (k - j) * l;
      e[get_local_id(0)] += (m * m);
    }
    h += get_local_size(0);
  }
  h = get_local_id(0);

  barrier(1);
  for (unsigned int n = get_local_size(0) / 2; n > 0; n >>= 1) {
    if (h < n) {
      e[h] += e[h + n];
    }
    barrier(1);
  }

  if (get_local_id(0) == 0) {
    f[0] = e[0];
  }
}

__kernel void J(int a, __global char* b, __global float* c, __global float* d, __global float* e) {
  int f = get_global_id(0);
  float g = c[f * 2];
  float h = d[f];
  float i = c[f * 2 + 1];

  int j = f / a;

  if (b[j] == 0)
    e[f] = 0;
  else
    e[f] = (h - g) * i;
}

float K(float a, float b, float c) {
  return (a < b ? b : (a > c ? c : a));
}

float L(float a) {
  if (a < 88.722839f) {
    if (a > -88.722839f)
      return (float)1.0 / ((float)1.0 + exp(-a));
    else
      return 0;
  }

  return 1;
}

float M(float a) {
  return ((float)2.0 * L(a) - (float)1.0);
}

float N(float a) {
  return M((float)2.0 * a);
}

float O(float a) {
  return a;
}

__kernel void P(int a, float b, __global float* c, int d, __global float* e, int f) {
  int g = get_global_id(0);

  int h = g % a;
  float i = e[g];

  i += b * c[d + h];

  float j;
  if (f == 0)
    j = N(i);
  else if (f == 1)
    j = L(i);
  else
    j = O(i);
  e[g] = j;
}

float Q(float a) {
  return (float)1.0 - (a * a);
}
float R(float a) {
  return a * ((float)1.0 - a);
}
float S(float a) {
  return 1;
}
__kernel void T(__global float* a, __global float* b, int c) {
  int d = get_global_id(0);
  float e;
  if (c == 0)
    e = Q(b[d]);
  else if (c == 1)
    e = R(b[d]);
  else
    e = S(b[d]);

  a[d] = e * a[d];
}

__kernel void U(int a, int b, float c, __global float* d, __global float* e, int f) {
  int g = get_global_id(0);
  __global float* h = d + g;

  float i = 0;
  for (int j = 0; j < b; ++j) {
    i += c * *h;
    h += a;
  }

  e[g + f] = i;
}

__kernel void V(int a, __global char* b, __global float* c, __global float* d, __global float* e, __local float* f, int g) {
  int h = get_local_id(0);
  f[get_local_id(0)] = 0;
  barrier(1);

  while (h < g) {
    float i = c[h];
    float j = d[h];

    int k = h / a;
    if (b[k] != 0) {
      float l = i - j;
      f[get_local_id(0)] += (l * l);
    }

    h += get_local_size(0);
  }

  h = get_local_id(0);

  barrier(1);
  for (unsigned int m = get_local_size(0) / 2; m > 0; m >>= 1) {
    if (h < m) {
      f[h] += f[h + m];
    }
    barrier(1);
  }

  if (get_local_id(0) == 0) {
    e[0] = f[0];
  }
}

__kernel void W(int a, __global char* b, __global float* c, __global float* d, __global float* e) {
  int f = get_global_id(0);

  float g = c[f];
  float h = d[f];

  int i = f / a;

  if (b[i] == 0)
    e[f] = 0;
  else
    e[f] = g - h;
}

__kernel void X(__global float* a, __global float* b, __global char* c, __global int* d, __local int* e, int f) {
  int g = get_local_id(0);
  e[get_local_id(0)] = 0;
  barrier(1);

  while (g < f) {
    float h = a[g];
    float i = b[g];
    int j = c[g];

    bool k = (h > (float)0.5);
    bool l = (i > (float)0.5);

    e[get_local_id(0)] += (j != 0) && (k == l);

    g += get_local_size(0);
  }

  g = get_local_id(0);

  barrier(1);
  for (unsigned int m = get_local_size(0) / 2; m > 0; m >>= 1) {
    if (g < m) {
      e[g] += e[g + m];
    }
    barrier(1);
  }

  if (get_local_id(0) == 0) {
    d[0] = e[0];
  }
}

__kernel void Y(__global char* a, __global float* b, __global float* c, __global float* d, __local float* e, int f) {
  int g = get_local_id(0);
  e[get_local_id(0)] = 0;
  barrier(1);
  while (g < f) {
    if (a[g] != 0) {
      float h = b[g];
      float i = c[g];

      float j = max(i, 1.1754944e-038f);
      float k = (h > 0 ? j : 1 - j);
      float l = -log(k);

      e[get_local_id(0)] += l;
    }
    g += get_local_size(0);
  }
  g = get_local_id(0);

  barrier(1);
  for (unsigned int m = get_local_size(0) / 2; m > 0; m >>= 1) {
    if (g < m) {
      e[g] += e[g + m];
    }
    barrier(1);
  }

  if (get_local_id(0) == 0) {
    d[0] = e[0];
  }
}

__kernel void Z(__global char* a, __global float* b, __global float* c, __global float* d) {
  int e = get_global_id(0);

  if (a[e] != 0) {
    float f = b[e];
    float g = d[e];

    float h = max(g, 1.1754944e-038f);
    float i = (f > 0 ? h : 1 - h);
    float j = (f > 0 ? -(1 / i) : (1 / i));

    c[e] = j;
  }
}

__kernel void AA(int a, __global char* b, __global float* c, __global float* d, __global float* e, __local float* f, int g) {
  int h = get_local_id(0);
  f[get_local_id(0)] = 0;
  barrier(1);

  while (h < g) {
    float i = c[h];
    float j = d[h];

    int k = h / a;
    if (b[h] != 0) {
      float l = max(1.1754944e-038f, i);
      j = max(1.1754944e-038f, j);
      float m = i * log(l / j);
      f[get_local_id(0)] += m;
    }

    h += get_local_size(0);
  }

  h = get_local_id(0);

  barrier(1);
  for (unsigned int n = get_local_size(0) / 2; n > 0; n >>= 1) {
    if (h < n) {
      f[h] += f[h + n];
    }
    barrier(1);
  }

  if (get_local_id(0) == 0) {
    e[0] = f[0];
  }
}

__kernel void AB(int a, __global char* b, __global float* c, __global float* d, __global float* e) {
  int f = get_global_id(0);
  float g = c[f];
  float h = d[f];

  int i = f / a;

  if (b[i] == 0)
    e[f] = 0;
  else {
    g = max(1.1754944e-038f, g);
    e[f] = K(-h / g, -100, +100);
  }
}

__kernel void AC(int a, __global float* b, __global int* c, __global int* d, __local int* e, int f) {
  int g = get_local_id(0);
  e[get_local_id(0)] = 0;
  barrier(1);
  while (g < f) {
    int h = c[g];

    if (h != -1) {
      __global float* i = b + g * a;
      float j = 0;
      int k = 0;

      for (int l = 0; l < a; ++l) {
        float m = i[l];
        if (m > j) {
          j = m;
          k = l;
        }
      }

      if (h == k)
        e[get_local_id(0)] += 1;
    }
    g += get_local_size(0);
  }
  g = get_local_id(0);

  barrier(1);
  for (unsigned int n = get_local_size(0) / 2; n > 0; n >>= 1) {
    if (g < n) {
      e[g] += e[g + n];
    }
    barrier(1);
  }

  if (get_local_id(0) == 0) {
    d[0] = e[0];
  }
}
__kernel void AD(int a, __global float* b, __global int* c, __global float* d, __local float* e, int f) {
  int g = get_local_id(0);
  e[get_local_id(0)] = 0;
  barrier(1);
  while (g < f) {
    int h = c[g];

    if (h != -1) {
      int i = g * a + h;
      float j = max(1.1754944e-038f, b[i]);
      e[get_local_id(0)] += log(j);
    }
    g += get_local_size(0);
  }
  g = get_local_id(0);

  barrier(1);
  for (unsigned int k = get_local_size(0) / 2; k > 0; k >>= 1) {
    if (g < k) {
      e[g] += e[g + k];
    }
    barrier(1);
  }

  if (get_local_id(0) == 0) {
    d[0] = e[0];
  }
}
__kernel void AE(int a, __global float* b, __global float* c, __global int* d) {
  int e = get_global_id(0);

  int f = d[e];

  if (f == -1)
    return;

  int g = e * a + f;

  float h = max(1.1754944e-038f, b[g]);
  float i = -(1 / h);

  c[g] = i;
}

__kernel void AF(__global float* a, __global float* b, __local float* c, int d) {
  int e = get_local_id(0);
  c[e] = 0;
  barrier(1);
  while (e < d) {
    c[get_local_id(0)] += a[e];
    e += get_local_size(0);
  }
  for (unsigned int f = get_local_size(0) / 2; f > 0; f >>= 1) {
    if (e < f) {
      c[e] += c[e + f];
    }
    barrier(1);
  }

  if (get_local_id(0) == 0) {
    b[0] = c[0];
  }
}

__kernel void AG(int a, __global float* b, __global float* c, __global char* d, __global float* e) {
  int f = get_global_id(0);
  if (d[f] == 0)
    e[f] = 0;
  else {
    __global float* g = &b[f * a];
    __global float* h = &c[f * a];

    float i = 0;
    for (int j = 0; j < a; ++j) {
      float k = g[j] - h[j];
      i += k * k;
    }

    e[f] = sqrt(i / a);
  }
}

__kernel void AH(int a, __global float* b, __global float* c, __global float* d, __global float* e) {
  int f = get_global_id(0);
  float g = b[f];
  float h = c[f];

  int i = f / a;

  float j = e[i];

  d[f] = j * (g - h);
}
__kernel void AI(int a, __global float* b, __global char* c, __global float* d) {
  int e = get_global_id(0);
  if (c[e] == 0)
    d[e] = 3.4028235e+038f;
  else {
    float f = 1.1754944e-038f;
    float g = 3.4028235e+038f;

    __global float* h = &b[e * a];

    for (int i = 0; i < a; ++i) {
      float j = h[i];
      g = min(g, j);
      f = max(f, j);
    }

    d[e] = (float)0.5 * (g + f);
  }
}

float AJ(float a) {
  if (a <= -1e30)
    return 0;
  else if (a >= 88.722839f)
    return 3.4028235e+038f;
  else
    return exp(a);
}

__kernel void AK(int a, __global float* b, __global float* c) {
  int d = get_global_id(0);
  float e = c[d];

  int f = d / a;

  float g = b[f];
  if (g != 3.4028235e+038f) {
    float h = AJ(e - g);

    c[d] = h;
  }
}

__kernel void AL(int a, __global float* b, __global float* c) {
  int d = get_global_id(0);

  if (c[d] != 3.4028235e+038f) {
    __global float* e = &b[d * a];

    float f = 0;
    for (int g = 0; g < a; ++g)
      f += e[g];

    c[d] = f;
  }
}

__kernel void AM(int a, __global float* b, __global float* c) {
  int d = get_global_id(0);

  int e = d / a;

  float f = b[e];
  if (f != 3.4028235e+038f) {
    float g = c[d] / f;

    c[d] = g;
  }
}

__kernel void AN(int a, __global float* b, __global float* c, __global char* d, __global float* e) {
  int f = get_global_id(0);

  if (d[f] == 0)
    e[f] = 3.4028235e+038f;
  else {
    __global float* g = &b[f * a];
    __global float* h = &c[f * a];

    float i = 0;
    for (int j = 0; j < a; ++j)
      i += g[j] * h[j];

    e[f] = i;
  }
}
__kernel void AO(int a, __global float* b, __global float* c, __global float* d) {
  int e = get_global_id(0);

  int f = e / a;

  float g = b[f];
  if (g != 3.4028235e+038f) {
    float h = c[e];
    float i = d[e];

    float j = i * (h - g);

    c[e] = j;
  }
}

__kernel void AP(int a, __global char* b, __global float* c, __global float* d, __global float* e, __local float* f, int g) {
  int h = get_local_id(0);
  f[get_local_id(0)] = 0;
  barrier(1);
  while (h < g) {
    float i = c[h * 2];
    float j = d[h];
    float k = c[h * 2 + 1];

    int l = h / a;
    if (b[l] != 0) {
      float m = j * k - i;
      f[get_local_id(0)] += (m * m);
    }

    h += get_local_size(0);
  }
  h = get_local_id(0);

  barrier(1);
  for (unsigned int n = get_local_size(0) / 2; n > 0; n >>= 1) {
    if (h < n) {
      f[h] += f[h + n];
    }
    barrier(1);
  }

  if (get_local_id(0) == 0) {
    e[0] = f[0];
  }
}

__kernel void AQ(int a, __global char* b, __global float* c, __global float* d, __global float* e) {
  int f = get_global_id(0);

  float g = c[f * 2];
  float h = d[f];
  float i = c[f * 2 + 1];

  int j = f / a;

  if (b[j] == 0)
    e[f] = 0;
  else
    e[f] = (h * i - g) * i;
}

__kernel void AR(int a, int b, float c, __global float* d, int e, int f, int g, int h, int i, int j, int k, __global char* l, __global float* m, __global float* n, __global float* o, __global float* p, __global float* q, int r, int s, __global float* t, int u) {
  __global float* v = &d[e];
  __global float* w = &d[f];
  __global float* x = &d[g];
  __global float* y = &d[h];

  __global float* z = &d[i];
  __global float* aa = &d[j];
  __global float* ab = &d[k];
  int ac = get_global_id(0) + u;

  if (s == 1) {
    int ad = ac / a;
    if (l[ad] == 0) {
      if (b > 0)
        m[ac] = 0;

      t[ac] = 0;
      return;
    }
  }

  int ae = ac % a;

  float af = n[ac];
  float ag = o[ac];
  float ah = p[ac];
  float ai = q[ac];

  af += c * v[ae];
  ag += c * w[ae];
  ah += c * x[ae];
  ai += c * y[ae];

  if (!(r == 1)) {
    float aj = m[ac + b];

    ag += aj * z[ae];
    ah += aj * aa[ae];
  }

  af = N(af);
  ag = L(ag);
  ah = L(ah);

  n[ac] = af;
  o[ac] = ag;
  p[ac] = ah;

  float ak = af * ag;

  if (!(r == 1))
    ak += m[ac + b] * ah;

  m[ac] = ak;

  ai += ak * ab[ae];
  ai = L(ai);
  q[ac] = ai;

  t[ac] = N(ak) * ai;
}
__kernel void AS(int a, int b, __global float* c, __global float* d, __global float* e) {
  int f = get_global_id(0);
  int g = f / a;
  int h = f % a;
  int i = g * b + h;

  if (h < b)
    e[f] = c[i];
  else
    e[f] = d[i - b];
}

__kernel void AT(int a, int b, __global float* c, __global float* d, __global float* e) {
  int f = get_global_id(0);
  float g = e[f];

  int h = f / a;
  int i = f % a;
  int j = h * b + i;

  if (i < b)
    c[j] = g;
  else
    d[j - b] = g;
}

float AU(float a) {
  return K(a, -1.0, +1.0);
}

__kernel void AV(int a, int b, __global char* c, int d, int e, int f, __global const float* g, __global const float* h, __global const float* i, __global const float* j, __global const float* k, __global const float* l, __global float* m, __global float* n, __global float* o, __global float* p, __global float* q, __global float* r, int s, int t, int u, int v) {
  __global float* w = &g[d];
  __global float* x = &g[e];
  __global float* y = &g[f];

  int z = get_global_id(0) + s;
  float aa = r[z];

  if (v == 1) {
    int ab = z / a;
    if (c[ab] == 0) {
      n[z] = 0;
      o[z] = 0;
      p[z] = 0;
      q[z] = 0;
      m[z] = 0;
      return;
    }
  }

  int ac = z % a;

  float ad = i[z];
  float ae = j[z];
  float af = l[z];
  float ag = h[z];

  float ah = R(af) * N(ag) * aa;

  float ai = y[ac];
  float aj = af * Q(N(ag)) * aa + ai * ah;

  if (!(t == 1)) {
    float ak = k[z - b];
    float al = m[z - b];
    float am = o[z - b];
    float an = p[z - b];

    float ao = w[ac];
    float ap = x[ac];

    aj += ak * al + ao * am + ap * an;
  }

  float aq = ae * Q(ad) * aj;

  float ar = 0;

  if (!(u == 1)) {
    float as = k[z];
    float at = h[z + b];

    ar = R(as) * at * aj;
  }

  float au = R(ae) * ad * aj;

  n[z] = AU(aq);
  o[z] = AU(au);
  p[z] = AU(ar);
  q[z] = AU(ah);
  m[z] = aj;
}

__kernel void AW(int a, int b, int c, int d, int e, int f, int g, int h, int i, float j, __global const float* k, __global const float* l, __global const float* m, __global const float* n, __global const float* o, __global const float* p, __global const float* q, __global const float* r, __global const float* s, __global const float* t, __global const float* u, __global const float* v, __global const float* w, __global float* x

                 ) {
  int y = get_global_id(0);

  int z = a * c;
  int aa = a;
  int ab = a * b;
  int ac = a;

  int ad = (int)(y >= 0 + 1 * z) + (int)(y >= 0 + 2 * z) + (int)(y >= 0 + 3 * z) + (int)(y >= 0 + 4 * z) + (int)(y >= g + 1 * aa) + (int)(y >= g + 2 * aa) + (int)(y >= g + 3 * aa) + (int)(y >= g + 4 * aa) + (int)(y >= h + 1 * ab) + (int)(y >= h + 2 * ab) + (int)(y >= h + 3 * ab) + (int)(y >= h + 4 * ab) * 2 + (int)(y >= i + 1 * ac) + (int)(y >= i + 2 * ac);

  int ae = ad & 0xC;
  int af = ad & 0x3;

  __global const float* ag;
  int ah;
  int ai;
  bool aj = false;
  bool ak = false;
  bool al;

  switch (ae) {
    case 0x0: {
      {
        int am = y;
        int an = am % c;
        int ao = (am - af * (g / 4)) / c;

        al = (ao >= b);
        if (al)
          ao -= b;

        ah = ao;
        ag = &k[an];
        ai = c;
      }
    } break;

    case 0x4: {
      {
        int ap = y - g;
        int ao = ap - af * a;

        al = (ao >= b);
        if (al)
          ao -= b;

        ah = ao;
        ag = 0;
        ai = 0;
      }
    } break;

    case 0x8: {
      {
        int aq = y - h;
        int ar = aq % b;
        int ao = aq / b - af * a;

        al = (ao >= b);
        if (al)
          ao -= b;

        ah = ao;
        ag = (al ? &m[ar] : &l[ar]);
        ai = b;

        if (al) {
          ag += d;
          ak = true;
        } else {
          ag -= d;
          aj = true;
        }
      }
    } break;

    default: {
      {
        int as = y - i;
        int ao = as - (af - 1) * a;

        al = (ao >= b);
        if (al)
          ao -= b;

        __global const float* at = (al ? o : n);

        int au;
        if (af == 0x3) {
          au = 0;
        } else {
          if (al) {
            au = d;
            ak = true;
          } else {
            au = -d;
            aj = true;
          }
        }

        ah = ao;
        ag = &at[ao + au];
        ai = b;
      }
    } break;
  }

  __global consw __global const float* aw = &av[af + (al ? 4 : 0)][ah];

  if (aj) {
    ag += e * ai;
    aw += e * b;
  }

  int ax = f;
  if (aj || ak)
    ax -= e;

  float ay = 0;
  for (int az = 0; az < ax; ++az) {
    ay += (ag ? *ag : j) * *aw;

    ag += ai;
    aw += b;
  }

  x[y] = ay;
}

__kernel void AX(float a, float b, __global float* c, __global float* d, __global float* e, __global float* f) {
  int g = get_global_id(0);

  float h = b * e[g] - a * d[g];
  e[g] = h;

  float i = c[g] + h;

  f[g] = i;
}
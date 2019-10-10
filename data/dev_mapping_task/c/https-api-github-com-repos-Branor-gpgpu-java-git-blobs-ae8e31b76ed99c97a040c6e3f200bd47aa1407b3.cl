__attribute__((always_inline)) float A(int a, float* b) {
  if (a > 512)
    a -= 1024;

  float c = a * -0x1.921fb6p-8F;
  *b = cos(c);
  return sin(c);
}

__attribute__((always_inline)) float4 B(int4 a, float4* b) {
  a -= (a > 512) & 1024;
  float4 c = convert_float4(a) * -0x1.921fb6p-8F;
  *b = cos(c);
  return sin(c);
}
__attribute__((always_inline)) void C(uint a, const __global float* b, const __global float* c, __local float* d) {
  const __global float4* e;
  __local float* f;

  e = (const __global float4*)(b + (a << 2));
  float4 g = e[0 * 64];
  float4 h = e[1 * 64];
  float4 i = e[2 * 64];
  float4 j = e[3 * 64];

  e = (const __global float4*)(c + (a << 2));
  float4 k = e[0 * 64];
  float4 l = e[1 * 64];
  float4 m = e[2 * 64];
  float4 n = e[3 * 64];

  do {
    float4 o = g + i;
    float4 p = h + j;
    float4 q = o + p;
    float4 r = g - i;
    float4 s = o - p;
    float4 t = h - j;
    float4 u = k + m;
    float4 v = l + n;
    float4 w = u + v;
    float4 x = k - m;
    float4 y = u - v;
    float4 z = l - n;
    g = q;
    k = w;
    h = r + z;
    l = x - t;
    j = r - z;
    n = t + x;
    i = s;
    m = y;
  } while (0);

  int4 aa = (int)(a << 2) + (int4)(0, 1, 2, 3);
  do {
    float4 ab;
    float4 ac = B(aa * 1, &ab);
    do {
      float4 ad = ab * h - ac * l;
      l = ab * l + ac * h;
      h = ad;
    } while (0);
    float4 ae;
    float4 af = B(aa * 2, &ae);
    do {
      float4 ad = ae * i - af * m;
      m = ae * m + af * i;
      i = ad;
    } while (0);
    float4 ag;
    float4 ah = B(aa * 3, &ag);
    do {
      float4 ad = ag * j - ah * n;
      n = ag * n + ah * j;
      j = ad;
    } while (0);
  } while (0);

  f = d + ((a << 2) + (a >> 3));

  f[0] = g.x;
  f[1] = g.y;
  f[2] = g.z;
  f[3] = g.w;
  f += 66 * 4;

  f[0] = h.x;
  f[1] = h.y;
  f[2] = h.z;
  f[3] = h.w;
  f += 66 * 4;

  f[0] = i.x;
  f[1] = i.y;
  f[2] = i.z;
  f[3] = i.w;
  f += 66 * 4;

  f[0] = j.x;
  f[1] = j.y;
  f[2] = j.z;
  f[3] = j.w;
  f += 66 * 4;

  f[0] = k.x;
  f[1] = k.y;
  f[2] = k.z;
  f[3] = k.w;
  f += 66 * 4;

  f[0] = l.x;
  f[1] = l.y;
  f[2] = l.z;
  f[3] = l.w;
  f += 66 * 4;

  f[0] = m.x;
  f[1] = m.y;
  f[2] = m.z;
  f[3] = m.w;
  f += 66 * 4;

  f[0] = n.x;
  f[1] = n.y;
  f[2] = n.z;
  f[3] = n.w;

  barrier(1);
}

__attribute__((always_inline)) void D(uint a, __local float* b) {
  __local float* c;

  c = b + (a + (a >> 5));

  float4 d, e, f, g;

  d.x = c[0 * 66];
  e.x = c[1 * 66];
  f.x = c[2 * 66];
  g.x = c[3 * 66];
  c += 66 * 4;

  d.y = c[0 * 66];
  e.y = c[1 * 66];
  f.y = c[2 * 66];
  g.y = c[3 * 66];
  c += 66 * 4;

  d.z = c[0 * 66];
  e.z = c[1 * 66];
  f.z = c[2 * 66];
  g.z = c[3 * 66];
  c += 66 * 4;

  d.w = c[0 * 66];
  e.w = c[1 * 66];
  f.w = c[2 * 66];
  g.w = c[3 * 66];
  c += 66 * 4;

  float4 h, i, j, k;

  h.x = c[0 * 66];
  i.x = c[1 * 66];
  j.x = c[2 * 66];
  k.x = c[3 * 66];
  c += 66 * 4;

  h.y = c[0 * 66];
  i.y = c[1 * 66];
  j.y = c[2 * 66];
  k.y = c[3 * 66];
  c += 66 * 4;

  h.z = c[0 * 66];
  i.z = c[1 * 66];
  j.z = c[2 * 66];
  k.z = c[3 * 66];
  c += 66 * 4;

  h.w = c[0 * 66];
  i.w = c[1 * 66];
  j.w = c[2 * 66];
  k.w = c[3 * 66];

  do {
    float4 l = d + f;
    float4 m = e + g;
    float4 n = l + m;
    float4 o = d - f;
    float4 p = l - m;
    float4 q = e - g;
    float4 r = h + j;
    float4 s = i + k;
    float4 t = r + s;
    float4 u = h - j;
    float4 v = r - s;
    float4 w = i - k;
    d = n;
    h = t;
    e = o + w;
    i = u - q;
    g = o - w;
    k = q + u;
    f = p;
    j = v;
  } while (0);

  int x = (int)(a << 2);
  do {
    float y;
    float z = A(x * 1, &y);
    do {
      float4 aa = y * e - z * i;
      i = y * i + z * e;
      e = aa;
    } while (0);
    float ab;
    float ac = A(x * 2, &ab);
    do {
      float4 aa = ab * f - ac * j;
      j = ab * j + ac * f;
      f = aa;
    } while (0);
    float ad;
    float ae = A(x * 3, &ad);
    do {
      float4 aa = ad * g - ae * k;
      k = ad * k + ae * g;
      g = aa;
    } while (0);
  } while (0);

  barrier(1);

  c = b + ((a << 2) + (a >> 3));

  c[0] = d.x;
  c[1] = e.x;
  c[2] = f.x;
  c[3] = g.x;
  c += 66 * 4;

  c[0] = d.y;
  c[1] = e.y;
  c[2] = f.y;
  c[3] = g.y;
  c += 66 * 4;

  c[0] = d.z;
  c[1] = e.z;
  c[2] = f.z;
  c[3] = g.z;
  c += 66 * 4;

  c[0] = d.w;
  c[1] = e.w;
  c[2] = f.w;
  c[3] = g.w;
  c += 66 * 4;

  c[0] = h.x;
  c[1] = i.x;
  c[2] = j.x;
  c[3] = k.x;
  c += 66 * 4;

  c[0] = h.y;
  c[1] = i.y;
  c[2] = j.y;
  c[3] = k.y;
  c += 66 * 4;

  c[0] = h.z;
  c[1] = i.z;
  c[2] = j.z;
  c[3] = k.z;
  c += 66 * 4;

  c[0] = h.w;
  c[1] = i.w;
  c[2] = j.w;
  c[3] = k.w;

  barrier(1);
}

__attribute__((always_inline)) void E(uint a, __local float* b) {
  __local float* c;

  c = b + (a + (a >> 5));

  float4 d, e, f, g;

  d.x = c[0 * 66];
  e.x = c[1 * 66];
  f.x = c[2 * 66];
  g.x = c[3 * 66];
  c += 66 * 4;

  d.y = c[0 * 66];
  e.y = c[1 * 66];
  f.y = c[2 * 66];
  g.y = c[3 * 66];
  c += 66 * 4;

  d.z = c[0 * 66];
  e.z = c[1 * 66];
  f.z = c[2 * 66];
  g.z = c[3 * 66];
  c += 66 * 4;

  d.w = c[0 * 66];
  e.w = c[1 * 66];
  f.w = c[2 * 66];
  g.w = c[3 * 66];
  c += 66 * 4;

  float4 h, i, j, k;

  h.x = c[0 * 66];
  i.x = c[1 * 66];
  j.x = c[2 * 66];
  k.x = c[3 * 66];
  c += 66 * 4;

  h.y = c[0 * 66];
  i.y = c[1 * 66];
  j.y = c[2 * 66];
  k.y = c[3 * 66];
  c += 66 * 4;

  h.z = c[0 * 66];
  i.z = c[1 * 66];
  j.z = c[2 * 66];
  k.z = c[3 * 66];
  c += 66 * 4;

  h.w = c[0 * 66];
  i.w = c[1 * 66];
  j.w = c[2 * 66];
  k.w = c[3 * 66];

  do {
    float4 l = d + f;
    float4 m = e + g;
    float4 n = l + m;
    float4 o = d - f;
    float4 p = l - m;
    float4 q = e - g;
    float4 r = h + j;
    float4 s = i + k;
    float4 t = r + s;
    float4 u = h - j;
    float4 v = r - s;
    float4 w = i - k;
    d = n;
    h = t;
    e = o + w;
    i = u - q;
    g = o - w;
    k = q + u;
    f = p;
    j = v;
  } while (0);

  int x = (int)((a >> 2) << 4);
  do {
    float y;
    float z = A(x * 1, &y);
    do {
      float4 aa = y * e - z * i;
      i = y * i + z * e;
      e = aa;
    } while (0);
    float ab;
    float ac = A(x * 2, &ab);
    do {
      float4 aa = ab * f - ac * j;
      j = ab * j + ac * f;
      f = aa;
    } while (0);
    float ad;
    float ae = A(x * 3, &ad);
    do {
      float4 aa = ad * g - ae * k;
      k = ad * k + ae * g;
      g = aa;
    } while (0);
  } while (0);

  barrier(1);

  c = b + a;

  c[0 * 66] = d.x;
  c[1 * 66] = d.y;
  c[2 * 66] = d.z;
  c[3 * 66] = d.w;
  c += 66 * 4;

  c[0 * 66] = e.x;
  c[1 * 66] = e.y;
  c[2 * 66] = e.z;
  c[3 * 66] = e.w;
  c += 66 * 4;

  c[0 * 66] = f.x;
  c[1 * 66] = f.y;
  c[2 * 66] = f.z;
  c[3 * 66] = f.w;
  c += 66 * 4;

  c[0 * 66] = g.x;
  c[1 * 66] = g.y;
  c[2 * 66] = g.z;
  c[3 * 66] = g.w;
  c += 66 * 4;

  c[0 * 66] = h.x;
  c[1 * 66] = h.y;
  c[2 * 66] = h.z;
  c[3 * 66] = h.w;
  c += 66 * 4;

  c[0 * 66] = i.x;
  c[1 * 66] = i.y;
  c[2 * 66] = i.z;
  c[3 * 66] = i.w;
  c += 66 * 4;

  c[0 * 66] = j.x;
  c[1 * 66] = j.y;
  c[2 * 66] = j.z;
  c[3 * 66] = j.w;
  c += 66 * 4;

  c[0 * 66] = k.x;
  c[1 * 66] = k.y;
  c[2 * 66] = k.z;
  c[3 * 66] = k.w;

  barrier(1);
}

__attribute__((always_inline)) void F(uint a, __local float* b) {
  __local float* c;

  c = b + ((a & 0x3) + ((a >> 2) & 0x3) * (66 * 4) + ((a >> 4) << 2));

  float4 d, e, f, g;

  d.x = c[0 * 66];
  d.y = c[1 * 66];
  d.z = c[2 * 66];
  d.w = c[3 * 66];
  c += 16;

  e.x = c[0 * 66];
  e.y = c[1 * 66];
  e.z = c[2 * 66];
  e.w = c[3 * 66];
  c += 16;

  f.x = c[0 * 66];
  f.y = c[1 * 66];
  f.z = c[2 * 66];
  f.w = c[3 * 66];
  c += 16;

  g.x = c[0 * 66];
  g.y = c[1 * 66];
  g.z = c[2 * 66];
  g.w = c[3 * 66];
  c += 66 * 4 * 4 - 3 * 16;

  float4 h, i, j, k;

  h.x = c[0 * 66];
  h.y = c[1 * 66];
  h.z = c[2 * 66];
  h.w = c[3 * 66];
  c += 16;

  i.x = c[0 * 66];
  i.y = c[1 * 66];
  i.z = c[2 * 66];
  i.w = c[3 * 66];
  c += 16;

  j.x = c[0 * 66];
  j.y = c[1 * 66];
  j.z = c[2 * 66];
  j.w = c[3 * 66];
  c += 16;

  k.x = c[0 * 66];
  k.y = c[1 * 66];
  k.z = c[2 * 66];
  k.w = c[3 * 66];

  do {
    float4 l = d + f;
    float4 m = e + g;
    float4 n = l + m;
    float4 o = d - f;
    float4 p = l - m;
    float4 q = e - g;
    float4 r = h + j;
    float4 s = i + k;
    float4 t = r + s;
    float4 u = h - j;
    float4 v = r - s;
    float4 w = i - k;
    d = n;
    h = t;
    e = o + w;
    i = u - q;
    g = o - w;
    k = q + u;
    f = p;
    j = v;
  } while (0);

  int x = (int)((a >> 4) << 6);
  do {
    float y;
    float z = A(x * 1, &y);
    do {
      float4 aa = y * e - z * i;
      i = y * i + z * e;
      e = aa;
    } while (0);
    float ab;
    float ac = A(x * 2, &ab);
    do {
      float4 aa = ab * f - ac * j;
      j = ab * j + ac * f;
      f = aa;
    } while (0);
    float ad;
    float ae = A(x * 3, &ad);
    do {
      float4 aa = ad * g - ae * k;
      k = ad * k + ae * g;
      g = aa;
    } while (0);
  } while (0);

  barrier(1);

  c = b + a;

  c[0 * 68] = d.x;
  c[1 * 68] = d.y;
  c[2 * 68] = d.z;
  c[3 * 68] = d.w;
  c += 68 * 4;

  c[0 * 68] = e.x;
  c[1 * 68] = e.y;
  c[2 * 68] = e.z;
  c[3 * 68] = e.w;
  c += 68 * 4;

  c[0 * 68] = f.x;
  c[1 * 68] = f.y;
  c[2 * 68] = f.z;
  c[3 * 68] = f.w;
  c += 68 * 4;

  c[0 * 68] = g.x;
  c[1 * 68] = g.y;
  c[2 * 68] = g.z;
  c[3 * 68] = g.w;
  c += 68 * 4;

  c[0 * 68] = h.x;
  c[1 * 68] = h.y;
  c[2 * 68] = h.z;
  c[3 * 68] = h.w;
  c += 68 * 4;

  c[0 * 68] = i.x;
  c[1 * 68] = i.y;
  c[2 * 68] = i.z;
  c[3 * 68] = i.w;
  c += 68 * 4;

  c[0 * 68] = j.x;
  c[1 * 68] = j.y;
  c[2 * 68] = j.z;
  c[3 * 68] = j.w;
  c += 68 * 4;

  c[0 * 68] = k.x;
  c[1 * 68] = k.y;
  c[2 * 68] = k.z;
  c[3 * 68] = k.w;

  barrier(1);
}

__attribute__((always_inline)) void G(uint a, const __local float* b, __global float* c, __global float* d) {
  const __local float* e;

  e = b + ((a & 0xf) + (a >> 4) * (68 * 4));

  float4 f, g, h, i;

  f.x = e[0 * 68];
  f.y = e[1 * 68];
  f.z = e[2 * 68];
  f.w = e[3 * 68];
  e += 16;

  g.x = e[0 * 68];
  g.y = e[1 * 68];
  g.z = e[2 * 68];
  g.w = e[3 * 68];
  e += 16;

  h.x = e[0 * 68];
  h.y = e[1 * 68];
  h.z = e[2 * 68];
  h.w = e[3 * 68];
  e += 16;

  i.x = e[0 * 68];
  i.y = e[1 * 68];
  i.z = e[2 * 68];
  i.w = e[3 * 68];

  e += 68 * 4 * 4 - 3 * 16;

  float4 j, k, l, m;

  j.x = e[0 * 68];
  j.y = e[1 * 68];
  j.z = e[2 * 68];
  j.w = e[3 * 68];
  e += 16;

  k.x = e[0 * 68];
  k.y = e[1 * 68];
  k.z = e[2 * 68];
  k.w = e[3 * 68];
  e += 16;

  l.x = e[0 * 68];
  l.y = e[1 * 68];
  l.z = e[2 * 68];
  l.w = e[3 * 68];
  e += 16;

  m.x = e[0 * 68];
  m.y = e[1 * 68];
  m.z = e[2 * 68];
  m.w = e[3 * 68];

  do {
    float4 n = f + h;
    float4 o = g + i;
    float4 p = n + o;
    float4 q = f - h;
    float4 r = n - o;
    float4 s = g - i;
    float4 t = j + l;
    float4 u = k + m;
    float4 v = t + u;
    float4 w = j - l;
    float4 x = t - u;
    float4 y = k - m;
    f = p;
    j = v;
    g = q + y;
    k = w - s;
    i = q - y;
    m = s + w;
    h = r;
    l = x;
  } while (0);

  __global float4* z = (__global float4*)(c + (a << 2));
  z[0 * 64] = f;
  z[1 * 64] = g;
  z[2 * 64] = h;
  z[3 * 64] = i;

  z = (__global float4*)(d + (a << 2));
  z[0 * 64] = j;
  z[1 * 64] = k;
  z[2 * 64] = l;
  z[3 * 64] = m;
}
__kernel void H(__global float* a, __global float* b) {
  __local float c[68 * 4 * 4 * 2];

  __global float* d;
  __global float* e;
  uint f = get_global_id(0);
  uint g = f & 0x3fU;
  uint h = (f >> 6) * (1024 + 0);

  d = a + h;
  e = b + h;

  C(g, d, e, c);
  D(g, c);
  E(g, c);
  F(g, c);
  G(g, c, d, e);
}
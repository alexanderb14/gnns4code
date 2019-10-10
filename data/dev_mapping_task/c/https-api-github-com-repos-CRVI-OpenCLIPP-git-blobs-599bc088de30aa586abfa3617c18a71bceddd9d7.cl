kernel void A(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int2 i = {g h};
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  b[h * d + g] = a[h * c + e - g - 1];
}
kernel void B(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int2 i = {g h};
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  b[h * d + g] = a[(f - h - 1) * c + g];
}
kernel void C(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int2 i = {g h};
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  b[h * d + g] = a[(f - h - 1) * c + e - g - 1];
}

kernel void D(global uchar* a, int b, float c) {
  const int d = get_global_id(0);
  const int e = get_global_id(1);
  const int2 f = {d e};
  b /= sizeof(uchar);
  a[e * b + d] = convert_uchar_sat(c);
}

kernel void E(global uchar* a, int b, uint c, uint d, uint e, uint f, float g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  const int2 j = {h i};
  if (h < c || i < d || h >= c + e || i >= d + f)
    return;

  b /= sizeof(uchar);
  a[i * b + h] = convert_uchar_sat(g);
}
__attribute__((reqd_work_group_size(32, 8, 1))) kernel void F(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  local uchar g[32][32 + 1];
  const int h = get_local_id(0);
  const int i = get_local_id(1);
  const int j = get_group_id(0) * 32 + h;
  const int k = get_group_id(1) * 32 + i;
  const int l = get_group_id(1) * 32 + h;
  const int m = get_group_id(0) * 32 + i;
  if (j < e)
    for (int n = 0; n < 32; n += 8)
      if ((k + n) < f)
        g[i + n][h] = a[(k + n) * c + j];

  barrier(1);

  if (l >= f || m >= e)
    return;

  for (int n = 0; n < 32; n += 8)
    if ((m + n) < e)
      b[(m + n) * d + l] = g[h][i + n];
}

__attribute__((reqd_work_group_size(32, 8, 1))) kernel void G(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  local uchar g[32][32 + 1];
  const int h = get_local_id(0);
  const int i = get_local_id(1);
  const int j = get_group_id(0) * 32 + h;
  const int k = get_group_id(1) * 32 + i;
  const int l = get_group_id(1) * 32 + h;
  const int m = get_group_id(0) * 32 + i;
  for (int n = 0; n < 32; n += 8)
    g[i + n][h] = a[(k + n) * c + j];

  barrier(1);

  for (int n = 0; n < 32; n += 8)
    b[(m + n) * d + l] = g[h][i + n];
}

struct SImage {
  uint Width;
  uint Height;
  uint Step;
  uint Channels;

  int Type;
};

uchar H(global const uchar* a, int b, float2 c, int2 d) {
  int2 e = convert_int2(c);
  if (e.x < 0 || e.x >= d.x || e.y < 0 || e.y >= d.y)
    return 0;

  return a[e.y * b + e.x];
}

uchar I(global const uchar* a, int b, float2 c, int2 d) {
  if ((int)(c.x + .5f) == d.x)
    c.x = d.x - 0.5001f;

  if ((int)(c.y + .5f) == d.y)
    c.y = d.y - 0.5001f;

  c -= (float2)(0.5f, 0.5f);

  if (c.x < -0.5f || c.x >= d.x - 1 || c.y < -0.5f || c.y >= d.y - 1)
    return 0;

  int e = (int)(c.x);
  float f = 1 - (c.x - e);
  int g = (int)(c.x + 1);
  float h = 1 - f;
  int i = (int)(c.y);
  float j = 1 - (c.y - i);
  int k = (int)(c.y + 1);
  float l = 1 - j;
  float m = f * j;
  float n = h * j;
  float o = f * l;
  float p = h * l;
  float q = convert_float(a[i * b + e]);
  float r = convert_float(a[i * b + g]);
  float s = convert_float(a[k * b + e]);
  float t = convert_float(a[k * b + g]);
  return convert_uchar_sat(q * m + r * n + s * o + t * p);
}

uchar J(global const uchar* a, int b, float2 c, int2 d) {
  int2 e = convert_int2(c);
  float f = c.x - e.x;
  float g = c.y - e.y;

  float h[4] = {0, 0, 0, 0};

  if (e.x < 0 || e.x >= d.x)
    return 0;

  if (e.y < 0 || e.y >= d.y)
    return 0;

  for (int i = 0; i < 4; i++) {
    int j = e.y - 1 + i;
    if (j < 0)
      j = 0;

    if (j >= d.y)
      j = d.y - 1;

    int k = clamp(e.x, 0, d.x - 1);

    float l = convert_float(a[j * b + k]);

    float m = 0, n = 0, o = 0;
    if (e.x - 1 >= 0)
      m = convert_float(a[j * b + e.x - 1]);
    else
      m = l;

    if (e.x + 1 < d.x)
      n = convert_float(a[j * b + e.x + 1]);
    else
      n = l;

    if (e.x + 2 < d.x)
      o = convert_float(a[j * b + e.x + 2]);
    else
      o = n;

    float p = l;
    float q = m - p;
    float r = n - p;
    float s = o - p;

    float t = -1.0f / 3 * q + r - 1.0f / 6 * s;
    float u = 1.0f / 2 * q + 1.0f / 2 * r;
    float v = -1.0f / 6 * q - 1.0f / 2 * r + 1.0f / 6 * s;
    h[i] = p + t * f + u * f * f + v * f * f * f;
  }

  float q = h[0] - h[1];
  float r = h[2] - h[1];
  float s = h[3] - h[1];
  float p = h[1];
  float t = -1.0f / 3 * q + r - 1.0f / 6 * s;
  float u = 1.0f / 2 * q + 1.0f / 2 * r;
  float v = -1.0f / 6 * q - 1.0f / 2 * r + 1.0f / 6 * s;
  return convert_uchar_sat(p + t * g + u * g * g + v * g * g * g);
}

uchar K(global const uchar* a, int b, float2 c, int2 d) {
  c -= (float2)(0.5f, 0.5f);

  int2 e = convert_int2(c);
  float f = c.x - e.x;
  float g = c.y - e.y;

  if (e.x <= 0 || e.x >= d.x - 2)
    return J(a, b, c, d);

  if (e.y <= 0 || e.y >= d.y - 2)
    return J(a, b, c, d);

  float h[4] = {0, 0, 0, 0};

  for (int i = 0; i < 4; i++) {
    const int j = e.y - 1 + i;
    float k = convert_float(a[j * b + e.x]);
    float l = convert_float(a[j * b + e.x - 1]) - k;
    float m = convert_float(a[j * b + e.x + 1]) - k;
    float n = convert_float(a[j * b + e.x + 2]) - k;

    float o = -1.0f / 3 * l + m - 1.0f / 6 * n;
    float p = 1.0f / 2 * l + 1.0f / 2 * m;
    float q = -1.0f / 6 * l - 1.0f / 2 * m + 1.0f / 6 * n;
    h[i] = k + o * f + p * f * f + q * f * f * f;
  }

  float l = h[0] - h[1];
  float m = h[2] - h[1];
  float n = h[3] - h[1];
  float k = h[1];
  float o = -1.0f / 3 * l + m - 1.0f / 6 * n;
  float p = 1.0f / 2 * l + 1.0f / 2 * m;
  float q = -1.0f / 6 * l - 1.0f / 2 * m + 1.0f / 6 * n;
  return convert_uchar_sat(k + o * g + p * g * g + q * g * g * g);
}
kernel void L(global const uchar* a, global uchar* b, struct SImage c, struct SImage d, float e, float f, float g, float h) {
  const int i = get_global_id(0);
  const int j = get_global_id(1);
  const int2 k = {i j};
  int l = c.Step / sizeof(uchar);
  int m = d.Step / sizeof(uchar);
  if (k.x >= d.Width || k.y >= d.Height)
    return;
  float n = i - g;
  float o = j - h;
  float2 p = (float2)(fneo .5f, enfo .5f);
  int2 q = (int2)(c, ct);
  uchar r = 0;
  if (p.x >= 0.5f && p.x + 0.5f < c.Width && p.y >= 0.5f && p.y + 0.5f < c.Height)
    r = H(a, l, p, q);
  b[k.y * m + k.x] = r;
}
kernel void M(global const uchar* a, global uchar* b, struct SImage c, struct SImage d, float e, float f, float g, float h) {
  const int i = get_global_id(0);
  const int j = get_global_id(1);
  const int2 k = {i j};
  int l = c.Step / sizeof(uchar);
  int m = d.Step / sizeof(uchar);
  if (k.x >= d.Width || k.y >= d.Height)
    return;
  float n = i - g;
  float o = j - h;
  float2 p = (float2)(fneo .5f, enfo .5f);
  int2 q = (int2)(c, ct);
  uchar r = 0;
  if (p.x >= 0.5f && p.x + 0.5f < c.Width && p.y >= 0.5f && p.y + 0.5f < c.Height)
    r = I(a, l, p, q);
  b[k.y * m + k.x] = r;
}
kernel void N(global const uchar* a, global uchar* b, struct SImage c, struct SImage d, float e, float f, float g, float h) {
  const int i = get_global_id(0);
  const int j = get_global_id(1);
  const int2 k = {i j};
  int l = c.Step / sizeof(uchar);
  int m = d.Step / sizeof(uchar);
  if (k.x >= d.Width || k.y >= d.Height)
    return;
  float n = i - g;
  float o = j - h;
  float2 p = (float2)(fneo .5f, enfo .5f);
  int2 q = (int2)(c, ct);
  uchar r = 0;
  if (p.x >= 0.5f && p.x + 0.5f < c.Width && p.y >= 0.5f && p.y + 0.5f < c.Height)
    r = K(a, l, p, q);
  b[k.y * m + k.x] = r;
}

kernel void O(global const uchar* a, global uchar* b, struct SImage c, struct SImage d, float e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int2 i = {g h};
  int j = c.Step / sizeof(uchar);
  int k = d.Step / sizeof(uchar);
  if (i.x >= d.Width || i.y >= d.Height)
    return; float2 l = {(i + 0.4995f) *i + 0.4995f) * ft2 m = (int2)(c, ct);
  uchar n = H(a, j, l, m);
  b[i.y * k + i.x] = n;
}
kernel void P(global const uchar* a, global uchar* b, struct SImage c, struct SImage d, float e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int2 i = {g h};
  int j = c.Step / sizeof(uchar);
  int k = d.Step / sizeof(uchar);
  if (i.x >= d.Width || i.y >= d.Height)
    return; float2 l = {(i + 0.4995f) *i + 0.4995f) * ft2 m = (int2)(c, ct);
  uchar n = I(a, j, l, m);
  b[i.y * k + i.x] = n;
}
kernel void Q(global const uchar* a, global uchar* b, struct SImage c, struct SImage d, float e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int2 i = {g h};
  int j = c.Step / sizeof(uchar);
  int k = d.Step / sizeof(uchar);
  if (i.x >= d.Width || i.y >= d.Height)
    return; float2 l = {(i + 0.4995f) *i + 0.4995f) * ft2 m = (int2)(c, ct);
  uchar n = K(a, j, l, m);
  b[i.y * k + i.x] = n;
}

kernel void R(global const uchar* a, global uchar* b, struct SImage c, struct SImage d, float e, float f, float g, float h, float i) {
  const int j = get_global_id(0);
  const int k = get_global_id(1);
  const int2 l = {j k};
  int m = c.Step / sizeof(uchar);
  int n = d.Step / sizeof(uchar);
  if (l.x >= d.Width || l.y >= d.Height)
    return;
  float o = l.x - h;
  float p = l.y - i; float2 q = { (opgf, (pogf};
  int2 r = (int2)(c, ct);
  uchar s = H(a, m, q, r);
  b[l.y * n + l.x] = s;
}
kernel void S(global const uchar* a, global uchar* b, struct SImage c, struct SImage d, float e, float f, float g, float h, float i) {
  const int j = get_global_id(0);
  const int k = get_global_id(1);
  const int2 l = {j k};
  int m = c.Step / sizeof(uchar);
  int n = d.Step / sizeof(uchar);
  if (l.x >= d.Width || l.y >= d.Height)
    return;
  float o = l.x - h;
  float p = l.y - i; float2 q = { (opgf, (pogf};
  int2 r = (int2)(c, ct);
  uchar s = I(a, m, q, r);
  b[l.y * n + l.x] = s;
}
kernel void T(global const uchar* a, global uchar* b, struct SImage c, struct SImage d, float e, float f, float g, float h, float i) {
  const int j = get_global_id(0);
  const int k = get_global_id(1);
  const int2 l = {j k};
  int m = c.Step / sizeof(uchar);
  int n = d.Step / sizeof(uchar);
  if (l.x >= d.Width || l.y >= d.Height)
    return;
  float o = l.x - h;
  float p = l.y - i; float2 q = { (opgf, (pogf};
  int2 r = (int2)(c, ct);
  uchar s = K(a, m, q, r);
  b[l.y * n + l.x] = s;
}

kernel void U(global const uchar* a, global const float* b, global const float* c, global uchar* d, uint e, uint f, struct SImage g, struct SImage h) {
  const int i = get_global_id(0);
  const int j = get_global_id(1);
  const int2 k = {i j};
  int l = g.Step / sizeof(uchar);
  int m = h.Step / sizeof(uchar);
  e /= sizeof(float);
  f /= sizeof(float);
  float2 n = i * e .5fi * f .5f
};
int2 o = (int2)(g, gt);
uchar p = H(a, l, n, o);
d[k.y * m + k.x] = p;
}
kernel void V(global const uchar* a, global const float* b, global const float* c, global uchar* d, uint e, uint f, struct SImage g, struct SImage h) {
  const int i = get_global_id(0);
  const int j = get_global_id(1);
  const int2 k = {i j};
  int l = g.Step / sizeof(uchar);
  int m = h.Step / sizeof(uchar);
  e /= sizeof(float);
  f /= sizeof(float);
  float2 n = i * e .5fi * f .5f
};
int2 o = (int2)(g, gt);
uchar p = I(a, l, n, o);
d[k.y * m + k.x] = p;
}
kernel void W(global const uchar* a, global const float* b, global const float* c, global uchar* d, uint e, uint f, struct SImage g, struct SImage h) {
  const int i = get_global_id(0);
  const int j = get_global_id(1);
  const int2 k = {i j};
  int l = g.Step / sizeof(uchar);
  int m = h.Step / sizeof(uchar);
  e /= sizeof(float);
  f /= sizeof(float);
  float2 n = i * e .5fi * f .5f
};
int2 o = (int2)(g, gt);
uchar p = K(a, l, n, o);
d[k.y * m + k.x] = p;
}

uchar X(global const uchar* a, global const float* b, int c, float2 d, int2 e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);

  d -= (float2)(0.5f, 0.5f);

  int2 j = convert_int2(d);

  float k = 0;
  float l = 0;

  float m[6] = {0};

  for (int n = 0; n < f * 2; n++)
    m[n] = b[h + n * g];

  global const float* o = b + g * 2 * f;

  for (int p = 0; p < f * 2; p++) {
    int q = j.y + p - f + 1;
    q = clamp(q, 0, e.y - 1);

    float r = 0;
    float s = 0;

    for (int n = 0; n < f * 2; n++) {
      int t = j.x + n - f + 1;
      t = clamp(t, 0, e.x - 1);

      float u = m[n];
      r += convert_float(a[q * c + t]) * u;
      s += u;
    }

    r /= s;

    float v = o[i + p * g];
    k += r * v;
    l += v;
  }

  k /= l;

  return convert_uchar_sat(k);
}

float Y(float a) {
  a = (a * 3.14159265359f);
  return sin(a) / a;
}

float Z(float a, int b) {
  if (a >= b || a <= -b)
    return 0;

  if (a == 0)
    return 1;

  return Y(a) * Y(a / b);
}

void AA(global float* a, float b, int c, int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);

  float g = (e + 0.4995f) * b - 0.5f;
  int h = (int)g;
  int i = h - c + 1 + f;
  a[e + f * d] = Z(i - g, c);
}

void AB(global float* a, float b, float c, int d, int e) {
  int f = get_global_id(2);

  if (f)
    AA(a, b, d, e);
  else
    AA(a + e * 2 * d, c, d, e);
}

kernel void AC(global float* a, float b, float c, int d) {
  AB(a, b, c, 2, d);
}

kernel void AD(global float* a, float b, float c, int d) {
  AB(a, b, c, 3, d);
}

void AE(global const uchar* a, global const float* b, global uchar* c, struct SImage d, struct SImage e, float f, float g, int h, int i) {
  const int j = get_global_id(0);
  const int k = get_global_id(1);
  const int2 l = {j k};
  int m = d.Step / sizeof(uchar);
  int n = e.Step / sizeof(uchar);
  if (l.x >= e.Width || l.y >= e.Height)
    return;

   float2 o = {(l + 0.4995f) *l + 0.4995f) * g int2 p = (int2)(d, dt);
   uchar q = X(a, b, m, o, p, h, i);
   c[l.y * n + l.x] = q;
}

kernel void AF(global const uchar* a, global const float* b, global uchar* c, struct SImage d, struct SImage e, float f, float g, int h) {
  AE(a, b, c, d, e, f, g, 2, h);
}

kernel void AG(global const uchar* a, global const float* b, global uchar* c, struct SImage d, struct SImage e, float f, float g, int h) {
  AE(a, b, c, d, e, f, g, 3, h);
}

uchar AH(global const uchar* a, int b, float2 c, int2 d, float2 e) {
  float f = 0;
  float g = 0;

  float2 h = c - e / 2;
  float2 i = h + e;
  int2 j = convert_int2(h);
  int2 k = convert_int2(i - convert_float2(j)) + 1;

  float2 l = 1.f / e;

  for (int m = 0; m < k.y; m++) {
    int n = j.y + m;

    if (n < 0 || n >= d.y)
      continue;

    float o = l.y;
    if (n < h.y)
      o = l.y * (n + 1 - h.y);

    if (n + 1 > i.y)
      o = l.y * (i.y - n);

    for (int p = 0; p < k.x; p++) {
      int q = j.x + p;

      if (q < 0 || q >= d.x)
        continue;

      float r = l.x;
      if (q < h.x)
        r = l.x * (q + 1 - h.x);

      if (q + 1 > i.x)
        r = l.x * (i.x - q);

      float s = r * o;

      f += convert_float(a[n * b + q]) * s;

      g += s;
    }
  }

  f /= g;

  return convert_uchar_sat(f);
}

uchar AI(global const uchar* a, int b, float2 c, int2 d, float e, float f) {
   float2 g = (float2f  float h = 0;

   float2 i = c - g / 2;
   float2 j = i + g;
   int2 k = convert_int2(i);
   int2 l = convert_int2(j - convert_float2(k)) + 1;

   float2 m = 1.f / g;

   if (i.x < 0 || i.y < 0 || j.x > d.x || j.y > d.y)
      return AH(a, b, c, d, g);

   for (int n = 0; n < l.y; n++)
   {
    int o = k.y + n;

    float p = m.y;
    if (o < i.y)
      p = m.y * (o + 1 - i.y);

    if (o + 1 > j.y)
      p = m.y * (j.y - o);

    for (int q = 0; q < l.x; q++) {
      int r = k.x + q;

      float s = m.x;
      if (r < i.x)
        s = m.x * (r + 1 - i.x);

      if (r + 1 > j.x)
        s = m.x * (j.x - r);

      float t = s * p;

      h += convert_float(a[o * b + r]) * t;
    }

   }

   return convert_uchar_sat (h);
}

kernel void AJ(global const uchar* a, global uchar* b, struct SImage c, struct SImage d, float e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int2 i = {g h};
  int j = c.Step / sizeof(uchar);
  int k = d.Step / sizeof(uchar);
  if (i.x >= d.Width || i.y >= d.Height)
    return;

   float2 l = {(i + 0.4995f) *i + 0.4995f) * f int2 m = (int2)(c, ct);
   uchar n = AI(a, j, l, m, e, f);
   b[i.y * k + i.x] = n;
}
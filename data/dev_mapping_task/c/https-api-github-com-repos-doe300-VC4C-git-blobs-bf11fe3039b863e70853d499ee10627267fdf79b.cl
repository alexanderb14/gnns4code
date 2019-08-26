constant uint Ga[256] = {151, 91,  90,  15, 131, 13,  201, 95,  96,  53,  194, 233, 7,   225, 99,  37,  8,   240, 21,  10,  23,  190, 6,   148, 247, 120, 234, 75, 0,  26,  160, 137, 35,  11,  32,  57,  177, 33, 88,  237, 149, 56,  87,  174, 20,  125, 136, 171, 134, 139, 48,  27,  166, 77, 146, 158, 231, 83,  111, 229, 122, 60,  211, 133, 55,  46,  245, 40, 244, 102, 143, 54,  65,  25,  63,  161, 1,   216, 80,  73,  18,  169, 200, 196, 135, 130,
                         116, 188, 159, 86, 164, 100, 109, 198, 173, 186, 250, 124, 123, 5,   202, 38,  147, 118, 126, 255, 82,  85,  212, 207, 206, 59,  189, 28, 42, 223, 183, 170, 213, 119, 248, 152, 2,   44, 154, 163, 70,  221, 43,  172, 9,   129, 22,  39,  253, 19,  98,  108, 110, 79, 113, 224, 232, 178, 97,  228, 251, 34,  242, 193, 238, 210, 144, 12, 191, 179, 162, 241, 81,  51,  107, 49,  192, 214, 31,  181, 199, 106, 157, 184, 84,  204,
                         176, 115, 121, 50, 138, 236, 205, 93,  222, 114, 67,  29,  24,  72,  243, 141, 128, 195, 78,  66,  140, 36,  103, 30,  227, 47,  16,  58, 69, 17,  209, 76,  132, 187, 45,  127, 197, 62, 94,  252, 153, 101, 155, 167, 219, 182, 3,   64,  52,  217, 215, 61,  168, 68, 175, 74,  185, 112, 104, 218, 165, 246, 4,   150, 208, 254, 142, 71, 230, 220, 105, 92,  145, 235, 249, 14,  41,  239, 156, 180, 226, 89,  203, 117};

constant float2 Gb[16] = {{-0.195090322f, -0.98078528f}, {-0.555570233f, -0.831469612f}, {-0.831469612f, -0.555570233f}, {-0.98078528f, -0.195090322f}, {-0.98078528f, 0.195090322f}, {-0.831469612f, 0.555570233f}, {-0.555570233f, 0.831469612f}, {-0.195090322f, 0.98078528f},
                          {0.195090322f, 0.98078528f},   {0.555570233f, 0.831469612f},   {0.831469612f, 0.555570233f},   {0.98078528f, 0.195090322f},   {0.98078528f, -0.195090322f}, {0.831469612f, -0.555570233f}, {0.555570233f, -0.831469612f}, {0.195090322f, -0.98078528f}};

constant char4 Gc[16] = {{1, 1, 0, 0}, {-1, 1, 0, 0}, {1, -1, 0, 0}, {-1, -1, 0, 0}, {1, 0, 1, 0}, {-1, 0, 1, 0}, {1, 0, -1, 0}, {-1, 0, -1, 0}, {0, 1, 1, 0}, {0, -1, 1, 0}, {0, 1, -1, 0}, {0, -1, -1, 0}, {1, 1, 0, 0}, {-1, 1, 0, 0}, {0, -1, 1, 0}, {0, -1, -1, 0}};
unsigned int A(unsigned int a) {
  unsigned int b = a;

  b = (b ^ 61) ^ (b >> 16);
  b *= 9;
  b ^= b << 4;
  b *= 0x27d4eb2d;
  b ^= b >> 15;

  return b;
}
unsigned int B(unsigned int a, unsigned int b) {
  unsigned int c = A(a);

  c = A(b ^ c);

  return c;
}

unsigned int C(unsigned int a, unsigned int b, unsigned int c) {
  unsigned int d = A(a);

  d = A(b ^ d);

  d = A(c ^ d);

  return d;
}

float D(float a) {
  return a * a * (3 - a * 2);
}

float E(float a) {
  return a * a * a * (a * (a * 6 - 15) + 10);
}
float F(uint a, float2 b) {
  uint c = a & 0x0f;

  float2 d = Gb[c];

  return dot(b, d);
}

float G(float a, float b) {
  float c = __clc_floor(a);
  float d = __clc_floor(b);

  float2 e;
  e.x = a - c;
  e.y = b - d;

  float2 f = e;
  f.x -= 1.0f;
  float2 g = e;
  g.y -= 1.0f;
  float2 h = f;
  h.y -= 1.0f;

  int i = (int)(c);
  int j = (int)(d);
  int k = i + 1;
  int l = j + 1;

  uint m = Ga[i & 0x0FF];
  uint n = Ga[k & 0x0FF];

  uint o = Ga[(m + j) & 0x0FF];
  uint p = Ga[(n + j) & 0x0FF];
  uint q = Ga[(m + l) & 0x0FF];
  uint r = Ga[(n + l) & 0x0FF];

  float s = F(o, e);
  float t = F(p, f);
  float u = F(q, g);
  float v = F(r, h);

  float w = E(e.x);
  float x = E(e.y);

  return mix((mix((s), (t), (w))), (mix((u), (v), (w))), (x));
}

float H(uint a, float3 b) {
  uint c = a & 0x0f;

  float3 d = convert_float3(Gc[c].xyz);

  return dot(b, d);
}

float I(float a, float b, float c) {
  float d = __clc_floor(a);
  float e = __clc_floor(b);
  float f = __clc_floor(c);

  float3 g;
  g.x = a - d;
  g.y = b - e;
  g.z = c - f;

  float3 h, i, j, k, l, m, n;
  h = g;
  h.x -= 1.0f;
  k = g;
  k.y -= 1.0f;
  m = g;
  m.z -= 1.0f;

  i = h;
  i.y -= 1.0f;
  j = h;
  j.z -= 1.0f;

  l = k;
  l.z -= 1.0f;

  n = i;
  n.z -= 1.0f;

  int o = (int)(d);
  int p = (int)(e);
  int q = (int)(f);
  uint r = o + 1;
  uint s = p + 1;
  uint t = q + 1;

  uint u = Ga[o & 0x0FF];
  uint v = Ga[r & 0x0FF];

  uint w = Ga[(u + p) & 0x0FF];
  uint x = Ga[(v + p) & 0x0FF];
  uint y = Ga[(u + s) & 0x0FF];
  uint z = Ga[(v + s) & 0x0FF];

  uint aa = Ga[(w + q) & 0x0FF];
  uint ab = Ga[(x + q) & 0x0FF];
  uint ac = Ga[(y + q) & 0x0FF];
  uint ad = Ga[(z + q) & 0x0FF];
  uint ae = Ga[(w + t) & 0x0FF];
  uint af = Ga[(x + t) & 0x0FF];
  uint ag = Ga[(y + t) & 0x0FF];
  uint ah = Ga[(z + t) & 0x0FF];

  float ai = H(aa, g);
  float aj = H(ab, h);
  float ak = H(ac, k);
  float al = H(ad, i);
  float am = H(ae, m);
  float an = H(af, j);
  float ao = H(ag, l);
  float ap = H(ah, n);

  float aq = E(g.x);
  float ar = E(g.y);
  float as = E(g.z);

  float at = mix((mix((mix((ai), (aj), (aq))), (mix((ak), (al), (aq))), (ar))), (mix((mix((am), (an), (aq))), (mix((ao), (ap), (aq))), (ar))), (as));
  return at;
}

float J(float a, float b, float c, float d) {
  float e = 0.0f;

  while (d >= 1.0f) {
    e += d * I(a, b, c);

    d *= 0.5f;
    a *= 2.0f;
    b *= 2.0f;
  }
  return e;
}

kernel void K(__global float* a, float b, float c, float d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  int g = get_global_id(2);

  int h = get_global_size(0);
  int i = get_global_size(0);
  int j = get_global_size(0);

  float k = (float)e / h * b;
  float l = (float)f / i * c;
  float m = (float)g / j * d;
  float n = J(k, l, m, h);

  n *= (float)b;

  a[e + f * h + g * h * i] = n;
}

kernel void L(__global float* a, float b, float c, float d, float e, float f, float g) {
  int h = get_global_id(0);
  int i = get_global_id(1);

  int j = get_global_size(0);

  float k = f + (float)h * b / d;
  float l = g + (float)i * c / e;

  float m;

  m = G(k, l);

  a[h + i * j] = m;
}

kernel void M(__global float* a, int b, float c, float d, float e, float f, float g, float h, float i, float j, float k

              ) {
  int l = get_global_id(0);
  int m = get_global_id(1);
  int n = get_global_id(2);

  int o = get_global_size(0);
  int p = get_global_size(1);

  float q = (float)l * c / f + i;
  float r = (float)m * d / g + j;
  float s = (float)(b + n) * e / h + k;

  float t;

  t = I(q, r, s);

  a[l + m * o + n * o * p] = t;
}
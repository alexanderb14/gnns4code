__constant int Ga = 255; __constant int Gb = 256; __constant int Gc[512] = {
    151, 160, 137, 91, 90,  15,  131, 13,  201, 95,  96,  53,  194, 233, 7,   225, 140, 36,  103, 30,  69,  142, 8,   99,  37,  240, 21,  10,  23,  190, 6,   148, 247, 120, 234, 75,  0,   26,  197, 62,  94,  252, 219, 203, 117, 35,  11,  32,  57,  177, 33,  88,  237, 149, 56,  87,  174, 20,  125, 136, 171, 168, 68,  175, 74,  165, 71,  134, 139, 48,  27,  166, 77,  146, 158, 231, 83,  111, 229, 122, 60,  211, 133, 230, 220, 105,
    92,  41,  55,  46, 245, 40,  244, 102, 143, 54,  65,  25,  63,  161, 1,   216, 80,  73,  209, 76,  132, 187, 208, 89,  18,  169, 200, 196, 135, 130, 116, 188, 159, 86,  164, 100, 109, 198, 173, 186, 3,   64,  52,  217, 226, 250, 124, 123, 5,   202, 38,  147, 118, 126, 255, 82,  85,  212, 207, 206, 59,  227, 47,  16,  58,  17,  182, 189, 28,  42,  223, 183, 170, 213, 119, 248, 152, 2,   44,  154, 163, 70,  221, 153, 101, 155,
    167, 43,  172, 9,  129, 22,  39,  253, 19,  98,  108, 110, 79,  113, 224, 232, 178, 185, 112, 104, 218, 246, 97,  228, 251, 34,  242, 193, 238, 210, 144, 12,  191, 179, 162, 241, 81,  51,  145, 235, 249, 14,  239, 107, 49,  192, 214, 31,  181, 199, 106, 157, 184, 84,  204, 176, 115, 121, 50,  45,  127, 4,   150, 254, 138, 236, 205, 93,  222, 114, 67,  29,  24,  72,  243, 141, 128, 195, 78,  66,  215, 61,  156, 180, 151, 160,
    137, 91,  90,  15, 131, 13,  201, 95,  96,  53,  194, 233, 7,   225, 140, 36,  103, 30,  69,  142, 8,   99,  37,  240, 21,  10,  23,  190, 6,   148, 247, 120, 234, 75,  0,   26,  197, 62,  94,  252, 219, 203, 117, 35,  11,  32,  57,  177, 33,  88,  237, 149, 56,  87,  174, 20,  125, 136, 171, 168, 68,  175, 74,  165, 71,  134, 139, 48,  27,  166, 77,  146, 158, 231, 83,  111, 229, 122, 60,  211, 133, 230, 220, 105, 92,  41,
    55,  46,  245, 40, 244, 102, 143, 54,  65,  25,  63,  161, 1,   216, 80,  73,  209, 76,  132, 187, 208, 89,  18,  169, 200, 196, 135, 130, 116, 188, 159, 86,  164, 100, 109, 198, 173, 186, 3,   64,  52,  217, 226, 250, 124, 123, 5,   202, 38,  147, 118, 126, 255, 82,  85,  212, 207, 206, 59,  227, 47,  16,  58,  17,  182, 189, 28,  42,  223, 183, 170, 213, 119, 248, 152, 2,   44,  154, 163, 70,  221, 153, 101, 155, 167, 43,
    172, 9,   129, 22, 39,  253, 19,  98,  108, 110, 79,  113, 224, 232, 178, 185, 112, 104, 218, 246, 97,  228, 251, 34,  242, 193, 238, 210, 144, 12,  191, 179, 162, 241, 81,  51,  145, 235, 249, 14,  239, 107, 49,  192, 214, 31,  181, 199, 106, 157, 184, 84,  204, 176, 115, 121, 50,  45,  127, 4,   150, 254, 138, 236, 205, 93,  222, 114, 67,  29,  24,  72,  243, 141, 128, 195, 78,  66,  215, 61,  156, 180,
};

__constant int Gd = 15;
__constant int Ge = 16;
__constant int Gf = 4;
__constant float Gg[16 * 4] = {+1.0f, +1.0f, +0.0f, 0.0f, -1.0f, +1.0f, +0.0f, 0.0f, +1.0f, -1.0f, +0.0f, 0.0f, -1.0f, -1.0f, +0.0f, 0.0f, +1.0f, +0.0f, +1.0f, 0.0f, -1.0f, +0.0f, +1.0f, 0.0f, +1.0f, +0.0f, -1.0f, 0.0f, -1.0f, +0.0f, -1.0f, 0.0f, +0.0f, +1.0f, +1.0f, 0.0f, +0.0f, -1.0f, +1.0f, 0.0f, +0.0f, +1.0f, -1.0f, 0.0f, +0.0f, -1.0f, -1.0f, 0.0f, +1.0f, +1.0f, +0.0f, 0.0f, -1.0f, +1.0f, +0.0f, 0.0f, +0.0f, -1.0f, +1.0f, 0.0f, +0.0f, -1.0f, -1.0f, 0.0f};

int A(int a, int b) {
  int c = (a / b);
  int d = d - c * b;
  if (d < 0)
    d += b;
  return d;
}

float B(float a, float b, float c) {
  float d = b - a;
  float e = c * d;
  float f = a + e;
  return f;
}

float2 C(float2 a, float2 b, float c) {
  float2 d = b - a;
  float2 e = c * d;
  float2 f = a + e;
  return f;
}

float4 D(float4 a, float4 b, float c) {
  float4 d = b - a;
  float4 e = c * d;
  float4 f = a + e;
  return f;
}

float E(float a) {
  return a * a * a * (a * (a * 6.0f - 15.0f) + 10.0f);
}

int F(int4 a) {
  return Gc[a.x + Gc[a.y + Gc[a.z]]];
}

float G(int4 a, float4 b) {
  int c = (F(a) & Gd) * Gf;
  float4 d = (float4)(Ggg[c], Ggg[c], Ggg[c], 1.0f);
  return dot(b, d);
}

float4 H(float4 a) {
  float b = sqrt(a.x * a.x + a.y * a.y + a.z * a.z);
  b = b > 0.0f ? b : 1.0f;
  float4 c = (float4)(a.x, a.y, a.z, 0.0f) / b;
  c.w = 1.0f;
  return c;
}

float I(float4 a) {
  float4 b = a;
  float4 c = __clc_floor(b);
  int4 d = (int4)((int)cx, (int)cy, (int)cz, 0.0f);
  float4 e = b - c;
  d &= Ga;

  int4 f = (int4)(0, 0, 0, 0);
  int4 g = (int4)(0, 0, 1, 0);
  int4 h = (int4)(0, 1, 0, 0);
  int4 i = (int4)(0, 1, 1, 0);
  int4 j = (int4)(1, 0, 0, 0);
  int4 k = (int4)(1, 0, 1, 0);
  int4 l = (int4)(1, 1, 0, 0);
  int4 m = (int4)(1, 1, 1, 0);

  float4 n = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  float4 o = (float4)(0.0f, 0.0f, 1.0f, 0.0f);
  float4 p = (float4)(0.0f, 1.0f, 0.0f, 0.0f);
  float4 q = (float4)(0.0f, 1.0f, 1.0f, 0.0f);
  float4 r = (float4)(1.0f, 0.0f, 0.0f, 0.0f);
  float4 s = (float4)(1.0f, 0.0f, 1.0f, 0.0f);
  float4 t = (float4)(1.0f, 1.0f, 0.0f, 0.0f);
  float4 u = (float4)(1.0f, 1.0f, 1.0f, 0.0f);

  float v = G(d + f, e - n);
  float w = G(d + g, e - o);

  float x = G(d + h, e - p);
  float y = G(d + i, e - q);

  float z = G(d + j, e - r);
  float aa = G(d + k, e - s);

  float ab = G(d + l, e - t);
  float ac = G(d + m, e - u);

 float4 ad = (float4)(y float4 ae = (float4)(aaabac

 float4 af = D(ad, ae, E(e.x));
 float2 ag = C(af.xy, af.zw, E(e.y));
 float ah = 0.5f - 0.5f * B(ag.x, ag.y, E(e.z));
 return ah;
}

float J(float4 a, float b, float c, float d, float e) {
  int f = 0;
  float g = 0.0f;

  float h = 0.0f;
  int i = (int)e;

  float j = 0.5f;
  float k = 1.0f;
  float l = 1.0f;

  float m = __clc_fabs((1.0f - 2.0f * I(a * b)));
  m = k - m;
  m *= m;
  h = m;

  for (f = 0; f < i; f++) {
    b *= c;
    l = clamp(m * j, 0.0f, 1.0f);
    m = __clc_fabs((1.0f - 2.0f * I(a * b)));
    m = k - m;
    m *= m;
    m *= l;
    h += m * __clc_pow(c, -g * d);
  }
  return h;
}

float4 K(float4 a, float4 b) {
  float4 c = (float4)(ay * bz - az * by, az * bx - ax * bz, ax * by - ay * bx, 0.0f);
  return c;
}

__kernel void L(const __global float* a, __global float* b, __global float* c, float d, float e, float f, float g, float h, float i, float j) {
  int k = get_global_id(0);

  float4 l = vload4((size_t)k, a);
  float4 m = l;
  l.w = 1.0f;

  j /= e;
  float4 n = l + (float4)(f00 .0f, f00 .0f, f00 .0f, 0.0f);

  float4 o = (float4)(j0 .0f, 1.0f);
  float4 p = (float4)(0.0f, j1 .0f);
    float4 q = (float4)(0.0f, 0.0f, j

    float r = J(n, d, g, h, i);
    float s = J(n + o, d, g, h, i);
    float t = J(n + p, d, g, h, i);
    float u = J(n + q, d, g, h, i);

    float v = (r + s + t + u) / 4.0f;

    float4 w = l + (e * v * m);
    w.w = 1.0f;

    m.x -= (s - r);
    m.y -= (t - r);
    m.z -= (u - r);
    m = H(m / j);

    vstore4(w, (size_t)k, c);
    vstore4(m, (size_t)k, b);
}
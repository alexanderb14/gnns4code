constant int Ga = 255; constant int Gb = 256; constant int Gc[512] = {
    151, 160, 137, 91, 90,  15,  131, 13,  201, 95,  96,  53,  194, 233, 7,   225, 140, 36,  103, 30,  69,  142, 8,   99,  37,  240, 21,  10,  23,  190, 6,   148, 247, 120, 234, 75,  0,   26,  197, 62,  94,  252, 219, 203, 117, 35,  11,  32,  57,  177, 33,  88,  237, 149, 56,  87,  174, 20,  125, 136, 171, 168, 68,  175, 74,  165, 71,  134, 139, 48,  27,  166, 77,  146, 158, 231, 83,  111, 229, 122, 60,  211, 133, 230, 220, 105,
    92,  41,  55,  46, 245, 40,  244, 102, 143, 54,  65,  25,  63,  161, 1,   216, 80,  73,  209, 76,  132, 187, 208, 89,  18,  169, 200, 196, 135, 130, 116, 188, 159, 86,  164, 100, 109, 198, 173, 186, 3,   64,  52,  217, 226, 250, 124, 123, 5,   202, 38,  147, 118, 126, 255, 82,  85,  212, 207, 206, 59,  227, 47,  16,  58,  17,  182, 189, 28,  42,  223, 183, 170, 213, 119, 248, 152, 2,   44,  154, 163, 70,  221, 153, 101, 155,
    167, 43,  172, 9,  129, 22,  39,  253, 19,  98,  108, 110, 79,  113, 224, 232, 178, 185, 112, 104, 218, 246, 97,  228, 251, 34,  242, 193, 238, 210, 144, 12,  191, 179, 162, 241, 81,  51,  145, 235, 249, 14,  239, 107, 49,  192, 214, 31,  181, 199, 106, 157, 184, 84,  204, 176, 115, 121, 50,  45,  127, 4,   150, 254, 138, 236, 205, 93,  222, 114, 67,  29,  24,  72,  243, 141, 128, 195, 78,  66,  215, 61,  156, 180, 151, 160,
    137, 91,  90,  15, 131, 13,  201, 95,  96,  53,  194, 233, 7,   225, 140, 36,  103, 30,  69,  142, 8,   99,  37,  240, 21,  10,  23,  190, 6,   148, 247, 120, 234, 75,  0,   26,  197, 62,  94,  252, 219, 203, 117, 35,  11,  32,  57,  177, 33,  88,  237, 149, 56,  87,  174, 20,  125, 136, 171, 168, 68,  175, 74,  165, 71,  134, 139, 48,  27,  166, 77,  146, 158, 231, 83,  111, 229, 122, 60,  211, 133, 230, 220, 105, 92,  41,
    55,  46,  245, 40, 244, 102, 143, 54,  65,  25,  63,  161, 1,   216, 80,  73,  209, 76,  132, 187, 208, 89,  18,  169, 200, 196, 135, 130, 116, 188, 159, 86,  164, 100, 109, 198, 173, 186, 3,   64,  52,  217, 226, 250, 124, 123, 5,   202, 38,  147, 118, 126, 255, 82,  85,  212, 207, 206, 59,  227, 47,  16,  58,  17,  182, 189, 28,  42,  223, 183, 170, 213, 119, 248, 152, 2,   44,  154, 163, 70,  221, 153, 101, 155, 167, 43,
    172, 9,   129, 22, 39,  253, 19,  98,  108, 110, 79,  113, 224, 232, 178, 185, 112, 104, 218, 246, 97,  228, 251, 34,  242, 193, 238, 210, 144, 12,  191, 179, 162, 241, 81,  51,  145, 235, 249, 14,  239, 107, 49,  192, 214, 31,  181, 199, 106, 157, 184, 84,  204, 176, 115, 121, 50,  45,  127, 4,   150, 254, 138, 236, 205, 93,  222, 114, 67,  29,  24,  72,  243, 141, 128, 195, 78,  66,  215, 61,  156, 180,
};

constant int Gd = 15;
constant int Ge = 16;
constant int Gf = 4;
constant float Gg[16 * 4] = {1.0f, 1.0f, 0.0f, 0.0f, -1.0f, 1.0f, 0.0f, 0.0f, 1.0f, -1.0f, 0.0f, 0.0f, -1.0f, -1.0f, 0.0f, 0.0f, 1.0f, 0.0f, 1.0f, 0.0f, -1.0f, 0.0f, 1.0f, 0.0f, 1.0f, 0.0f, -1.0f, 0.0f, -1.0f, 0.0f, -1.0f, 0.0f, 0.0f, 1.0f, 1.0f, 0.0f, 0.0f, -1.0f, 1.0f, 0.0f, 0.0f, 1.0f, -1.0f, 0.0f, 0.0f, -1.0f, -1.0f, 0.0f, 1.0f, 1.0f, 0.0f, 0.0f, -1.0f, 1.0f, 0.0f, 0.0f, 0.0f, -1.0f, 1.0f, 0.0f, 0.0f, -1.0f, -1.0f, 0.0f};

float A(float a) {
  return a * a * a * (a * (a * 6.0f - 15.0f) + 10.0f);
}

float4 B(float4 a) {
  float b = sqrt(a.x * a.x + a.y * a.y + a.z * a.z);
  b = b > 0.0f ? b : 1.0f;
  float4 c = (float4)(a.x, a.y, a.z, 0.0f) / b;
  c.w = 1.0f;
  return c;
}

int C(int a) {
  return Gc[a];
}

int D(int2 a) {
  return Gc[a.x + Gc[a.y]];
}

int E(int4 a) {
  return Gc[a.x + Gc[a.y + Gc[a.z]]];
}

float F(int a, float b) {
  int c = (C(a) & Gd) * Gf;
  float d = Gg[c + 0];
  return b * d;
}

float G(int2 a, float2 b) {
  int c = (D(a) & Gd) * Gf;
  float2 d = (float2)(Ggg[c], Ggg[c]);
  return dot(b, d);
}

float H(int4 a, float4 b) {
  int c = (E(a) & Gd) * Gf;
  float4 d = (float4)(Ggg[c], Ggg[c], Ggg[c], 1.0f);
  return dot(b, d);
}

float I(float a) {
  float b = a;
  float c = __clc_floor(b);
  int d = (int)c;
  float e = b - c;
  d &= Ga;

  float f = F(d + 0, e - 0.0f);
  float g = F(d + 1, e - 1.0f);

  float h = mix(f, g, A(e));
  return h * (1.0f / 0.7f);
}

float J(float2 a) {
  float2 b = a;
  float2 c = __clc_floor(b);
  int2 d = (int2)((int)cx, (int)cy);
  float2 e = b - c;
  d &= Ga;

  const int2 f = (int2)(0, 0);
  const int2 g = (int2)(0, 1);
  const int2 h = (int2)(1, 0);
  const int2 i = (int2)(1, 1);

  const float2 j = (float2)(0.0f, 0.0f);
  const float2 k = (float2)(0.0f, 1.0f);
  const float2 l = (float2)(1.0f, 0.0f);
  const float2 m = (float2)(1.0f, 1.0f);

  float n = G(d + f, e - j);
  float o = G(d + h, e - l);
  float p = G(d + g, e - k);
  float q = G(d + i, e - m);

 const float2 r = (float2)(np
 const float2 s = (float2)(oq

 float2 t = mix(r, s, A(e.x));
 float u = mix(t.x, t.y, A(e.y));
 return u * (1.0f / 0.7f);
}

float K(float4 a) {
  float4 b = a;
  float4 c = __clc_floor(b);
  int4 d = (int4)((int)cx, (int)cy, (int)cz, 0.0);
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

  float v = H(d + f, e - n);
  float w = H(d + g, e - o);

  float x = H(d + h, e - p);
  float y = H(d + i, e - q);

  float z = H(d + j, e - r);
  float aa = H(d + k, e - s);

  float ab = H(d + l, e - t);
  float ac = H(d + m, e - u);

 float4 ad = (float4)(y float4 ae = (float4)(aaabac

 float4 af = mix(ad, ae, A(e.x));
 float2 ag = mix(af.xy, af.zw, A(e.y));
 float ah = mix(ag.x, ag.y, A(e.z));
 return ah * (1.0f / 0.7f);
}

float L(float a) {
  return (0.5f - 0.5f * I(a));
}

float M(float2 a) {
  return (0.5f - 0.5f * J(a));
}

float N(float4 a) {
  return (0.5f - 0.5f * K(a));
}

uchar4 O(float4 a) {
  uchar4 b = convert_uchar4_sat_rte(a * 255.0f);
  return b;
}

float P(float2 a, float b, float c, float d, float e) {
  int f = 0;
  float g = 0.0f;
  float h = 0.0f;
  float i = 0.0f;
  float j = 0.0f;
  int k = (int)e;

  for (f = 0; f < k; f++) {
    g = (float)f;
    i = J(a * b);
    i *= __clc_pow(c, -g * d);
    j += i;
    b *= c;
  }

  h = e - (float)k;
  if (h > 0.0f) {
    i = h * J(a * b);
    i *= __clc_pow(c, -g * d);
    j += i;
  }

  return j;
}

float Q(float2 a, float b, float c, float d, float e) {
  int f = 0;
  float g = 0.0f;
  float h = 0.0f;
  float i = 0.0f;
  float j = 1.0f;
  int k = (int)e;

  for (f = 0; f < k; f++) {
    g = (float)f;
    i = J(a * b) + 1.0f;
    i *= __clc_pow(c, -g * d);
    j *= i;
    b *= c;
  }

  h = e - (float)k;
  if (h > 0.0f) {
    i = h * (J(a * b) + 1.0f);
    i *= __clc_pow(c, -g * d);
    j *= i;
  }

  return j;
}

float R(float2 a, float b, float c, float d, float e) {
  int f = 0;
  float g = 0.0f;
  float h = 0.0f;
  float i = 0.0f;
  float j = 0.0f;
  int k = (int)e;

  for (f = 0; f < k; f++) {
    g = (float)f;
    i = J(a * b);
    i *= __clc_pow(c, -g * d);
    j += __clc_fabs(i);
    b *= c;
  }

  h = e - (float)k;
  if (h > 0.0f) {
    i = h * J(a * b);
    i *= __clc_pow(c, -g * d);
    j += __clc_fabs(i);
  }

  return j;
}

float S(float2 a, float b, float c, float d, float e) {
  int f = 0;
  float g = 0.0f;
  float h = 0.0f;
  float i = 0.0f;
  float j = 0.0f;
  int k = (int)e;

  float l = 0.5f;
  float m = 1.0f;
  float n = 1.0f;

  float o = __clc_fabs(J(a * b));
  o = m - o;
  o *= o;
  j = o;

  for (f = 0; f < k; f++) {
    b *= c;
    n = clamp(o * l, 0.0f, 1.0f);
    o = __clc_fabs(J(a * b));
    o = m - o;
    o *= o;
    o *= n;
    j += o * __clc_pow(c, -g * d);
  }

  return j;
}

float T(float4 a, float b, float c, float d, float e) {
  int f = 0;
  float g = 0.0f;
  float h = 0.0f;
  float i = 0.0f;
  float j = 1.0f;
  int k = (int)e;

  for (f = 0; f < k; f++) {
    g = (float)f;
    i = (1.0f - 2.0f * K(a * b)) + 1.0f;
    i *= __clc_pow(c, -g * d);
    j *= i;
    b *= c;
  }

  h = e - (float)k;
  if (h > 0.0f) {
    i = h * (1.0f - 2.0f * K(a * b)) + 1.0f;
    i *= __clc_pow(c, -g * d);
    j *= i;
  }

  return j;
}

float U(float4 a, float b, float c, float d, float e) {
  int f = 0;
  float g = 0.0f;
  float h = 0.0f;
  float i = 0.0f;
  float j = 0.0f;
  int k = (int)e;

  float l = 0.5f;
  float m = 1.0f;
  float n = 1.0f;

  float o = __clc_fabs((1.0f - 2.0f * K(a * b)));
  o = m - o;
  o *= o;
  j = o;

  for (f = 0; f < k; f++) {
    b *= c;
    n = clamp(o * l, 0.0f, 1.0f);
    o = __clc_fabs((1.0f - 2.0f * K(a * b)));
    o = m - o;
    o *= o;
    o *= n;
    j += o * __clc_pow(c, -g * d);
  }

  return j;
}

float V(float4 a, float b, float c, float d, float e) {
  int f = 0;
  float g = 0.0f;
  float h = 0.0f;
  float i = 0.0f;
  float j = 0.0f;
  int k = (int)e;

  for (f = 0; f < k; f++) {
    g = (float)f;
    i = (1.0f - 2.0f * K(a * b));
    i *= __clc_pow(c, -g * d);
    j += __clc_fabs(i);
    b *= c;
  }

  h = e - (float)k;
  if (h > 0.0f) {
    i = h * (1.0f - 2.0f * K(a * b));
    i *= __clc_pow(c, -g * d);
    j += __clc_fabs(i);
  }

  return j;
}
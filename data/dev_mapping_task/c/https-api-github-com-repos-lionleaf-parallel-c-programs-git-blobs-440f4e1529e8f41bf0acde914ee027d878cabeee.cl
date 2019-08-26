typedef struct {
  float x;
  float y;
  float z;
} floatk3;

floatk3 A(floatk3 a, floatk3 b) {
  floatk3 c;
  c.x = a.y * b.z - a.z * b.y;
  c.y = a.z * b.x - a.x * b.z;
  c.z = a.x * b.y - a.y * b.x;

  return c;
}

floatk3 B(floatk3 a) {
  float b = sqrt(a.x * a.x + a.y * a.y + a.z * a.z);
  a.x /= b;
  a.y /= b;
  a.z /= b;

  return a;
}

floatk3 C(floatk3 a, floatk3 b) {
  a.x += b.x;
  a.y += b.y;
  a.z += b.z;

  return a;
}

floatk3 D(floatk3 a, float b) {
  a.x *= b;
  a.y *= b;
  a.z *= b;

  return a;
}

int E(floatk3 a) {
  int b = (a.x >= 0 && a.x < 512 - 1);
  int c = (a.y >= 0 && a.y < 512 - 1);
  int d = (a.z >= 0 && a.z < 512 - 1);

  return b && c && d;
}

int F(int a, int b, int c) {
  return a * 512 * 512 + b * 512 + c;
}

float G(floatk3 a, __global unsigned char* b) {
  if (!E(a)) {
    return 0;
  }

  int c = __clc_floor(a.x);
  int d = __clc_floor(a.y);
  int e = __clc_floor(a.z);

  int f = __clc_ceil(a.x);
  int g = __clc_ceil(a.y);
  int h = __clc_ceil(a.z);

  float i = a.x - c;
  float j = a.y - d;
  float k = a.z - e;

  float l = i * b[F(e, d, c)] + (1 - i) * b[F(e, d, f)];
  float m = i * b[F(e, g, c)] + (1 - i) * b[F(e, g, f)];
  float n = i * b[F(h, d, c)] + (1 - i) * b[F(h, d, f)];
  float o = i * b[F(h, g, c)] + (1 - i) * b[F(h, g, f)];

  float p = j * l + (1 - j) * m;
  float q = j * n + (1 - j) * o;

  float r = k * p + (1 - k) * q;

  return r;
}

__kernel void H(__global unsigned char* a, __global unsigned char* b, __global unsigned char* c) {
  floatk3 d = {.x = 1000, .y = 1000, .z = 1000};
  floatk3 e = {.x = -1, .y = -1, .z = -1};
  floatk3 f = {.x = 0, .y = 0, .z = 1};

  floatk3 g = A(e, f);
  floatk3 h = A(g, e);

  e = B(e);
  g = B(g);
  h = B(h);

  float i = 3.14 / 4;
  float j = tan(i / 2.0) / (64 / 2);
  float k = 0.5;

  int l = 64;

  int m = get_global_id(0) - (64 / 2);

  int n = get_global_id(1) - (64 / 2);

  floatk3 o = C(d, e);
  floatk3 p = C(C(o, D(g, m * j)), D(h, n * j));
  p = C(p, D(d, -1));
  p = B(p);
  floatk3 q = d;

  int r = 0;
  float s = 0;
  while (s < 255 && r < 5000) {
    r++;
    q = C(q, D(p, k));
    int t = G(q, b);
    s += G(q, a) * (0.01 + t);
  }

  c[(n + (64 / 2)) * 64 + (m + (64 / 2))] = s > 255 ? 255 : s;
}
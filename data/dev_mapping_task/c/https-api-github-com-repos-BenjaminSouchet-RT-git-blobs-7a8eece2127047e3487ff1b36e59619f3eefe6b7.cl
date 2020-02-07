typedef struct s_shader {
  float3 col1;
  float3 col2;
  float3 col3;
} t_shader;

void A(float3 a, t_shader* b);
float3 B(float3 a);
float3 C(int a);
float3 D(float3 a);
float3 E(float3 a);
float3 F(float3 a);
float3 G(float3 a);
float3 H(float a, t_shader b);
float3 I(float a, t_shader b);
float3 J(float a, t_shader b);
float3 K(float3 a, int b, float3 c);
float3 L(float3 a, int b, float3 c);
double M(int a);
double N(float3 a);
double O(float3 a);
double P(int a, int b, int c);
double Q(double a, double b, double c);
double R(int a, float b, double c, float3 d);

double M(int a) {
  a = (a << 13) ^ a;
  a = (a * (a * a * 15731 + 789221) + 1376312589);
  return ((a & 0x7fffffff) / 1073741824.0);
}

double P(int a, int b, int c) {
  int d;
  int e;
  d = M(a) * 850000;
  e = M(d + b) * 850000;
  return (M(e + c));
}

double Q(double a, double b, double c) {
  double d;

  d = (1 - cos(c * 3.1415927)) * .5;
  return (1. - d) * a + d * b;
}

double O(float3 a) {
  int3 b;
  double3 c;
  double3 d;
  double3 e;

  b.x = (int)a.x;
  b.y = (int)a.y;
  b.z = (int)a.z;
  if (a.x < 0)
    b.x = (int)a.x - 1;
  if (a.y < 0)
    b.y = (int)a.y - 1;
  if (a.z < 0)
    b.z = (int)a.z - 1;

  c.x = (double)a.x - b.x;
  c.y = (double)a.y - b.y;
  c.z = (double)a.z - b.z;

  double f = P(b.x, b.y, b.z);
  double g = P(b.x + 1, b.y, b.z);

  double h = P(b.x, b.y + 1, b.z);
  double i = P(b.x + 1, b.y + 1, b.z);

  double j = P(b.x, b.y, b.z + 1);
  double k = P(b.x + 1, b.y, b.z + 1);

  double l = P(b.x, b.y + 1, b.z + 1);
  double m = P(b.x + 1, b.y + 1, b.z + 1);

  d.x = Q(f, g, c.x);
  d.y = Q(h, i, c.x);
  d.z = Q(d.x, d.y, c.y);

  e.x = Q(j, k, c.x);
  e.y = Q(l, m, c.x);
  e.z = Q(e.x, e.y, c.y);

  return Q(d.z, e.z, c.z);
}

double R(int a, float b, double c, float3 d) {
  double e = 0.0;
  float f = 1.0f;
  int g = 0;
  int h;

  while (g < a) {
    h = g * 4096;
    e += O(d * b) * f;
    f *= c;
    b *= 2.0;
    g++;
  }
  return (e * ((1 - c) / (1 - f)));
}
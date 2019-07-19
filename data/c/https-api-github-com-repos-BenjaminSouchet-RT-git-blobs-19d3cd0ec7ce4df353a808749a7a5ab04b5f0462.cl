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

float3 F(float3 a) {
  double b;
  t_shader c;

  c.col1 = (float3){42.2f, 74.4f, 179.0f};
  c.col2 = (float3){34.0f, 129.0f, 24.0f};
  c.col3 = (float3){135.0f, 66.f, 8.0f};
  c.col1 /= 255.0f;
  c.col2 /= 255.0f;
  c.col3 /= 255.0f;
  b = R(12, 0.125, 0.5, a / 1.0f);
  b = b - (int)b;
  return (J(b, c));
}

float3 J(float a, t_shader b) {
  float c = 0.50f;
  float d = 0.75f;
  float e = 0.875f;
  float f = 1.0f;
  if (a >= -1.0f && a < 0.5f)
    return (b.col1);
  if (a >= c && a < d)
    return ((b.col1 * (a - c) / (d - c) + b.col2 * (d - a) / (d - c)));
  else if (a >= d && a < e)
    return ((b.col3 * (a - d) / (e - d) + b.col2 * (e - a) / (e - d)));
  return ((b.col2 * (a - e) / (f - e) + b.col3 * (f - a) / (f - e)));
}
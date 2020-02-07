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

float3 D(float3 a) {
  double b;
  t_shader c;

  c.col1 = (float3){210.0f, 210.0f, 210.0f};
  c.col2 = (float3){155.0f, 155.0f, 155.0f};
  c.col3 = (float3){105.0f, 105.0f, 105.0f};
  c.col1 /= 255.0f;
  c.col2 /= 255.0f;
  c.col3 /= 255.0f;
  b = R(12, 0.125, 0.5, a * 5.0f);
  b = b - (int)b;
  return (J(b, c));
}

float3 H(float a, t_shader b) {
  float c = -1.0f;
  float d = -0.5f;
  float e = 0.5f;
  float f = 1.0f;
  if (a >= c && a < d)
    return ((b.col2 * (a - c) / (d - c) + b.col1 * (d - a) / (d - c)));
  else if (a >= d && a < e)
    return ((b.col3 * (a - d) / (e - d) + b.col2 * (e - a) / (e - d)));
  return ((b.col2 * (a - e) / (f - e) + b.col3 * (f - a) / (f - e)));
}
float2 A(float2 a) {
  float2 b = {ax, -ay};
  return b;
}

float2 B(float2 a, float2 b) {
  float2 c = {a + b, a + b};
  return c;
}

float2 C(float2 a, float2 b) {
  float2 c = {a - b, a - b};
  return c;
}

float2 D(float2 a, float2 b) {
  float2 c;
  c.x = a.x * b.x - a.y * b.y;
  c.y = a.x * b.y + a.y * b.x;
  return c;
}

float2 E(float2 a, float2 b) {
  float c = hypot((b).x, (b).y);
  float d = 1.0f / c;
  float e = d * b.x;
  float f = d * b.y;
  float2 g = { a* a* f a* a* f g.x *= d;
  g.y *= d;
  return g;
}
float2 F(float2 a, float2 b) {
  return hypot((a).x, (a).y) < hypot((b).x, (b).y) ? a : b;
}

float2 G(float2 a, float2 b) {
  return hypot((a).x, (a).y) > hypot((b).x, (b).y) ? a : b;
}

float2 H(float a, float b) {
  float2 c = { ab return c;
}

float2 I(float a) {
  float2 b = {a 0};
  return b;
}
float2 J(float2 a) {
  return a;
}
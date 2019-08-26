float2 A(float a) {
  float b;
  float c = sincos(a, &b);
  return (float2)(b, c);
}

float2 B(float a) {
  return A(a * 3.14);
}

float2 C(float2 a, float b) {
  float2 c = A(b);
    return (float2)(cx * a cy * a                    cy * a cx * a
}
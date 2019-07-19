float A(float a, float b, float c); float B(float a, float b, float c); inline float A(float a, float b, float c) {
  float d = a / b;

  float e = ((1.0f - d) * (1.0f - d)) / ((1.0f + d) * (1.0f + d));
  float f = 1.0f - __clc_fabs(c);
  float g = f * f;
  return e + (1.0f - e) * g * g * f;
}

inline float B(float a, float b, float c) {
  float d = c * c;
  float e = 2.0f * a * c;

  float f = a * a + b * b;
  float g = f * d;
  float h = (f - e + d) / (f + e + d);
  float i = (g - e + 1) / (g + e + 1);

  return 0.5f * (i + h);
}
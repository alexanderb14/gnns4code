float A(float a, float b, float c, float d); float A(float a, float b, float c, float d) {
  float e = b - a;
  float f = c - d;
  float g = f / 2.0;

  if (e < -1 * g)
    return e + f;

  if (e >= g)
    return e - f;

  return e;
}

void B(float a, float b, float* c, float* d);
void B(float a, float b, float* c, float* d) {
  (*c) = sqrt(a * a + b * b);
  (*d) = atan2(b, a);
}

__kernel void C(__global float* a, __global float* b, __global float* c, __global float* d, __private unsigned int e, __private unsigned int f) {
  size_t g = get_global_id(0);
  size_t h = e + g;

  float i = 0;
  float j = 0;
  float k = b[h];
  float l = b[f + h];
  float m = 0;
  float n = 0;

  B(a[h], a[f + h], &i, &j);
  B(c[h], c[f + h], &m, &n);

  if (g < f) {
    d[h] = (i - m) / k;
    d[f + h] = A(j, n, 3.14, -1 * 3.14) / l;
  }
}
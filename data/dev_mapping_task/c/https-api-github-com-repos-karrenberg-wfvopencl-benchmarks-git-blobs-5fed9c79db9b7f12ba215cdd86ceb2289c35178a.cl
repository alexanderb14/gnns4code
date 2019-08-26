__kernel void A(int a, const __global float* b, __global float* c, __local float* d, __local float* e) {
  unsigned int f = get_local_id(0);
  unsigned int g = get_group_id(0);

  float h = b[g];

  float i = (1.0f - h) * 5.0f + h * 30.f;
  float j = (1.0f - h) * 1.0f + h * 100.f;
  float k = (1.0f - h) * 0.25f + h * 10.f;
  float l = k * (1.0f / (float)a);
  float m = 0.30f * sqrt(l);
  float n = 0.02f * l;
  float o = exp(n);
  float p = 1.0f / o;
  float q = exp(m);
  float r = 1.0f / q;
  float s = (o - r) / (q - r);
  float t = 1.0f - s;
  float u = s * p;
  float v = t * p;

  float w = i * exp(m * (2.0f * f - (float)a)) - j;
  d[f] = w > 0 ? w : 0.0f;

  barrier(1);

  for (int x = a; x > 0; x -= 2) {
    if (f < x) {
      e[f] = u * d[f] + v * d[f + 1];
    }
    barrier(1);

    if (f < x - 1) {
      d[f] = u * e[f] + v * e[f + 1];
    }
    barrier(1);
  }

  if (f == 0)
    c[g] = d[0];
}
bool A(const float3 a, const float b, const float3 c, const float3 d, float* __restrict e, float* __restrict f) {
  float3 g = c - a;
  float h = dot(g, d);
  float i = dot(g, g) - b * b;

  if (i > 0.f && h > 0.f)
    return false;

  float j = h * h - i;

  if (j < 0.f)
    return false;

  *f = -h - sqrt(j);

  if (*f < 0.f)
    *f = 0.f;

  return true;
}
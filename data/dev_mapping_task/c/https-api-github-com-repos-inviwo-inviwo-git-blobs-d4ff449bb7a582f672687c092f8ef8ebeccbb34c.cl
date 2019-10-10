bool A(const float3 a, const float3 b, float c, const float3 d, const float3 e, float* __restrict f, float* __restrict g) {
  float h = dot(e, b);

  if (h <= 0.f)
    return false;
  float i = dot((a - d), b);

  *g = i / h;
  return distance(d + (*g) * e, a) <= c;
}
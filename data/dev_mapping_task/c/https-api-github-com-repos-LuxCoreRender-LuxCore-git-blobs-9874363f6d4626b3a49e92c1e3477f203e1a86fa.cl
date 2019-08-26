int A(const float3 a, const float3 b, const float3 c, const float3 d, const float e, const float f) {
  const float3 g = (a - c) * d;
  const float3 h = (b - c) * d;
  const float3 i = fmin(g, h);
  const float3 j = fmax(g, h);

  float k = fmax(fmax(fmax(i.x, i.y), fmax(i.x, i.z)), e);
  float l = fmin(fmin(fmin(j.x, j.y), fmin(j.x, j.z)), f);

  return (l > k);
}
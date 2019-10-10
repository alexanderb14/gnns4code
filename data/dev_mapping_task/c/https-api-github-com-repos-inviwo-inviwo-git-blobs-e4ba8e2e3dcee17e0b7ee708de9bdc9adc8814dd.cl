typedef struct {
  float3 pMin;
  float3 pMax;
} BBox;
bool A(const BBox a, const float3 b, const float3 c, float* __restrict d, float* __restrict e) {
  float3 f = 1.f / c;
  float3 g = ((a).pMin - b) * f;
  float3 h = ((a).pMax - b) * f;
  float3 i = fmin(g, h);
  float3 j = fmax(g, h);

  *d = fmax(*d, fmax(fmax(i.x, i.y), i.z));
  *e = fmin(*e, fmin(fmin(j.x, j.y), j.z));

  return (*d < *e) && (*e < 0x1.fffffep127f);
}
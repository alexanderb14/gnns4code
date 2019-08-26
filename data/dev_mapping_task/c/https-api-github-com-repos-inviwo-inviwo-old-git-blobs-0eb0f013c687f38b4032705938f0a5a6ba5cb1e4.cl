float A(const float3 a, const float b[8]) {
  float c = mix(b[0], b[4], a.z);
  float d = mix(b[1], b[5], a.z);
  float e = mix(b[2], b[6], a.z);
  float f = mix(b[3], b[7], a.z);

  float g = mix(c, e, a.y);
  float h = mix(d, f, a.y);

  return mix(g, h, a.x);
}
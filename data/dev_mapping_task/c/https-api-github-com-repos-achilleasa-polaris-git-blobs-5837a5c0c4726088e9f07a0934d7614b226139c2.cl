float2 A(uint2* a); float2 A(uint2* a) {
  const float2 b = (float2)(1.0f / 4294967296.0f, 1.0f / 4294967296.0f);
  uint c = (*a).x * 17 + (*a).y * 13123;
  (*a).x = (c << 13) ^ c;
  (*a).y ^= (c << 7);

  uint2 d = (uint2)((c * (c * c * 15731 + 74323) + 871483), (c * (c * c * 13734 + 37828) + 234234));
  return convert_float2(d) * b;
}
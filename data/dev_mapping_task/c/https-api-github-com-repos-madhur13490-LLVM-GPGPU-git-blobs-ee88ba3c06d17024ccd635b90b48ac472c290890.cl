typedef __attribute__((ext_vector_type(2))) float float2; typedef __attribute__((ext_vector_type(4))) float float4; float2 A(float4 a) {
  return a.xy + a.wz;
}

float4 B(float4 a) {
  float2 b = a.ww;
  return b.xyxy + b.yxyx;
}

float4 C(float4 a, float4 b) {
  return (float4)(azw, bxy);
}
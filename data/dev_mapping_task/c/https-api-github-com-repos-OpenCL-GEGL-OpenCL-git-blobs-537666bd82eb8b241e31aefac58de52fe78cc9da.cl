__kernel void A(__global const float4* a, __global float4* b, float c) {
  int d = get_global_id(0);
  float4 e = a[d];
  float f = e.x * 0.5133333f;
  float g = e.y * 1;
  float h = e.z * 0.1933333f;
  float i = (c - 0.4f) * 2;
  float j;

  if (f >= g - i && f >= h - i) {
    j = (g + h) / (2.0f * 0.5133333f);
    e.x = clamp(j, 0.0f, 1.0f);
  }
  b[d] = e;
}
__kernel void A(__global const float4* a, __global float2* b, const int c, float d, float e, float f) {
  int g = get_global_id(0);
  float4 h = a[g];
  float i = 1.0f;

  if (c) {
    float j = d + e + f;
    if (j == 0.0)
      i = 1.0f;
    else
      i = __clc_fabs(1.0f / j);
  }

  b[g].x = (h.x * d + h.y * e + h.z * f) * i;
  b[g].y = h.w;
}
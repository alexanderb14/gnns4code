__kernel void A(__global float* restrict a, __global float* restrict const b, __global float* restrict c, const uint d, const float e, const float f) {
  const int g = get_global_id(1);
  const int h = get_global_id(0);
  float4 i = (float4)0.0f;
  float4 j;

  a += g * d;

  uint k = h;

  for (int l = 0; l < d; l += 4) {
    j.x = b[k];
    k += d;

    j.y = b[k];
    k += d;

    j.z = b[k];
    k += d;

    j.w = b[k];
    k += d;

    i += vload4(0, a) * j;
    a += 4;
  }

  c[g * d + h] = e * (i.x + i.y + i.z + i.w) + f * c[g * d + h];
}
__kernel void A(__global float2* a, __global float* restrict b, __global float* restrict c, int d, int e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h = f + d * g;

  if (f < d && g < e) {
    a[h].x *= -4.0f * 3.1415129f * 3.141592f * (b[f] * b[f] + c[g] * c[g]);
    a[h].y *= -4.0f * 3.1415129f * 3.141592f * (b[f] * b[f] + c[g] * c[g]);
  }
}
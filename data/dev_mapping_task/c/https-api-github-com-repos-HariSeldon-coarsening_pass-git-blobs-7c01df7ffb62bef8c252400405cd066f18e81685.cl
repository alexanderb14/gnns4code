__kernel void A(__global float* a, const uint b, const __global ushort* c, const uint d, const int e) {
  uint f = get_global_id(0);
  uint g = get_global_id(1);

  a[f + b * g] = c[f * e + d * g * e] / 1000.0f;
}
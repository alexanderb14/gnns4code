__kernel void A(float a, __global float* b, uint c, __global float* d) {
  uint e = get_global_id(0);
  float f = b[e * c];
  float g = d[e];
  g += a * f;
  d[e] = g;
}
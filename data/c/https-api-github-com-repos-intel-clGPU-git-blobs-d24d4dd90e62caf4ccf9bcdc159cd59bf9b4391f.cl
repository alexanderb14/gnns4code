__kernel void A(float a, __global float* b, __global float* c, uint d) {
  uint e = get_global_id(0);
  float f = b[e];
  float g = c[e * d];
  g += a * f;
  c[e * d] = g;
}
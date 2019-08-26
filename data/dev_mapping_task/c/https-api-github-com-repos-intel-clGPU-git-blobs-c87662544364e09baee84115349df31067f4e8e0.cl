__kernel void A(__global uint2* a, int b, __global uint2* c, int d) {
  uint e = get_global_id(0);
  uint2 f = a[e * b];
  uint2 g = c[e * d];
  c[e * d] = f;
  a[e * b] = g;
}
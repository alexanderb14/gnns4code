__kernel void A(__global uint* a, uint b, __global uint* c, uint d) {
  uint e = get_global_id(0);
  uint f = a[e * b];
  uint g = c[e * d];
  a[e * b] = g;
  c[e * d] = f;
}
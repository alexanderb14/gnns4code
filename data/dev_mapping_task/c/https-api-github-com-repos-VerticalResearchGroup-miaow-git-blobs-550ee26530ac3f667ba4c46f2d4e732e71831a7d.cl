uint A(uint a, uint b, uint c, uint d, uint e, uint f) {
  uint g = a * e + c;
  uint h = b * e + d;

  return (h * f + g);
}
__kernel void B(__global int* a, __global int* b, __global int* c, const uint d, const uint e) {
  uint f = get_global_id(0);
  uint g = get_global_id(1);
  uint h = g * d + f;

  a[h] = b[h] + c[h];
}
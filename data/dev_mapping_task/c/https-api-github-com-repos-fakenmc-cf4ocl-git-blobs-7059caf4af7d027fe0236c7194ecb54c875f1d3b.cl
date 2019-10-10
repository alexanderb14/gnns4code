uint A(uint a, uint b, uint c); uint B(uint a, uint b, uint c); __kernel void C(__global const uint* a, __global const uint* b, __global uint* c, uint d) {
  uint e;

  int f = get_global_id(0);

  e = A(a[f], b[f], d);

  c[f] = B(e, b[f], d * 2);
}
uint A(uint a, uint b, uint c); __kernel void B(__global const uint* a, __global const uint* b, __global uint* c, uint d) {
  int e = get_global_id(0);

  c[e] = A(a[e], b[e], d);
}
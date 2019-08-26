__kernel void A(const uint a, const float b, __global uint* c) {
  uint d = get_global_id(0);
  uint e = a + (uint)b;

  c[d] = e;
}

__kernel void B(__global uint* a, const uint b, __global uint* c) {
  uint d = get_global_id(0);

  c[d] = a[d] + b;
}

__kernel void C(const uint a, __global uint* b) {
  uint c = get_global_id(0);

  b[c] = a;
}
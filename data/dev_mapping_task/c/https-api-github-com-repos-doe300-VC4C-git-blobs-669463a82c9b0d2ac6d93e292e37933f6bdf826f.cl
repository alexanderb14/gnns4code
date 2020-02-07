__kernel void A(__global uint* a, uint b, __global int* c, uint d) {
  uint e = get_global_id(0) * b;
  int f = c[e];
  if (f >= d) {
    atomic_min(a, e);
  }
}

__kernel void B(__global int* a, __global int* b) {
  const uint c = get_global_id(0);
  const int d = b[1167 + (c)];
  if (d >= 3) {
    atomic_min(a, c);
  }
}
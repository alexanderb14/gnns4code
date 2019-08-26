__kernel void A(__global uint* a) {
  uint b = 1099087573;
  a[0] = b;
  for (uint c = 1; c < 1024; c++) {
    a[c] = b * a[c - 1];
  }
}

__kernel void B(const uint a, __global uint* b, __global uint* c, const uint d) {
  const uint e = get_global_id(0);
  c[d + e] = a * b[e];
}
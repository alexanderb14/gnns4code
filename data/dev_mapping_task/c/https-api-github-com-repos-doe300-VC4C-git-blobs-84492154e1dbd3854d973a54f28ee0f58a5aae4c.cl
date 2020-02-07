__kernel void A(uint a, __global char* b, __global char* c, __global uint* d) {
  uint e = get_global_id(0);
  const uint f = e;
  uint g;
  for (g = 0; g < a; g++, e++) {
    if (b[g] != c[e])
      g = a + 1;
  }
  if (g == a)
    d[f] = 1;
  else
    d[f] = 0;
}

__kernel void B(__global int* a, __global uint* b) {
  const uint c = get_global_id(0);
  const uint d = b[c];
  if (d == (1u)) {
    atomic_min(a, c);
  }
}
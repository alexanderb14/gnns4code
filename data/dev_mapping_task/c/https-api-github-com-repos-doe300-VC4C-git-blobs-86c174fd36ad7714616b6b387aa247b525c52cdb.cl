__kernel void A(const uint a, __global uint* b, __global int* c) {
  uint d = a;
  for (uint e = 0; e < a - 1; e++) {
    if (c[e] == c[e + 1]) {
      d = e;
      break;
    }
  }
  *b = d;
}

__kernel void B(const uint a, __global uint* b, __global int2* c) {
  uint d = a;
  for (uint e = 0; e < a - 1; e++) {
    if (all(c[e] == c[e + 1])) {
      d = e;
      break;
    }
  }
  *b = d;
}

__kernel void C(__global uint* a, __global int* b) {
  const uint c = get_global_id(0);
  if (b[c] == b[c + 1]) {
    atomic_min(a, c);
  }
}
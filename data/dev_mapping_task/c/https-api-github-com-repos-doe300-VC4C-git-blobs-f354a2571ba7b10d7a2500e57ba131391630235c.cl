__kernel void A(const uint a, __global uint* b, __global short* c) {
  uint d = a;
  for (uint e = 0; e < a - 1; e++) {
    if (((c[e + 1]) < (c[e]))) {
      d = e;
      break;
    }
  }
  *b = d;
}

__kernel void B(__local short* a, uint b, __global short* c) {
  for (uint d = 0; d < b; d++) {
    a[d] = c[d];
  }
  for (uint d = 1; d < b; d++) {
    const short e = a[d];
    uint f = d;
    while (f > 0 && ((e) < (a[f - 1]))) {
      a[f] = a[f - 1];
      f--;
    }
    a[f] = e;
  }
  for (uint d = 0; d < b; d++) {
    c[d] = a[d];
  }
}
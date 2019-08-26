__kernel void A(__global uint3* a, __global uint4* b, unsigned int c) {
  unsigned int d = get_global_id(0);

  if (d <= c / 2 - 1) {
    b[d].hi = a[d * 2 + 1].xy;
    b[d].lo = a[d * 2].xy;
  }

  else if (c % 2 && d == (c + 1) / 2 - 1) {
    b[d].hi = a[d * 2 - 1].xy;
    b[d].lo = a[d * 2].xy;
  }
}
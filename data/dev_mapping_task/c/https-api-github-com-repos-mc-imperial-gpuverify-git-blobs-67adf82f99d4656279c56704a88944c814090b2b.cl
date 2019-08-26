__kernel void A(__global uint* a, __global uint* b, int c) {
  __global uint* d = c > 0 ? a : b;

  __local uint e[256];

  for (uint c = 0; c < 256; c += 1) {
    d[c] += e[c];
  }
}
__kernel void A(__global uchar* a, const uint b, __global const uchar* c, const uint d) {
  for (unsigned int e = 0; e < 16; e++) {
    a[b * 16 + e] = a[b * 16 + e] ^ c[d * 16 + e];
  }
}
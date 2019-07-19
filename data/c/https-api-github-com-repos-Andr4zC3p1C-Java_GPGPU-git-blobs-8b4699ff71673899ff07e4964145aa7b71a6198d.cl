__kernel void A(__global long* a, __global int* b) {
  unsigned long c, d, e, f;
  c = a[b[0]];
  e = a[(b[0] + 13) & 15];
  d = c ^ e ^ (c << 16) ^ (e << 15);
  e = a[(b[0] + 9) & 15];
  e ^= (e >> 11);
  c = a[b[0]] = d ^ e;
  f = c ^ ((c << 5) & 0xDA442D24UL);
  b[0] = (b[0] + 15) & 15;
  c = a[b[0]];
  a[b[0]] = c ^ d ^ f ^ (c << 2) ^ (d << 18) ^ (e << 28);
}
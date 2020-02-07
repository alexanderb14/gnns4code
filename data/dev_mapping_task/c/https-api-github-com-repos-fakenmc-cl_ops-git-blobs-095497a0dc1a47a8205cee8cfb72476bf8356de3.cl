typedef uint4 clo_statetype; uint A(uint a, int b, int c, int d, uint e) {
  uint f = (((a << b) ^ a) >> c);
  return (((a & e) << d) ^ f);
}
uint B(uint a, uint b, uint c) {
  return b * a + c;
}
uint C(__global clo_statetype* a, uint b) {
  clo_statetype c = a[b];

  uint d = c.x;

  c.x = A(c.y, 13, 19, 12, 4294967294U);
  c.y = A(c.z, 2, 25, 4, 4294967288U);
  c.z = A(c.w, 3, 11, 17, 4294967294U);

  c.w = B(d, 1664525, 1013904223U);

  a[b] = c;

  return c.x;
}
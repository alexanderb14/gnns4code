typedef uint4 clo_statetype; uint A(__global clo_statetype* a, uint b) {
  clo_statetype c = a[b];

  uint d = c.x ^ (c.x << 11);
  c.x = c.y;
  c.y = c.z;
  c.z = c.w;
  c.w = c.w ^ (c.w >> 19) ^ (d ^ (d >> 8));

  a[b] = c;

  return c.w;
}
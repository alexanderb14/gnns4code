typedef ulong clo_statetype; uint A(__global clo_statetype* a, uint b) {
  clo_statetype c = a[b];

  c ^= (c << 21);
  c ^= (c >> 35);
  c ^= (c << 4);

  a[b] = c;

  return convert_uint(c);
}
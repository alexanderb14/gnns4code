typedef ulong clo_statetype; uint A(__global clo_statetype* a, uint b) {
  uint c = 32;

  clo_statetype d = a[b];

  d = (d * 0x5DEECE66DL + 0xBL) & ((1L << 48) - 1);

  a[b] = d;

  return (uint)(d >> (48 - c));
}
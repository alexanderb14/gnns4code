typedef uint2 clo_statetype; uint A(__global clo_statetype* a, uint b) {
  enum { A = 4294883355U };

  uint c = a[b].x, d = a[b].y;

  uint e = c ^ d;

  uint f = mul_hi(c, A);
  c = c * A + d;
  d = f + (c < d);

  a[b] = (clo_statetype)(c, d);

  return e;
}
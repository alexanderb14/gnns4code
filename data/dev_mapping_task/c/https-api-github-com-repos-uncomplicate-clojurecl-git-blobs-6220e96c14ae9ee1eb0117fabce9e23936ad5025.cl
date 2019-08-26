__kernel void A(__global int4* a) {
  int4 b = (int4)(1, 2, 3, 4);
  b += 4;
  if (b.s2 == 7)
    b &= (int4)(-1, -1, 0, -1);
  b.s01 = b.s23 < 7;
  while (b.s3 > 7 && (b.s0 < 16 || b.s1 < 16))
    b.s3 >>= 1;

  *a = b;
}
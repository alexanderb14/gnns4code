kernel void A(global int* a, int4 b) {
  a[0] = b.s0;
  a[1] = b.s1;
  a[2] = b.s2;
  a[3] = b.s3;

  a[4] = b.x;
  a[5] = b.y;
  a[6] = b.z;
  a[7] = b.w;
}
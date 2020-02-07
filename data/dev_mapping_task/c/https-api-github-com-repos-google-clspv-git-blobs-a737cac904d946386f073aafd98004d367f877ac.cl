kernel void A(global uchar4* a, int b) {
  *a = (uchar4)(1, 2, (uchar)b, 4);
}
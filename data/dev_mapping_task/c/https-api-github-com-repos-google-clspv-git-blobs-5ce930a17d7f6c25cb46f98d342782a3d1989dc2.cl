kernel void A(global uchar4* a, float b) {
  *a = (uchar4)(1, 2, (uchar)b, 4);
}
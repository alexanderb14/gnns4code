__kernel void A() {
  uchar4 a = (uchar4)(1, 2, 3, 4);
  uchar4 b;
  uchar3 c;
  uchar2 d;

  b = a.yyxx;
  c = a.zyx;
  d = c.zx;
}
__constant int Ga = 1; __constant int Gb = 0; __constant int Gc = 0; __kernel void A(__global int* a) {
  char b = 123;
  uchar c = 123;
  short d = 123;
  ushort e = 123;
  int f = 123;
  uint g = 123;
  long h = 123;
  ulong i = 123;

  float j = 123.0;

  double k = 123.0;

  a[get_global_id(0)] = 1;
}
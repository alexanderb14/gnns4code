__constant int Ga = 1; __constant int Gb = 0; __constant int Gc = 0; __kernel void A(__global int* a) {
  char b = 2;
  char c = 1;
  uchar d = 2;
  uchar e = 1;
  char4 f = (char4)(2, 4, 8, 16);
  char4 g = (char4)(1, 2, 8, 4);
  uchar4 h = (uchar4)(2, 4, 8, 16);
  uchar4 i = (uchar4)(1, 2, 8, 4);

  short j = 2;
  short k = 1;
  ushort l = 2;
  ushort m = 1;
  short4 n = (short4)(2, 4, 8, 16);
  short4 o = (short4)(1, 2, 8, 4);
  ushort4 p = (ushort4)(2, 4, 8, 16);
  ushort4 q = (ushort4)(1, 2, 8, 4);

  int r = 2;
  int s = 1;
  uint t = 2;
  uint u = 1;
  int4 v = (int4)(2, 4, 8, 16);
  int4 w = (int4)(1, 2, 8, 4);
  uint4 x = (uint4)(2, 4, 8, 16);
  uint4 y = (uint4)(1, 2, 8, 4);

  long z = 2;
  long aa = 1;
  ulong ab = 2;
  ulong ac = 1;
  long4 ad = (long4)(2, 4, 8, 16);
  long4 ae = (long4)(1, 2, 8, 4);
  ulong4 af = (ulong4)(2, 4, 8, 16);
  ulong4 ag = (ulong4)(1, 2, 8, 4);
  float ah = 2;
  float ai = 1;
  float4 aj = (float4)(2, 4, 8, 16);
  float4 ak = (float4)(1, 2, 8, 4);

  double al = 2;
  double am = 1;
  double4 an = (double4)(2, 4, 8, 16);
  double4 ao = (double4)(1, 2, 8, 4);

  uint4 ap = (uint4)(2, 4, 8, 16);
  int2 aq = (int2)(1, 2);
  long2 ar = (long2)(1, 2);

  float2 as = (float2)(1, 2);

  double2 at = (double2)(1, 2);

  a[get_global_id(0)] = 1;
}
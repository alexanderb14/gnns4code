__constant int Ga = 1; __constant int Gb = 0; __constant int Gc = 0; __kernel void A(__global int* a) {
  bool b = 0;

  char c = 1;
  char2 d = (char2)(1, 2);

  char3 e = (char3)(1, 2, 3);

  char4 f = (char4)(1, 2, 3, 4);
  char8 g = (char8)(1, 2, 3, 4, 5, 6, 7, 8);
  char16 h = (char16)(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);

  uchar i = 1;
  uchar2 j = (uchar2)(1, 2);

  uchar3 k = (uchar3)(1, 2, 3);

  uchar4 l = (uchar4)(1, 2, 3, 4);
  uchar8 m = (uchar8)(1, 2, 3, 4, 5, 6, 7, 8);
  uchar16 n = (uchar16)(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);

  short o = -1;
  short2 p = (short2)(-1, -2);

  short3 q = (short3)(-1, -2, -3);

  short4 r = (short4)(-1, -2, -3, -4);
  short8 s = (short8)(-1, -2, -3, -4, -5, -6, -7, -8);
  short16 t = (short16)(-1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14, -15, -16);

  ushort u = 1;
  ushort2 v = (ushort2)(1, 2);

  ushort3 w = (ushort3)(1, 2, 3);

  ushort4 x = (ushort4)(1, 2, 3, 4);
  ushort8 y = (ushort8)(1, 2, 3, 4, 5, 6, 7, 8);
  ushort16 z = (ushort16)(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);

  int aa = -1;
  int2 ab = (int2)(-1, -2);

  int3 ac = (int3)(-1, -2, -3);

  int4 ad = (int4)(-1, -2, -3, -4);
  int8 ae = (int8)(-1, -2, -3, -4, -5, -6, -7, -8);
  int16 af = (int16)(-1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14, -15, -16);

  uint ag = 1;
  uint2 ah = (uint2)(1, 2);

  uint3 ai = (uint3)(1, 2, 3);

  uint4 aj = (uint4)(1, 2, 3, 4);
  uint8 ak = (uint8)(1, 2, 3, 4, 5, 6, 7, 8);
  uint16 al = (uint16)(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);

  long am = -1;
  long2 an = (long2)(-1, -2);

  long3 ao = (long3)(-1, -2, -3);

  long4 ap = (long4)(-1, -2, -3, -4);
  long8 aq = (long8)(-1, -2, -3, -4, -5, -6, -7, -8);
  long16 ar = (long16)(-1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14, -15, -16);

  ulong as = 1;
  ulong2 at = (ulong2)(1, 2);

  ulong3 au = (ulong3)(1, 2, 3);

  ulong4 av = (ulong4)(1, 2, 3, 4);
  ulong8 aw = (ulong8)(1, 2, 3, 4, 5, 6, 7, 8);
  ulong16 ax = (ulong16)(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);

  half* ay;
  float az = 1.0;
  float2 ba = (float2)(1.0, 2.0);

  float3 bb = (float3)(1.0, 2.0, 3.0);

  float4 bc = (float4)(1.0, 2.0, 3.0, 4.0);
  float8 bd = (float8)(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0);
  float16 be = (float16)(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0);

  double bf = 1.0;
  double2 bg = (double2)(1.0, 2.0);

  double3 bh = (double3)(1.0, 2.0, 3.0);

  double4 bi = (double4)(1.0, 2.0, 3.0, 4.0);
  double8 bj = (double8)(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0);
  double16 bk = (double16)(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0);

  a[get_global_id(0)] = 1;
}
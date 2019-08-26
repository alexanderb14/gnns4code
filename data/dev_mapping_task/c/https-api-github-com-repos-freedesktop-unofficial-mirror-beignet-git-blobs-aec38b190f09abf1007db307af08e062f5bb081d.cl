__kernel void A(__global char* a, __global char* b) {
  int c = get_global_id(0);
  char2 d;
  d = vload2(c, a);
  d += (char2){(char)1, (char)2};
  vstore2(d, c, b);
}
__kernel void B(__global uchar* a, __global uchar* b) {
  int c = get_global_id(0);
  uchar2 d;
  d = vload2(c, a);
  d += (uchar2){(uchar)1, (uchar)2};
  vstore2(d, c, b);
}
__kernel void C(__global short* a, __global short* b) {
  int c = get_global_id(0);
  short2 d;
  d = vload2(c, a);
  d += (short2){(short)1, (short)2};
  vstore2(d, c, b);
}
__kernel void D(__global ushort* a, __global ushort* b) {
  int c = get_global_id(0);
  ushort2 d;
  d = vload2(c, a);
  d += (ushort2){(ushort)1, (ushort)2};
  vstore2(d, c, b);
}
__kernel void E(__global int* a, __global int* b) {
  int c = get_global_id(0);
  int2 d;
  d = vload2(c, a);
  d += (int2){(int)1, (int)2};
  vstore2(d, c, b);
}
__kernel void F(__global uint* a, __global uint* b) {
  int c = get_global_id(0);
  uint2 d;
  d = vload2(c, a);
  d += (uint2){(uint)1, (uint)2};
  vstore2(d, c, b);
}
__kernel void G(__global float* a, __global float* b) {
  int c = get_global_id(0);
  float2 d;
  d = vload2(c, a);
  d += (float2){(float)1, (float)2};
  vstore2(d, c, b);
}
__kernel void H(__global long* a, __global long* b) {
  int c = get_global_id(0);
  long2 d;
  d = vload2(c, a);
  d += (long2){(long)1, (long)2};
  vstore2(d, c, b);
}
__kernel void I(__global ulong* a, __global ulong* b) {
  int c = get_global_id(0);
  ulong2 d;
  d = vload2(c, a);
  d += (ulong2){(ulong)1, (ulong)2};
  vstore2(d, c, b);
}
__kernel void J(__global char* a, __global char* b) {
  int c = get_global_id(0);
  char3 d;
  d = vload3(c, a);
  d += (char3){(char)1, (char)2, (char)3};
  vstore3(d, c, b);
}
__kernel void K(__global uchar* a, __global uchar* b) {
  int c = get_global_id(0);
  uchar3 d;
  d = vload3(c, a);
  d += (uchar3){(uchar)1, (uchar)2, (uchar)3};
  vstore3(d, c, b);
}
__kernel void L(__global short* a, __global short* b) {
  int c = get_global_id(0);
  short3 d;
  d = vload3(c, a);
  d += (short3){(short)1, (short)2, (short)3};
  vstore3(d, c, b);
}
__kernel void M(__global ushort* a, __global ushort* b) {
  int c = get_global_id(0);
  ushort3 d;
  d = vload3(c, a);
  d += (ushort3){(ushort)1, (ushort)2, (ushort)3};
  vstore3(d, c, b);
}
__kernel void N(__global int* a, __global int* b) {
  int c = get_global_id(0);
  int3 d;
  d = vload3(c, a);
  d += (int3){(int)1, (int)2, (int)3};
  vstore3(d, c, b);
}
__kernel void O(__global uint* a, __global uint* b) {
  int c = get_global_id(0);
  uint3 d;
  d = vload3(c, a);
  d += (uint3){(uint)1, (uint)2, (uint)3};
  vstore3(d, c, b);
}
__kernel void P(__global float* a, __global float* b) {
  int c = get_global_id(0);
  float3 d;
  d = vload3(c, a);
  d += (float3){(float)1, (float)2, (float)3};
  vstore3(d, c, b);
}
__kernel void Q(__global long* a, __global long* b) {
  int c = get_global_id(0);
  long3 d;
  d = vload3(c, a);
  d += (long3){(long)1, (long)2, (long)3};
  vstore3(d, c, b);
}
__kernel void R(__global ulong* a, __global ulong* b) {
  int c = get_global_id(0);
  ulong3 d;
  d = vload3(c, a);
  d += (ulong3){(ulong)1, (ulong)2, (ulong)3};
  vstore3(d, c, b);
}
__kernel void S(__global char* a, __global char* b) {
  int c = get_global_id(0);
  char4 d;
  d = vload4(c, a);
  d += (char4){(char)1, (char)2, (char)3, (char)4};
  vstore4(d, c, b);
}
__kernel void T(__global uchar* a, __global uchar* b) {
  int c = get_global_id(0);
  uchar4 d;
  d = vload4(c, a);
  d += (uchar4){(uchar)1, (uchar)2, (uchar)3, (uchar)4};
  vstore4(d, c, b);
}
__kernel void U(__global short* a, __global short* b) {
  int c = get_global_id(0);
  short4 d;
  d = vload4(c, a);
  d += (short4){(short)1, (short)2, (short)3, (short)4};
  vstore4(d, c, b);
}
__kernel void V(__global ushort* a, __global ushort* b) {
  int c = get_global_id(0);
  ushort4 d;
  d = vload4(c, a);
  d += (ushort4){(ushort)1, (ushort)2, (ushort)3, (ushort)4};
  vstore4(d, c, b);
}
__kernel void W(__global int* a, __global int* b) {
  int c = get_global_id(0);
  int4 d;
  d = vload4(c, a);
  d += (int4){(int)1, (int)2, (int)3, (int)4};
  vstore4(d, c, b);
}
__kernel void X(__global uint* a, __global uint* b) {
  int c = get_global_id(0);
  uint4 d;
  d = vload4(c, a);
  d += (uint4){(uint)1, (uint)2, (uint)3, (uint)4};
  vstore4(d, c, b);
}
__kernel void Y(__global float* a, __global float* b) {
  int c = get_global_id(0);
  float4 d;
  d = vload4(c, a);
  d += (float4){(float)1, (float)2, (float)3, (float)4};
  vstore4(d, c, b);
}
__kernel void Z(__global long* a, __global long* b) {
  int c = get_global_id(0);
  long4 d;
  d = vload4(c, a);
  d += (long4){(long)1, (long)2, (long)3, (long)4};
  vstore4(d, c, b);
}
__kernel void AA(__global ulong* a, __global ulong* b) {
  int c = get_global_id(0);
  ulong4 d;
  d = vload4(c, a);
  d += (ulong4){(ulong)1, (ulong)2, (ulong)3, (ulong)4};
  vstore4(d, c, b);
}
__kernel void AB(__global char* a, __global char* b) {
  int c = get_global_id(0);
  char8 d;
  d = vload8(c, a);
  d += (char8){(char)1, (char)2, (char)3, (char)4, (char)5, (char)6, (char)7, (char)8};
  vstore8(d, c, b);
}
__kernel void AC(__global uchar* a, __global uchar* b) {
  int c = get_global_id(0);
  uchar8 d;
  d = vload8(c, a);
  d += (uchar8){(uchar)1, (uchar)2, (uchar)3, (uchar)4, (uchar)5, (uchar)6, (uchar)7, (uchar)8};
  vstore8(d, c, b);
}
__kernel void AD(__global short* a, __global short* b) {
  int c = get_global_id(0);
  short8 d;
  d = vload8(c, a);
  d += (short8){(short)1, (short)2, (short)3, (short)4, (short)5, (short)6, (short)7, (short)8};
  vstore8(d, c, b);
}
__kernel void AE(__global ushort* a, __global ushort* b) {
  int c = get_global_id(0);
  ushort8 d;
  d = vload8(c, a);
  d += (ushort8){(ushort)1, (ushort)2, (ushort)3, (ushort)4, (ushort)5, (ushort)6, (ushort)7, (ushort)8};
  vstore8(d, c, b);
}
__kernel void AF(__global int* a, __global int* b) {
  int c = get_global_id(0);
  int8 d;
  d = vload8(c, a);
  d += (int8){(int)1, (int)2, (int)3, (int)4, (int)5, (int)6, (int)7, (int)8};
  vstore8(d, c, b);
}
__kernel void AG(__global uint* a, __global uint* b) {
  int c = get_global_id(0);
  uint8 d;
  d = vload8(c, a);
  d += (uint8){(uint)1, (uint)2, (uint)3, (uint)4, (uint)5, (uint)6, (uint)7, (uint)8};
  vstore8(d, c, b);
}
__kernel void AH(__global float* a, __global float* b) {
  int c = get_global_id(0);
  float8 d;
  d = vload8(c, a);
  d += (float8){(float)1, (float)2, (float)3, (float)4, (float)5, (float)6, (float)7, (float)8};
  vstore8(d, c, b);
}
__kernel void AI(__global long* a, __global long* b) {
  int c = get_global_id(0);
  long8 d;
  d = vload8(c, a);
  d += (long8){(long)1, (long)2, (long)3, (long)4, (long)5, (long)6, (long)7, (long)8};
  vstore8(d, c, b);
}
__kernel void AJ(__global ulong* a, __global ulong* b) {
  int c = get_global_id(0);
  ulong8 d;
  d = vload8(c, a);
  d += (ulong8){(ulong)1, (ulong)2, (ulong)3, (ulong)4, (ulong)5, (ulong)6, (ulong)7, (ulong)8};
  vstore8(d, c, b);
}
__kernel void AK(__global char* a, __global char* b) {
  int c = get_global_id(0);
  char16 d;
  d = vload16(c, a);
  d += (char16){(char)1, (char)2, (char)3, (char)4, (char)5, (char)6, (char)7, (char)8, (char)9, (char)10, (char)11, (char)12, (char)13, (char)14, (char)15, (char)16};
  vstore16(d, c, b);
}
__kernel void AL(__global uchar* a, __global uchar* b) {
  int c = get_global_id(0);
  uchar16 d;
  d = vload16(c, a);
  d += (uchar16){(uchar)1, (uchar)2, (uchar)3, (uchar)4, (uchar)5, (uchar)6, (uchar)7, (uchar)8, (uchar)9, (uchar)10, (uchar)11, (uchar)12, (uchar)13, (uchar)14, (uchar)15, (uchar)16};
  vstore16(d, c, b);
}
__kernel void AM(__global short* a, __global short* b) {
  int c = get_global_id(0);
  short16 d;
  d = vload16(c, a);
  d += (short16){(short)1, (short)2, (short)3, (short)4, (short)5, (short)6, (short)7, (short)8, (short)9, (short)10, (short)11, (short)12, (short)13, (short)14, (short)15, (short)16};
  vstore16(d, c, b);
}
__kernel void AN(__global ushort* a, __global ushort* b) {
  int c = get_global_id(0);
  ushort16 d;
  d = vload16(c, a);
  d += (ushort16){(ushort)1, (ushort)2, (ushort)3, (ushort)4, (ushort)5, (ushort)6, (ushort)7, (ushort)8, (ushort)9, (ushort)10, (ushort)11, (ushort)12, (ushort)13, (ushort)14, (ushort)15, (ushort)16};
  vstore16(d, c, b);
}
__kernel void AO(__global int* a, __global int* b) {
  int c = get_global_id(0);
  int16 d;
  d = vload16(c, a);
  d += (int16){(int)1, (int)2, (int)3, (int)4, (int)5, (int)6, (int)7, (int)8, (int)9, (int)10, (int)11, (int)12, (int)13, (int)14, (int)15, (int)16};
  vstore16(d, c, b);
}
__kernel void AP(__global uint* a, __global uint* b) {
  int c = get_global_id(0);
  uint16 d;
  d = vload16(c, a);
  d += (uint16){(uint)1, (uint)2, (uint)3, (uint)4, (uint)5, (uint)6, (uint)7, (uint)8, (uint)9, (uint)10, (uint)11, (uint)12, (uint)13, (uint)14, (uint)15, (uint)16};
  vstore16(d, c, b);
}
__kernel void AQ(__global float* a, __global float* b) {
  int c = get_global_id(0);
  float16 d;
  d = vload16(c, a);
  d += (float16){(float)1, (float)2, (float)3, (float)4, (float)5, (float)6, (float)7, (float)8, (float)9, (float)10, (float)11, (float)12, (float)13, (float)14, (float)15, (float)16};
  vstore16(d, c, b);
}
__kernel void AR(__global long* a, __global long* b) {
  int c = get_global_id(0);
  long16 d;
  d = vload16(c, a);
  d += (long16){(long)1, (long)2, (long)3, (long)4, (long)5, (long)6, (long)7, (long)8, (long)9, (long)10, (long)11, (long)12, (long)13, (long)14, (long)15, (long)16};
  vstore16(d, c, b);
}
__kernel void AS(__global ulong* a, __global ulong* b) {
  int c = get_global_id(0);
  ulong16 d;
  d = vload16(c, a);
  d += (ulong16){(ulong)1, (ulong)2, (ulong)3, (ulong)4, (ulong)5, (ulong)6, (ulong)7, (ulong)8, (ulong)9, (ulong)10, (ulong)11, (ulong)12, (ulong)13, (ulong)14, (ulong)15, (ulong)16};
  vstore16(d, c, b);
}
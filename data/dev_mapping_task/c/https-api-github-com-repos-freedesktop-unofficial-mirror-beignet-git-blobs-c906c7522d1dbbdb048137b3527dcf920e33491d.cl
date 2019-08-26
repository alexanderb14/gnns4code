__kernel void A(__global uchar* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint2 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint2(vload2(d + (f & 0xFFFF), a + c));
  }
  vstore2(e, d, b);
}
__kernel void B(__global uchar* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint3 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint3(vload3(d + (f & 0xFFFF), a + c));
  }
  vstore3(e, d, b);
}
__kernel void C(__global uchar* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint4 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint4(vload4(d + (f & 0xFFFF), a + c));
  }
  vstore4(e, d, b);
}
__kernel void D(__global uchar* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint8 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint8(vload8(d + (f & 0xFFFF), a + c));
  }
  vstore8(e, d, b);
}
__kernel void E(__global uchar* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint16 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint16(vload16(d + (f & 0xFFFF), a + c));
  }
  vstore16(e, d, b);
}
__kernel void F(__global char* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint2 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint2(vload2(d + (f & 0xFFFF), a + c));
  }
  vstore2(e, d, b);
}
__kernel void G(__global char* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint3 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint3(vload3(d + (f & 0xFFFF), a + c));
  }
  vstore3(e, d, b);
}
__kernel void H(__global char* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint4 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint4(vload4(d + (f & 0xFFFF), a + c));
  }
  vstore4(e, d, b);
}
__kernel void I(__global char* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint8 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint8(vload8(d + (f & 0xFFFF), a + c));
  }
  vstore8(e, d, b);
}
__kernel void J(__global char* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint16 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint16(vload16(d + (f & 0xFFFF), a + c));
  }
  vstore16(e, d, b);
}
__kernel void K(__global ushort* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint2 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint2(vload2(d + (f & 0xFFFF), a + c));
  }
  vstore2(e, d, b);
}
__kernel void L(__global ushort* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint3 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint3(vload3(d + (f & 0xFFFF), a + c));
  }
  vstore3(e, d, b);
}
__kernel void M(__global ushort* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint4 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint4(vload4(d + (f & 0xFFFF), a + c));
  }
  vstore4(e, d, b);
}
__kernel void N(__global ushort* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint8 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint8(vload8(d + (f & 0xFFFF), a + c));
  }
  vstore8(e, d, b);
}
__kernel void O(__global ushort* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint16 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint16(vload16(d + (f & 0xFFFF), a + c));
  }
  vstore16(e, d, b);
}
__kernel void P(__global short* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint2 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint2(vload2(d + (f & 0xFFFF), a + c));
  }
  vstore2(e, d, b);
}
__kernel void Q(__global short* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint3 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint3(vload3(d + (f & 0xFFFF), a + c));
  }
  vstore3(e, d, b);
}
__kernel void R(__global short* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint4 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint4(vload4(d + (f & 0xFFFF), a + c));
  }
  vstore4(e, d, b);
}
__kernel void S(__global short* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint8 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint8(vload8(d + (f & 0xFFFF), a + c));
  }
  vstore8(e, d, b);
}
__kernel void T(__global short* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint16 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint16(vload16(d + (f & 0xFFFF), a + c));
  }
  vstore16(e, d, b);
}
__kernel void U(__global uint* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint2 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint2(vload2(d + (f & 0xFFFF), a + c));
  }
  vstore2(e, d, b);
}
__kernel void V(__global uint* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint3 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint3(vload3(d + (f & 0xFFFF), a + c));
  }
  vstore3(e, d, b);
}
__kernel void W(__global uint* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint4 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint4(vload4(d + (f & 0xFFFF), a + c));
  }
  vstore4(e, d, b);
}
__kernel void X(__global uint* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint8 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint8(vload8(d + (f & 0xFFFF), a + c));
  }
  vstore8(e, d, b);
}
__kernel void Y(__global uint* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint16 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint16(vload16(d + (f & 0xFFFF), a + c));
  }
  vstore16(e, d, b);
}
__kernel void Z(__global int* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint2 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint2(vload2(d + (f & 0xFFFF), a + c));
  }
  vstore2(e, d, b);
}
__kernel void AA(__global int* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint3 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint3(vload3(d + (f & 0xFFFF), a + c));
  }
  vstore3(e, d, b);
}
__kernel void AB(__global int* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint4 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint4(vload4(d + (f & 0xFFFF), a + c));
  }
  vstore4(e, d, b);
}
__kernel void AC(__global int* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint8 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint8(vload8(d + (f & 0xFFFF), a + c));
  }
  vstore8(e, d, b);
}
__kernel void AD(__global int* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint16 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint16(vload16(d + (f & 0xFFFF), a + c));
  }
  vstore16(e, d, b);
}
__kernel void AE(__global float* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint2 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint2(vload2(d + (f & 0xFFFF), a + c));
  }
  vstore2(e, d, b);
}
__kernel void AF(__global float* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint3 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint3(vload3(d + (f & 0xFFFF), a + c));
  }
  vstore3(e, d, b);
}
__kernel void AG(__global float* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint4 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint4(vload4(d + (f & 0xFFFF), a + c));
  }
  vstore4(e, d, b);
}
__kernel void AH(__global float* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint8 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint8(vload8(d + (f & 0xFFFF), a + c));
  }
  vstore8(e, d, b);
}
__kernel void AI(__global float* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint16 e = 0;
  for (int f = 0; f < 1; f++) {
    e += convert_uint16(vload16(d + (f & 0xFFFF), a + c));
  }
  vstore16(e, d, b);
}
__kernel void AJ(__global uchar* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint2 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint2(vload2(d + (f & 0xFFFF), a + c));
  }
  vstore2(e, d, b);
}
__kernel void AK(__global uchar* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint3 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint3(vload3(d + (f & 0xFFFF), a + c));
  }
  vstore3(e, d, b);
}
__kernel void AL(__global uchar* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint4 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint4(vload4(d + (f & 0xFFFF), a + c));
  }
  vstore4(e, d, b);
}
__kernel void AM(__global uchar* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint8 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint8(vload8(d + (f & 0xFFFF), a + c));
  }
  vstore8(e, d, b);
}
__kernel void AN(__global uchar* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint16 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint16(vload16(d + (f & 0xFFFF), a + c));
  }
  vstore16(e, d, b);
}
__kernel void AO(__global char* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint2 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint2(vload2(d + (f & 0xFFFF), a + c));
  }
  vstore2(e, d, b);
}
__kernel void AP(__global char* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint3 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint3(vload3(d + (f & 0xFFFF), a + c));
  }
  vstore3(e, d, b);
}
__kernel void AQ(__global char* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint4 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint4(vload4(d + (f & 0xFFFF), a + c));
  }
  vstore4(e, d, b);
}
__kernel void AR(__global char* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint8 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint8(vload8(d + (f & 0xFFFF), a + c));
  }
  vstore8(e, d, b);
}
__kernel void AS(__global char* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint16 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint16(vload16(d + (f & 0xFFFF), a + c));
  }
  vstore16(e, d, b);
}
__kernel void AT(__global ushort* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint2 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint2(vload2(d + (f & 0xFFFF), a + c));
  }
  vstore2(e, d, b);
}
__kernel void AU(__global ushort* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint3 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint3(vload3(d + (f & 0xFFFF), a + c));
  }
  vstore3(e, d, b);
}
__kernel void AV(__global ushort* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint4 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint4(vload4(d + (f & 0xFFFF), a + c));
  }
  vstore4(e, d, b);
}
__kernel void AW(__global ushort* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint8 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint8(vload8(d + (f & 0xFFFF), a + c));
  }
  vstore8(e, d, b);
}
__kernel void AX(__global ushort* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint16 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint16(vload16(d + (f & 0xFFFF), a + c));
  }
  vstore16(e, d, b);
}
__kernel void AY(__global short* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint2 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint2(vload2(d + (f & 0xFFFF), a + c));
  }
  vstore2(e, d, b);
}
__kernel void AZ(__global short* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint3 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint3(vload3(d + (f & 0xFFFF), a + c));
  }
  vstore3(e, d, b);
}
__kernel void BA(__global short* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint4 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint4(vload4(d + (f & 0xFFFF), a + c));
  }
  vstore4(e, d, b);
}
__kernel void BB(__global short* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint8 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint8(vload8(d + (f & 0xFFFF), a + c));
  }
  vstore8(e, d, b);
}
__kernel void BC(__global short* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint16 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint16(vload16(d + (f & 0xFFFF), a + c));
  }
  vstore16(e, d, b);
}
__kernel void BD(__global uint* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint2 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint2(vload2(d + (f & 0xFFFF), a + c));
  }
  vstore2(e, d, b);
}
__kernel void BE(__global uint* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint3 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint3(vload3(d + (f & 0xFFFF), a + c));
  }
  vstore3(e, d, b);
}
__kernel void BF(__global uint* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint4 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint4(vload4(d + (f & 0xFFFF), a + c));
  }
  vstore4(e, d, b);
}
__kernel void BG(__global uint* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint8 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint8(vload8(d + (f & 0xFFFF), a + c));
  }
  vstore8(e, d, b);
}
__kernel void BH(__global uint* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint16 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint16(vload16(d + (f & 0xFFFF), a + c));
  }
  vstore16(e, d, b);
}
__kernel void BI(__global int* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint2 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint2(vload2(d + (f & 0xFFFF), a + c));
  }
  vstore2(e, d, b);
}
__kernel void BJ(__global int* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint3 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint3(vload3(d + (f & 0xFFFF), a + c));
  }
  vstore3(e, d, b);
}
__kernel void BK(__global int* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint4 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint4(vload4(d + (f & 0xFFFF), a + c));
  }
  vstore4(e, d, b);
}
__kernel void BL(__global int* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint8 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint8(vload8(d + (f & 0xFFFF), a + c));
  }
  vstore8(e, d, b);
}
__kernel void BM(__global int* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint16 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint16(vload16(d + (f & 0xFFFF), a + c));
  }
  vstore16(e, d, b);
}
__kernel void BN(__global float* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint2 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint2(vload2(d + (f & 0xFFFF), a + c));
  }
  vstore2(e, d, b);
}
__kernel void BO(__global float* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint3 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint3(vload3(d + (f & 0xFFFF), a + c));
  }
  vstore3(e, d, b);
}
__kernel void BP(__global float* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint4 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint4(vload4(d + (f & 0xFFFF), a + c));
  }
  vstore4(e, d, b);
}
__kernel void BQ(__global float* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint8 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint8(vload8(d + (f & 0xFFFF), a + c));
  }
  vstore8(e, d, b);
}
__kernel void BR(__global float* a, __global uint* b, uint c) {
  int d = (int)get_global_id(0);
  uint16 e = 0;
  for (int f = 0; f < 10000; f++) {
    e += convert_uint16(vload16(d + (f & 0xFFFF), a + c));
  }
  vstore16(e, d, b);
}
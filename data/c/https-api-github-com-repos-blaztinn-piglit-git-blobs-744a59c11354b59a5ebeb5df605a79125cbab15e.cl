kernel void A(global int* a) {
  int b = 0;

  a[b++] = sizeof(char);
  a[b++] = sizeof(uchar);
  a[b++] = sizeof(short);
  a[b++] = sizeof(ushort);
  a[b++] = sizeof(int);
  a[b++] = sizeof(uint);
  a[b++] = sizeof(long);
  a[b++] = sizeof(ulong);
  a[b++] = sizeof(float);

  a[b++] = sizeof(char2);
  a[b++] = sizeof(uchar2);
  a[b++] = sizeof(short2);
  a[b++] = sizeof(ushort2);
  a[b++] = sizeof(int2);
  a[b++] = sizeof(uint2);
  a[b++] = sizeof(long2);
  a[b++] = sizeof(ulong2);
  a[b++] = sizeof(float2);
  a[b++] = 4;
  a[b++] = 4;
  a[b++] = 8;
  a[b++] = 8;
  a[b++] = 16;
  a[b++] = 16;
  a[b++] = 32;
  a[b++] = 32;
  a[b++] = 16;

  a[b++] = sizeof(char4);
  a[b++] = sizeof(uchar4);
  a[b++] = sizeof(short4);
  a[b++] = sizeof(ushort4);
  a[b++] = sizeof(int4);
  a[b++] = sizeof(uint4);
  a[b++] = sizeof(long4);
  a[b++] = sizeof(ulong4);
  a[b++] = sizeof(float4);

  a[b++] = sizeof(char8);
  a[b++] = sizeof(uchar8);
  a[b++] = sizeof(short8);
  a[b++] = sizeof(ushort8);
  a[b++] = sizeof(int8);
  a[b++] = sizeof(uint8);
  a[b++] = sizeof(long8);
  a[b++] = sizeof(ulong8);
  a[b++] = sizeof(float8);

  a[b++] = sizeof(char16);
  a[b++] = sizeof(uchar16);
  a[b++] = sizeof(short16);
  a[b++] = sizeof(ushort16);
  a[b++] = sizeof(int16);
  a[b++] = sizeof(uint16);
  a[b++] = sizeof(long16);
  a[b++] = sizeof(ulong16);
  a[b++] = sizeof(float16);

  a[b++] = sizeof(half);
  a[b++] = 8;
  a[b++] = 16;
  a[b++] = 32;
  a[b++] = 32;
  a[b++] = 64;
  a[b++] = 128;
}
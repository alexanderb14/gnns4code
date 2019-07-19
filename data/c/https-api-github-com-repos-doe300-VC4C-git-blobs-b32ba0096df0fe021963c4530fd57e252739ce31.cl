__kernel void A(__global char2* a, __global uint* b, __global char2* c, uint d) {
  __private char2 e[128];
  int f = get_global_id(0);
  e[f] = (char2)(char)0;

  vstore2(a[f], b[f], ((__private char*)e) + d);

  uint g;
  __private char* h = (__private char*)(e + b[f]) + d;
  __global char* i = (__global char*)(c + b[f]) + d;
  for (g = 0; g < sizeof(e[0]) / sizeof(*h); g++)
    i[g] = h[g];
}

__kernel void B(__global uchar2* a, __global uint* b, __global uchar2* c, uint d) {
  __private uchar2 e[128];
  int f = get_global_id(0);
  e[f] = (uchar2)(uchar)0;

  vstore2(a[f], b[f], ((__private uchar*)e) + d);

  uint g;
  __private uchar* h = (__private uchar*)(e + b[f]) + d;
  __global uchar* i = (__global uchar*)(c + b[f]) + d;
  for (g = 0; g < sizeof(e[0]) / sizeof(*h); g++)
    i[g] = h[g];
}

__kernel void C(__global int2* a, __global uint* b, __global int2* c, uint d) {
  __private int2 e[32];
  int f = get_global_id(0);
  e[f] = (int2)(int)0;

  vstore2(a[f], b[f], ((__private int*)e) + d);

  uint g;
  __private int* h = (__private int*)(e + b[f]) + d;
  __global int* i = (__global int*)(c + b[f]) + d;
  for (g = 0; g < sizeof(e[0]) / sizeof(*h); g++)
    i[g] = h[g];
}

__kernel void D(__global uint2* a, __global uint* b, __global uint2* c, uint d) {
  __private uint2 e[32];
  int f = get_global_id(0);
  e[f] = (uint2)(uint)0;

  vstore2(a[f], b[f], ((__private uint*)e) + d);

  uint g;
  __private uint* h = (__private uint*)(e + b[f]) + d;
  __global uint* i = (__global uint*)(c + b[f]) + d;
  for (g = 0; g < sizeof(e[0]) / sizeof(*h); g++)
    i[g] = h[g];
}

__kernel void E(__global float2* a, __global uint* b, __global float2* c, uint d) {
  __private float2 e[32];
  int f = get_global_id(0);
  e[f] = (float2)(float)0;

  vstore2(a[f], b[f], ((__private float*)e) + d);

  uint g;
  __private float* h = (__private float*)(e + b[f]) + d;
  __global float* i = (__global float*)(c + b[f]) + d;
  for (g = 0; g < sizeof(e[0]) / sizeof(*h); g++)
    i[g] = h[g];
}
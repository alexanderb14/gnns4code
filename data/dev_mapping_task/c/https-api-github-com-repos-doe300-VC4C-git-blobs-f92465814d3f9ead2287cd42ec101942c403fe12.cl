__kernel void A(__global char2* a, __global uint* b, __global uint* c, __global char2* d) {
  __private char2 e[128];
  int f = get_global_id(0);

  for (int g = 0; g < 128; g++)
    e[g] = a[g];

  char2 h = vload2(b[f], ((__private char*)e) + c[f]);
  d[f] = h;
}

__kernel void B(__global uchar2* a, __global uint* b, __global uint* c, __global uchar2* d) {
  __private uchar2 e[128];
  int f = get_global_id(0);

  for (int g = 0; g < 128; g++)
    e[g] = a[g];

  uchar2 h = vload2(b[f], ((__private uchar*)e) + c[f]);
  d[f] = h;
}

__kernel void C(__global short2* a, __global uint* b, __global uint* c, __global short2* d) {
  __private short2 e[64];
  int f = get_global_id(0);

  for (int g = 0; g < 64; g++)
    e[g] = a[g];

  short2 h = vload2(b[f], ((__private short*)e) + c[f]);
  d[f] = h;
}

__kernel void D(__global ushort2* a, __global uint* b, __global uint* c, __global ushort2* d) {
  __private ushort2 e[64];
  int f = get_global_id(0);

  for (int g = 0; g < 64; g++)
    e[g] = a[g];

  ushort2 h = vload2(b[f], ((__private ushort*)e) + c[f]);
  d[f] = h;
}

__kernel void E(__global int2* a, __global uint* b, __global uint* c, __global int2* d) {
  __private int2 e[32];
  int f = get_global_id(0);

  for (int g = 0; g < 32; g++)
    e[g] = a[g];

  int2 h = vload2(b[f], ((__private int*)e) + c[f]);
  d[f] = h;
}

__kernel void F(__global uint2* a, __global uint* b, __global uint* c, __global uint2* d) {
  __private uint2 e[32];
  int f = get_global_id(0);

  for (int g = 0; g < 32; g++)
    e[g] = a[g];

  uint2 h = vload2(b[f], ((__private uint*)e) + c[f]);
  d[f] = h;
}

__kernel void G(__global float2* a, __global uint* b, __global uint* c, __global float2* d) {
  __private float2 e[32];
  int f = get_global_id(0);

  for (int g = 0; g < 32; g++)
    e[g] = a[g];

  float2 h = vload2(b[f], ((__private float*)e) + c[f]);
  d[f] = h;
}
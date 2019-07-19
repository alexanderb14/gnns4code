__kernel void A(__global char8* a, __global ulong* b) {
  int c = get_global_id(0);
  char8 d = a[c];
  ulong e = __builtin_astype(d, ulong);
  b[c] = e;
}

__kernel void B(__global ulong* a, __global uchar8* b) {
  int c = get_global_id(0);
  ulong d = a[c];
  uchar8 e = __builtin_astype(d, uchar8);
  b[c] = e;
}

__kernel void C(__global int2* a, __global ulong* b) {
  int c = get_global_id(0);
  int2 d = a[c];
  ulong e = __builtin_astype(d, ulong);
  b[c] = e;
}

__kernel void D(__global ulong* a, __global uint2* b) {
  int c = get_global_id(0);
  ulong d = a[c];
  uint2 e = __builtin_astype(d, uint2);
  b[c] = e;
}

__kernel void E(__global short4* a, __global ulong* b) {
  int c = get_global_id(0);
  short4 d = a[c];
  ulong e = __builtin_astype(d, ulong);
  b[c] = e;
}

__kernel void F(__global ulong* a, __global ushort4* b) {
  int c = get_global_id(0);
  ulong d = a[c];
  ushort4 e = __builtin_astype(d, ushort4);
  b[c] = e;
}
typedef unsigned int u32; __kernel void A(__global int* a, __global int* b, int c) {
  int d = get_global_id(0);
  if (d >= c)
    return;
  a[d] = b[d];
}

__kernel void B(__global float4* a, __global float4* b, int c) {
  int d = get_global_id(0);
  if (d >= c)
    return;
  a[d] = b[d];
}

__kernel void C(__global int* a, int b, int c) {
  int d = get_global_id(0);
  if (d >= c)
    return;
  a[d] = b;
}

__kernel void D(__global u32* a, u32 b, int c) {
  int d = get_global_id(0);
  if (d >= c)
    return;
  a[d] = b;
}

__kernel void E(__global float4* a, float4 b, int c) {
  int d = get_global_id(0);
  if (d >= c)
    return;
  a[d] = b;
}
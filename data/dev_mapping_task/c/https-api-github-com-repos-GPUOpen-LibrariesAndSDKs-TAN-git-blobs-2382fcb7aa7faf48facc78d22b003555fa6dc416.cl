__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void A(__global float* a, __local float* b, __global float* c, ulong d, ulong e) {
  int f = get_global_id(0);
  int g = get_group_id(0);

  if (f > e)
    return;
  int h = get_local_id(0);
  int i = get_local_size(0) >> 1;

  c += d;

  __global float4* j = (__global float4*)a;
  __local float4* k = (__local float4*)b;
  __global float2* l = (__global float2*)c;

  k[h] = j[f];
  barrier(1);

  while (i > 0) {
    barrier(1);
    if (h < i)
      k[h] += k[h + i];
    i = i >> 1;
  }
  barrier(1);
  if (h == 0) {
    l[g].xy = k[0].xy + k[0].zw;
  }
}
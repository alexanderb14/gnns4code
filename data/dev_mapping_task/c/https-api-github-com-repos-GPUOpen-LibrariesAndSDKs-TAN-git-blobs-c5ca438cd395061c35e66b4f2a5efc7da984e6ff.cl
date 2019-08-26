__kernel __attribute__((reqd_work_group_size(64, 1, 1))) void A(__global float* a, ulong b, __global float* c, ulong d, __global float* e, ulong f, int g) {
  int h = get_global_id(0);
  if (h > g)
    return;

  a += b;
  c += d;
  e += f;

  __global float4* i = (__global float4*)a;
  __global float4* j = (__global float4*)c;
  __global float4* k = (__global float4*)e;

  float4 l = i[h];
  float4 m = j[h];

  k[h].xz = l.xz * m.xz - l.yw * m.yw;
  k[h].yw = l.xz * m.yw + l.yw * m.xz;
}
__kernel void A(__global int* a, __global uint* b, __global uint* c, __global int2* d) {
  int e = get_global_id(0);
  int2 f = vload2(b[e], ((__global int*)a) + c[e]);
  d[e] = f;
}

__kernel void B(__global short3* a, __global int* b) {
  int c = get_global_id(0);
  b[c] = all(vload3(c, (__global short*)a));
}
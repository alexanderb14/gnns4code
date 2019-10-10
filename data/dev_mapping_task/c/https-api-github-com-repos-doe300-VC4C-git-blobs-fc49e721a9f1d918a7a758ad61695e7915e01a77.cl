__kernel void A(__global float* a, __local float* b, __constant float* c, __global float4* d) {
  __private float e[4];
  vstore4(vload4(0, a), 0, e);
  barrier(0);
  d[0] = vload4(0, a);
  d[1] = vload4(0, b);
  d[2] = vload4(0, c);
  d[3] = vload4(0, e);
}
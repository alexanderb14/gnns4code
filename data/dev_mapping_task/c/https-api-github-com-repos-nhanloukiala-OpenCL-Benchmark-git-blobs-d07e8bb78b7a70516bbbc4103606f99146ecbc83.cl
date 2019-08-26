__kernel void A(__global float4* a, __global float4* b) {
  b[0] = __clc_rint(*a);
  b[1] = __clc_round(*a);
  b[2] = __clc_ceil(*a);
  b[3] = __clc_floor(*a);
  b[4] = __clc_trunc(*a);
}
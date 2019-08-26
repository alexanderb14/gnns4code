__kernel void A(__global float4* a) {
  a[get_local_id(0)] = __clc_ceil(a[get_local_id(0)]);
}
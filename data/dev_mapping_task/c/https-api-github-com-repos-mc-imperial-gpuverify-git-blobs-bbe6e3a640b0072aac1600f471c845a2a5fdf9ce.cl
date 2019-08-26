__kernel void A(__global float4* a, __global int4* b) {
  a[get_global_id(0)] = pown(a[get_global_id(0)], b[get_global_id(0)]);
}
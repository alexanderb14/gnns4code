__kernel void A(__global float4* a, __global float4* b, __global float* c) {
  size_t d = get_group_id(0) * get_local_size(0) + get_local_id(0);
  c[d] = dot(a[d], b[0]);
}
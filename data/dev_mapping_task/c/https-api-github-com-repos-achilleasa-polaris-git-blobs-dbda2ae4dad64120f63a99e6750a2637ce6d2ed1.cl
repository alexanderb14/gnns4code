__kernel void A(__global float3* a) {
  a[get_global_id(0)] = (float3)(0.0f, 0.0f, 0.0f);
}

__kernel void B(__global float3* a, __global float3* b) {
  int c = get_global_id(0);
  b[c] += a[c];
}
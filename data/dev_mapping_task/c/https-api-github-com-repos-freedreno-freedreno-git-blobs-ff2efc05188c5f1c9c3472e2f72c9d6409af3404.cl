__kernel void A(__global float4* a, __global float4* b, __global float4* c, __global float* d) {
  d[0] = dot(a[0], b[0]);
  c[1] = cross(a[1], b[1]);
  d[2] = distance(a[2], b[2]);
  d[3] = length(a[3]);
  c[4] = normalize(a[4]);
  d[5] = fast_distance(a[5], b[5]);
  d[6] = fast_length(a[6]);
  c[7] = fast_normalize(a[7]);
}
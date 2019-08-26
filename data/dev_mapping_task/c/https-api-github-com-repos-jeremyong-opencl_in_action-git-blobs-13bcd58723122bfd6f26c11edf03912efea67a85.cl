__kernel void A(__global float4* a) {
  int b = get_global_id(0);
  a[b] = sqrt(a[b]);
}
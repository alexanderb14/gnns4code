__kernel void A(__global float4* a, float4 b) {
  int c = get_global_id(0);
  a[c] = b;
}
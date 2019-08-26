kernel void A(global float4* a, float b, float c, float d, float e) {
  int f = get_global_id(0);
  a[f] = (float4)(b, c, d, e);
}
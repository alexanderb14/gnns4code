kernel void A(global float4* a) {
  a[3].y = (float)get_global_id(0);
}
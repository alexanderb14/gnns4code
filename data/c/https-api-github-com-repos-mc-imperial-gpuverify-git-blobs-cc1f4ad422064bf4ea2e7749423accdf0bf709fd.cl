__kernel void A(__global float4* a) {
  float4 b;

  b = (float4)(1, 2, 3, 4);

  a[get_local_id(0)] = b;
}
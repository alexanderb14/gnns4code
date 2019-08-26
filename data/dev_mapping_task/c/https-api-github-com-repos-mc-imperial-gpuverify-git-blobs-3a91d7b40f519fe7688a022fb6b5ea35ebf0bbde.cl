__kernel void A(__global float* a) {
  __local float4 b[2048];

  b[get_local_id(0)].x = a[get_global_id(0)];

  volatile float c;

  c = b[get_local_id(0)].x;
}
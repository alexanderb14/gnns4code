__kernel void A(__global int* a) {
  __local int3 b[2048];

  b[get_local_id(0)].x = a[get_global_id(0)];

  volatile int c;

  c = b[get_local_id(0)].x;
}
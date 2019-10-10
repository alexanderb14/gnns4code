__kernel void A(__global int* a, __global int* b) {
  __local int c[1024];
  int d;
  int e = 1;

  if (get_local_id(0) >= e) {
    c[get_local_id(0)] = d;
  }
}
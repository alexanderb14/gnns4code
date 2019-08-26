__kernel void A(__local int* a, __local int* b, __global int* c) {
  int d = get_local_id(0);

  int e = 0;

  for (; e < 1024; e++) {
    a[e * 256 + d] = get_local_id(0);
    b[get_local_id(0) + 256 * e] = a[e * 256 + get_local_id(0)];
  }
}
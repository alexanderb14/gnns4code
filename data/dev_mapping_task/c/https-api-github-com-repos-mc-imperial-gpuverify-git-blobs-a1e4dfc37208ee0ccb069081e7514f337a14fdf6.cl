__kernel void A(__local int* a, __local int* b) {
  int c;

  b[get_local_id(0)] = a[0];
  a[0] = 5;
}
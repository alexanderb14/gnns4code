kernel void A(__global int* a) {
  int b[] = {1};

  a[get_global_id(0)] = b[0];
}
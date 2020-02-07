constant int Ga[16] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
__kernel void A(__global int* a) {
  const int b[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};

  a[get_global_id(0)] = b[get_global_id(0)] + Ga[get_global_id(0)];
}
__kernel void A(__global double* a, int b) {
  for (long c = b; c > 0; c >>= 1) {
    a[get_global_id(0)] = 0.0;
  }
}
__kernel void A(__global hmc_float* a, __global hmc_float* b, const uint c) {
  uint d = get_global_id(0);
  hmc_float e = 0;
  if (d == 0) {
    for (uint f = 0; f < c; f++) {
      e += b[f];
    }
    *a = e;
  }
}
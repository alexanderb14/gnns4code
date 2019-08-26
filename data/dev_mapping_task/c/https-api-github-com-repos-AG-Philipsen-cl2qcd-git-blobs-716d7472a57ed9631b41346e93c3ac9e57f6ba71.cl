__kernel void A(__global hmc_float* a, __global hmc_float* b, __global hmc_float* c) {
  if (get_global_id(0) == 0)
    (*c) = (*a) - (*b);
}
__kernel void A(__global hmc_float* a, const int b, __global hmc_float* c) {
  if (get_global_id(0) == 0)
    (*c) = a[b];
}

__kernel void B(__global hmc_float* a, const int b, __global hmc_float* c) {
  if (get_global_id(0) == 0)
    c[b] = (*a);
}
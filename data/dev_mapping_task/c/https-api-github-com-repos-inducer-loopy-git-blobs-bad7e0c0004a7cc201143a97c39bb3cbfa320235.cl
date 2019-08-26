__kernel void __attribute__((reqd_work_group_size(128, 1, 1))) A(__global float* restrict a, __global float const* restrict b, int const c) {
  if ((-1 + -128 * ((int)get_group_id(0)) + -1 * ((int)get_local_id(0)) + c) >= 0)
    a[((int)get_local_id(0)) + ((int)get_group_id(0)) * 128] = 2.0f * b[((int)get_local_id(0)) + ((int)get_group_id(0)) * 128];
}
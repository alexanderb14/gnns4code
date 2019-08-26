__kernel void A(__global double* a, __global int* b, __global float* c, __global int* d) {
  if (a[get_global_id(0)] == __builtin_nanf(""))
    b[get_global_id(0)] = -1;
  else if (a[get_global_id(0)] == __builtin_inff())
    b[get_global_id(0)] = 1;
  else
    b[get_global_id(0)] = 0;

  if (c[get_global_id(0)] == __builtin_nanf(""))
    d[get_global_id(0)] = -1;
  else if (c[get_global_id(0)] == __builtin_inff())
    d[get_global_id(0)] = 1;
  else
    d[get_global_id(0)] = 0;
}
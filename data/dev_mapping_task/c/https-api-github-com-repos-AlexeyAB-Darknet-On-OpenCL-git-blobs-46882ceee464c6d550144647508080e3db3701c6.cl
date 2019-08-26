__kernel void A(__global float* a, int b, __global float* c, float d, float e) {
  int f = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (f < b)
    a[f] = (c[f] < d) ? 0 : a[f] * e;
}
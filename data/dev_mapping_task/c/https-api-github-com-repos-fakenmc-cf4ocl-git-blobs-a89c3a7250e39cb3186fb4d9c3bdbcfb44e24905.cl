__kernel void A(__global const uint* a, __global const uint* b, __global uint* c, uint d, uint e) {
  uint f = get_global_id(0);

  if (f < e)
    c[f] = a[f] + b[f] + d;
}
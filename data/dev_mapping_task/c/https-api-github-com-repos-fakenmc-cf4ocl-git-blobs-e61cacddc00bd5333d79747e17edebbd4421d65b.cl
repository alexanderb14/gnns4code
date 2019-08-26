__kernel void A(__global const uint* a, __global const uint* b, __global uint* c, uint d) {
  int e = get_global_id(0);

  c[e] = a[e] + b[e] + d;
}
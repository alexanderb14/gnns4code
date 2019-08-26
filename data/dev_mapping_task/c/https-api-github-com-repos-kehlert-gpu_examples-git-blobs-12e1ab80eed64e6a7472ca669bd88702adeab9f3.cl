__kernel void A(__global uint* a, uint b, __global uint* c, uint d) {
  uint e = get_global_id(0);

  for (uint f = e; f < b; f += get_global_size(0)) {
    uint g = 0;
    for (uint h = 0; h < d; ++h) {
      g += c[h * b + f];
    }
    a[f] = g;
  }
}
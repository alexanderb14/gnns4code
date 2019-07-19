__kernel void A(__global float* a, __private int b) {
  size_t c = get_global_id(0);

  if (c < b)
    a[c] = 0;
}
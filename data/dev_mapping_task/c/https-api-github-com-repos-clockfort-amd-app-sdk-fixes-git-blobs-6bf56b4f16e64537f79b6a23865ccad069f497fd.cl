__kernel void A(__global const uint* a, __local uchar* b, __global uint* c) {
  size_t d = get_local_id(0);
  size_t e = get_global_id(0);
  size_t f = get_group_id(0);
  size_t g = get_local_size(0);

  for (int h = 0; h < 256; ++h)
    b[d * 256 + h] = 0;

  barrier(1);

  for (int h = 0; h < 256; ++h) {
    uint i = a[f * g * 256 + h * g + d];

    b[d * 256 + i]++;
  }

  barrier(1);

  for (int h = 0; h < 256 / g; ++h) {
    uint j = 0;
    for (int k = 0; k < g; ++k)
      j += b[k * 256 + h * g + d];

    c[f * 256 + h * g + d] = j;
  }
}
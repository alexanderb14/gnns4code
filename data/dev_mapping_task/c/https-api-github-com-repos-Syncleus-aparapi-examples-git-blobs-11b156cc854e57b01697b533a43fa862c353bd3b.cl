__kernel void A(__global const uchar* a, __local uchar* b, __global uint* c, uint d) {
  size_t e = get_local_id(0);
  size_t f = get_global_id(0);
  size_t g = get_group_id(0);
  size_t h = get_local_size(0);

  for (int i = 0; i < d; ++i)
    b[e * d + i] = 0;

  barrier(1);

  for (int i = 0; i < d; ++i) {
    uchar j = a[g * h * d + i * h + e];

    b[e * d + j]++;
  }

  barrier(1);

  for (int i = 0; i < d / h; ++i) {
    uint k = 0;
    for (int l = 0; l < h; ++l)
      k += b[l * d + i * h + e];

    c[g * d + i * h + e] = k;
  }
}

__kernel void B(__global uint* a, __global const uint* b, uint c) {
  size_t d = get_local_id(0);
  size_t e = get_global_size(0);
  uint f = 0;
  for (int g = 0; g < c; ++g) {
    f += b[g * e + d];
  }
  a[d] = f;
}
__kernel void A(__global const uint4* a, __local uchar* b, __global uint* c) {
  size_t d = get_local_id(0);
  size_t e = get_global_id(0);
  size_t f = get_group_id(0);
  size_t g = get_local_size(0);

  int h = d & 31;
  int i = 2 * h;
  int j = d >> 5;
  for (int k = 0; k < 64; ++k) {
    for (int l = 0; l < 64; ++l)
      b[k * 64 + l] = 0;
  }

  barrier(1);

  uint4 m;
  for (int l = 0; l < 64; l++) {
    uint4 n = a[f * g * 64 / 4 + l * g + d];
    m = n;
  }

  barrier(1);

  for (int l = 0; l < 64; ++l) {
    uint o = 0;
    c[f * 64 + l] = m.s3;
  }
}

__kernel void B(__global const unsigned int* a, __local uint* b, __global uint* c) {
  size_t d = get_local_id(0);
  size_t e = get_global_id(0);
  size_t f = get_group_id(0);
  size_t g = get_local_size(0);
  size_t h = get_num_groups(0);

  __local uint* i = (__local uint*)b;

  for (int j = 0; j < 64; ++j)
    i[j] = 0;

  barrier(1);

  for (int j = 0; j < 64; ++j)
    i[a[j]]++;

  barrier(1);

  if (d == 0)
    for (int j = 0; j < 64; ++j) {
      uint k = i[j];
      atomic_add(c + j, k);
    }
}
typedef float DATA_TYPE; __kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global DATA_TYPE* a, __global DATA_TYPE* b) {
  __local DATA_TYPE c[256 + 256 * 2];
  __local DATA_TYPE d[256 + 256 * 2];
  int e = get_group_id(0);
  if (e == 0) {
    async_work_group_copy(c, a, 256 + 256, 0);
  } else if (e > 0 & e < 16384 / 256 - 1) {
    async_work_group_copy(c, &a[256 * e - 256], 256 + 256 * 2, 0);
  } else if (e == 16384 / 256 - 1) {
    async_work_group_copy(c, &a[256 * e - 256], 256 + 256, 0);
  }
  barrier(1);

  int f, g;
  for (g = 1; g <= 256; ++g) {
    if (e == 0) {
      for (f = 0; f < 256 + 256 - g; ++f) {
        if (f == 0) {
          d[f] = c[f];
        } else {
          d[f] = 0.33333f * (c[f - 1] + c[f] + c[f + 1]);
        }
      }
      for (f = 0; f < 256 + 256 - g; ++f) {
        c[f] = d[f];
      }
    } else if (e > 0 & e < 16384 / 256 - 1) {
      for (f = 0; f < 256 + 256 * 2 - g * 2; ++f) {
        d[f] = 0.33333f * (c[f + g - 1] + c[f + g] + c[f + g + 1]);
      }
      for (f = 0; f < 256 + 256 * 2 - g * 2; ++f) {
        c[g + f] = d[f];
      }
    } else {
      for (f = g; f < 256 + 256; ++f) {
        if (f == 256 + 256 - 1) {
          d[f] = c[f];
        } else {
          d[f] = 0.33333f * (c[f - 1] + c[f] + c[f + 1]);
        }
      }
      for (f = g; f < 256 + 256; ++f) {
        c[f] = d[f];
      }
    }
  }
  barrier(1);

  if (e == 16384 / 256 - 1) {
    async_work_group_copy(&a[16384 - 256], &d[256], 256, 0);
  } else {
    async_work_group_copy(&a[256 * e], d, 256, 0);
  }
}
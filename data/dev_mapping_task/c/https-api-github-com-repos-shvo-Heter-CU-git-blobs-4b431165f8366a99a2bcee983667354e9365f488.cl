typedef float DATA_TYPE; __kernel __attribute__((reqd_work_group_size(256, 1, 1))) void A(__global DATA_TYPE* a, __global DATA_TYPE* b) {
  __local DATA_TYPE c[256 + 2];
  __local DATA_TYPE d[256];
  int e = get_group_id(0);
  if (e == 0) {
    async_work_group_copy(c, a, 256 + 1, 0);
  } else if (e > 0 & e < 16384 / 256 - 1) {
    async_work_group_copy(c, &a[256 * e - 1], 256 + 2, 0);
  } else if (e == 16384 / 256 - 1) {
    async_work_group_copy(c, &a[256 * e - 1], 256 + 1, 0);
  }
  barrier(1);

  int f = get_local_id(0);
  if (e == 0) {
    if (f == 0) {
      d[f] = c[f];
    } else {
      d[f] = 0.33333f * (c[f - 1] + c[f] + c[f + 1]);
    }
  } else if (e > 0 & e < 16384 / 256 - 1) {
    d[f] = 0.33333f * (c[f] + c[f + 1] + c[f + 2]);
  } else if (e == 16384 / 256 - 1) {
    if (f == 256 - 1) {
      d[f] = c[f + 1];
    } else {
      d[f] = 0.33333f * (c[f] + c[f + 1] + c[f + 2]);
    }
  }
  barrier(1);

  async_work_group_copy(&a[256 * e], d, 256, 0);
}
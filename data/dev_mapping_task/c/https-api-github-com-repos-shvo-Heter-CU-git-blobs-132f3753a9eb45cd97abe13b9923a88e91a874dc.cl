typedef float DATA_TYPE; __kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global DATA_TYPE* a, __global DATA_TYPE* b) {
  __local DATA_TYPE c[4096 + 4096 * 2] __attribute__((xcl_array_partition(cyclic, 16, 1)));
  __local DATA_TYPE d[4096 + 4096 * 2] __attribute__((xcl_array_partition(cyclic, 16, 1)));
  int e = get_group_id(0);
  async_work_group_copy(c, &a[4096 * e - 4096], 4096 + 4096 * 2, 0);
  barrier(1);

  int f, g;
  for (g = 1; g <= 4096; ++g) {
    __attribute__((xcl_pipeline_loop)) for (f = 0; f < 4096 + 4096 * 2 - 1; ++f) {
      d[f] = 0.33333f * (c[f] + c[f + 1] + c[f + 2]);
    }
  }
  barrier(1);

  async_work_group_copy(&a[4096 * e], d, 4096, 0);
}
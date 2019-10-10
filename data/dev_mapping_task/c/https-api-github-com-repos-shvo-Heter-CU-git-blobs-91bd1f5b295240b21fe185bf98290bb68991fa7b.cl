typedef float DATA_TYPE; __kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global DATA_TYPE* a, __global DATA_TYPE* b) {
  __local DATA_TYPE c[2048 + 2048 * 2] __attribute__((xcl_array_partition(cyclic, 4, 1)));
  ;
  __local DATA_TYPE d[2048 + 2048 * 2] __attribute__((xcl_array_partition(cyclic, 4, 1)));
  ;
  int e = get_group_id(0);
  if (e == 0) {
    async_work_group_copy(c, a, 2048 + 2048, 0);
  } else if (e > 0 & e < 16384 / 2048 - 1) {
    async_work_group_copy(c, &a[2048 * e - 2048], 2048 + 2048 * 2, 0);
  } else if (e == 16384 / 2048 - 1) {
    async_work_group_copy(c, &a[2048 * e - 2048], 2048 + 2048, 0);
  }
  barrier(1);

  int f, g;
  for (g = 1; g <= 2048; ++g) {
    if (e == 0) {
      __attribute__((xcl_pipeline_loop)) for (f = 0; f < 2048 + 2048 - g; ++f) {
        if (f == 0) {
          d[f] = c[f];
        } else {
          d[f] = 0.33333f * (c[f - 1] + c[f] + c[f + 1]);
        }
      }
      __attribute__((xcl_pipeline_loop)) for (f = 0; f < 2048 + 2048 - g; ++f) {
        c[f] = d[f];
      }
    } else if (e > 0 & e < 16384 / 2048 - 1) {
      __attribute__((xcl_pipeline_loop)) for (f = 0; f < 2048 + 2048 * 2 - g * 2; ++f) {
        d[f] = 0.33333f * (c[f + g - 1] + c[f + g] + c[f + g + 1]);
      }
      __attribute__((xcl_pipeline_loop)) for (f = 0; f < 2048 + 2048 * 2 - g * 2; ++f) {
        c[g + f] = d[f];
      }
    } else {
      __attribute__((xcl_pipeline_loop)) for (f = g; f < 2048 + 2048; ++f) {
        if (f == 2048 + 2048 - 1) {
          d[f] = c[f];
        } else {
          d[f] = 0.33333f * (c[f - 1] + c[f] + c[f + 1]);
        }
      }
      __attribute__((xcl_pipeline_loop)) for (f = g; f < 2048 + 2048; ++f) {
        c[f] = d[f];
      }
    }
  }
  barrier(1);

  if (e == 16384 / 2048 - 1) {
    async_work_group_copy(&a[16384 - 2048], &d[2048], 2048, 0);
  } else {
    async_work_group_copy(&a[2048 * e], d, 2048, 0);
  }
}
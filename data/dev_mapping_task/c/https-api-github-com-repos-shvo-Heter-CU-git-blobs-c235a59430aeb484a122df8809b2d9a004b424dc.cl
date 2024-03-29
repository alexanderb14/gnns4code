typedef float DATA_TYPE; __kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global DATA_TYPE* a, __global DATA_TYPE* b) {
  __local DATA_TYPE c[1024 + 1024 * 2] __attribute__((xcl_array_partition(cyclic, 4, 1)));
  ;
  __local DATA_TYPE d[1024 + 1024 * 2] __attribute__((xcl_array_partition(cyclic, 4, 1)));
  ;
  int e = get_group_id(0);
  if (e == 0) {
    async_work_group_copy(c, a, 1024 + 1024, 0);
  } else if (e > 0 & e < 16384 / 1024 - 1) {
    async_work_group_copy(c, &a[1024 * e - 1024], 1024 + 1024 * 2, 0);
  } else if (e == 16384 / 1024 - 1) {
    async_work_group_copy(c, &a[1024 * e - 1024], 1024 + 1024, 0);
  }
  barrier(1);

  int f, g;
  for (g = 1; g <= 1024; ++g) {
    if (e == 0) {
      __attribute__((xcl_pipeline_loop)) for (f = 0; f < 1024 + 1024 - g; ++f) {
        if (f == 0) {
          d[f] = c[f];
        } else {
          d[f] = 0.33333f * (c[f - 1] + c[f] + c[f + 1]);
        }
      }
      __attribute__((xcl_pipeline_loop)) for (f = 0; f < 1024 + 1024 - g; ++f) {
        c[f] = d[f];
      }
    } else if (e > 0 & e < 16384 / 1024 - 1) {
      __attribute__((xcl_pipeline_loop)) for (f = 0; f < 1024 + 1024 * 2 - g * 2; ++f) {
        d[f] = 0.33333f * (c[f + g - 1] + c[f + g] + c[f + g + 1]);
      }
      __attribute__((xcl_pipeline_loop)) for (f = 0; f < 1024 + 1024 * 2 - g * 2; ++f) {
        c[g + f] = d[f];
      }
    } else {
      __attribute__((xcl_pipeline_loop)) for (f = g; f < 1024 + 1024; ++f) {
        if (f == 1024 + 1024 - 1) {
          d[f] = c[f];
        } else {
          d[f] = 0.33333f * (c[f - 1] + c[f] + c[f + 1]);
        }
      }
      __attribute__((xcl_pipeline_loop)) for (f = g; f < 1024 + 1024; ++f) {
        c[f] = d[f];
      }
    }
  }
  barrier(1);

  if (e == 16384 / 1024 - 1) {
    async_work_group_copy(&a[16384 - 1024], &d[1024], 1024, 0);
  } else {
    async_work_group_copy(&a[1024 * e], d, 1024, 0);
  }
}
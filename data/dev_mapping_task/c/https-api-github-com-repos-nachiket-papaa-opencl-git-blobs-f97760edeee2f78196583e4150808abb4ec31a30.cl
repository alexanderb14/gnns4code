__kernel __attribute__((reqd_work_group_size((28), ((28) + (2) - 1) / (2), 1))) void A(__global float* a, __constant float* b, __global float* c, const float d) {
  __local float e[(28) * (((28) + (2) - 1) / (2) + (3) - 1)] __attribute__((xcl_array_partition(cyclic, 3, 1)));

  __local float f[(3) * (3)] __attribute__((xcl_array_partition(complete, 1)));

  __attribute__((xcl_pipeline_workitems)) {
    int g = get_local_id(0);
    int h = get_local_id(1);
    int i = get_global_id(1);
    if (g < (3) * (3)) {
      f[g] = b[g];
    }
    e[h * (28) + g] = a[i * (28) + g];

    if (h > (get_local_size(1) - (3))) {
      e[(h + (3) - 1) * (28) + g] = a[(i + (3) - 1) * (28) + g];
    }
  }

  barrier(1);

  float j = 0;

  __attribute__((xcl_pipeline_workitems)) {
    int k = get_local_id(0);
    int l = get_local_id(1);
    int i = get_global_id(1);
    for (int m = 0; m < (3); m++) {
      for (int n = 0; n < (3); n++) {
        j += f[m * (3) + n] * e[(l + m) * (28) + k + n];
      }
    }
    c[i * (28) + k] = j + d;
  }
}
__kernel __attribute__((reqd_work_group_size((28), (28), 1))) void A(__global float* a, __constant float* b, __global float* c, const float d) {
  __local float e[(28) * (28)] __attribute__((xcl_array_partition(cyclic, 3, 1)));

  __local float f[(3) * (3)] __attribute__((xcl_array_partition(complete, 1)));

  __attribute__((xcl_pipeline_workitems)) {
    int g = get_local_id(0);
    int h = get_local_id(1);
    if (g < (3) * (3)) {
      f[g] = b[g];
    }
    e[h * (28) + g] = a[h * (28) + g];
  }

  barrier(1);

  __attribute__((xcl_pipeline_workitems)) {
    float i = 0;
    int j = get_local_id(0);
    int k = get_local_id(1);

    for (int l = 0; l < (3); l++) {
      for (int m = 0; m < (3); m++) {
        i += f[l * (3) + m] * e[(k + l) * (28) + j + m];
      }
    }
    c[k * (28) + j] = i + d;
  }
}
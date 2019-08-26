__kernel void A(__global float* a, __global float* b, __local float* c, __local float* d, __global float* e) {
  int f = get_num_groups(0);
  int g = get_group_id(0);
  int h = get_group_id(1);

  int i = get_local_id(0);

  d[i] = a[g * f + i] * b[i * f + h];

  barrier(1);

  if (i == 0) {
    (*c) = 0.0f;
    for (int j = 0; j < f; j++) {
      (*c) += d[j];
    }
  }
  e[g * f + h] = (*c);

  barrier(2);
}
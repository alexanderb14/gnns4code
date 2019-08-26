__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global float* a, __constant float* b, __global float* c, const float d) {
  int e = get_global_size(0);
  int f = get_global_size(1);
  int g = 3;

  int h = get_global_id(0);
  int i = get_global_id(1);
  float j = 0;
  int k = 0;

  if ((h < e - g + 1) && (i < f - g + 1)) {
    for (int l = 0; l < g; l++) {
      for (k = 0; k < g; k++) {
        j += b[l * g + k] * a[i * e + l * e + h + k];
      }
    }
    c[i * e + h] = j + d;
  }
}
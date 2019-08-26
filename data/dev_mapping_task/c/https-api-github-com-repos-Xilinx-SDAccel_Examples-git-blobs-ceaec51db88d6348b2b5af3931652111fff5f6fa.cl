__kernel __attribute__((reqd_work_group_size(16, 16, 1))) __attribute__((vec_type_hint(int))) void A(__global const int* a, __global const int* b, __global int* c, const int d) {
  int e = d / 256;

  int f = 0;

  int g = get_local_id(0);
  int h = get_local_id(1);

  int i = get_local_size(0);
  int j = get_local_size(1);
  for (int k = 0; k < e; k++) {
    f = k * i * j + h * i + g;
    c[f] = a[f] + b[f];
  }
}
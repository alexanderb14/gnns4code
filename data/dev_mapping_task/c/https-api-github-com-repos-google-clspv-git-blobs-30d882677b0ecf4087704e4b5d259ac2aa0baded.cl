void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float2* a, int b) {
  *a = b ? (float2)(1.0, 2.0) : (float2)(3.0, 4.0);
}
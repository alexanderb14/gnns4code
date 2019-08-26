void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float* a, global float* b, global int* c) {
  local int d;
  *a = frexp(*b, &d);
  *c = d;
}
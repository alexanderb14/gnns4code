struct Thing {
  float a[128];
};
float A(global struct Thing* a) {
  return a[1].a[5];
}
void kernel __attribute__((reqd_work_group_size(1, 1, 1))) B(global float* a, global struct Thing* b) {
  *a = A(b);
}
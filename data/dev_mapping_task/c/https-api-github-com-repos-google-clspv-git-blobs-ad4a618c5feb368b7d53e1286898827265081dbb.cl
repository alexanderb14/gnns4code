void A(__global float* a) {
  *a = 1.0f;
}
void kernel __attribute__((reqd_work_group_size(1, 1, 1))) B(__global uint* a) {
  A(a);
}
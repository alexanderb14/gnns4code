struct Thing {
  float x;
  float y;
};
struct Thing A() {
  struct Thing a;
  a.x = 42.0f;
  a.y = 2.0f;
  return a;
} struct Thing B() {
  struct Thing a = A();
  a.x = 13.0f;
  return a;
} void kernel __attribute__((reqd_work_group_size(42, 13, 2))) C(global float* a) {
  *a = B().x * B().y;
}
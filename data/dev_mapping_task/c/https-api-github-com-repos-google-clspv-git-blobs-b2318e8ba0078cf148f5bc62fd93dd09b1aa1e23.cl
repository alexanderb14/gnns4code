typedef struct { float x[12]; } Thing;

float A(global Thing* a, int b) {
  return a[b].x[7];
}

void kernel __attribute__((reqd_work_group_size(1, 1, 1))) B(global Thing* a, global float* b, int c) {
  *b = A(a, c);
}
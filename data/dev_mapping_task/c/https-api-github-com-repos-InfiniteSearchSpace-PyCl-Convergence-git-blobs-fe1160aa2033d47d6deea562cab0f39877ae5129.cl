__kernel void A(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  unsigned int f = d + a * e;
  unsigned int g = 0;

  if (b[f - 1] == 1) {
    g += 1;
  }
  if (b[f + 1] == 1) {
    g += 1;
  }
  if (b[f - 1 - a] == 1) {
    g += 1;
  }
  if (b[f - 1 + a] == 1) {
    g += 1;
  }
  if (b[f + 1 - a] == 1) {
    g += 1;
  }
  if (b[f + 1 + a] == 1) {
    g += 1;
  }
  if (b[f - a] == 1) {
    g += 1;
  }
  if (b[f + a] == 1) {
    g += 1;
  }

  if (g != 2) {
    if (g == 3) {
    } else {
    }
  }
}
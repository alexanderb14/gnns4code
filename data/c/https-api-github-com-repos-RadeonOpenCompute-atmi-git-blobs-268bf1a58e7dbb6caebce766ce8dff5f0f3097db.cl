__kernel void A(__global int* a) {
  int b = get_global_id(0);
  a[b] = (int)b;
}

__kernel void B(__global const int* a, __global int* b) {
  int c = get_global_id(0) * 2;
  b[c] = a[c] * a[c];
}

__kernel void C(__global int* a) {
  int b = (get_global_id(0) * 2) + 1;
  a[b] = a[b - 1] + (2 * b) - 1;
}
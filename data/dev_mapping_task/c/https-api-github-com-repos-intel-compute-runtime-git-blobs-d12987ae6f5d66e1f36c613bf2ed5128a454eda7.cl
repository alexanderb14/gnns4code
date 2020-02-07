__kernel void A(int a, __global int* b) {
  int c = (int)get_global_id(0);
  b[c] = a;
}
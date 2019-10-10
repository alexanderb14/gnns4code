__kernel void A(__global int* a, int b) {
  unsigned int c = get_global_id(0);
  a[c] = b;
}

__kernel void B(__global float* a, float b) {
  unsigned int c = get_global_id(0);
  a[c] = b;
}
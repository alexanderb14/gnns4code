__kernel void A(__global char* a, __global char* b) {
  int c = get_global_id(0);
  b[c] = a[c] + 1;
}
__kernel void B(__global char* a, __global char* b) {
  int c = get_global_id(0);
  b[c] = a[c] - 1;
}

__kernel void C(__global char* a, __global char* b) {
  int c = get_global_id(0);
  b[c] = a[c] - 2;
}
__kernel void D(__global char* a, __global char* b) {
  int c = get_global_id(0);
  b[c] = a[c] + 2;
}
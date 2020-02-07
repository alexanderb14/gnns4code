__kernel void A(__global int* a, __global int* b) {
  int c = (int)get_global_id(0);
  b[c] = a[c];
  if (b[c] >= 0) {
    b[c] = a[c + 1];
    a[c] = 1;
  } else {
    b[c]--;
    a[c] = 2;
  }
}
__kernel void A(__global int* a, __global int* b) {
  const int c = get_global_id(0);
  if (a[c] == 1) {
    if (c == 0 || (c > 0 && a[c - 1] == 0)) {
      b[0] = c;
    }
  }
}
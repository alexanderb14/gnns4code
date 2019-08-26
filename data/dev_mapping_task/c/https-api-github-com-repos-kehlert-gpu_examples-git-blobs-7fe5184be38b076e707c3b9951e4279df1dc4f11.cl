__kernel void A(__global int* a, unsigned int b) {
  uint c = get_global_id(0);
  if (c < b) {
    a[c] = a[c] * a[c];
  }
}
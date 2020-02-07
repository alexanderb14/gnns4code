__kernel void A(__global int* a, const int b) {
  const int c = get_global_id(0);
  a[c] = 42;
}
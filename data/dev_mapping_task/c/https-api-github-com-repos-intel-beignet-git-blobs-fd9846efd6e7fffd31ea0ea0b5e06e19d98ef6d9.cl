__kernel void A(__global int* a, __global int* b) {
  const int c = get_global_id(0);
  b[c] = c;
  if (a[c] > 0)
    return;
  b[c] = a[c];
}
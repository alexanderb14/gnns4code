__kernel void A(__global int* a, __global int* b) {
  const int c = get_global_id(0);
  b[c] = c;
  if (c < 11 && (a[c] > 0 || a[c + 16] < 2))
    return;
  b[c] = a[c];
}
__kernel void A(__global int* a, __global int* b) {
  const int c = get_global_id(0);
  b[c] = c;
  while (b[c] > a[c]) {
    if (b[c] > 10)
      return;
    b[c]--;
  }
  b[c] += 2;
}
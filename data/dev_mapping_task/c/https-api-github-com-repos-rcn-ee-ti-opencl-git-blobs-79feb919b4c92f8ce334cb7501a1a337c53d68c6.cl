kernel void A(global int* a, int b) {
  for (int c = 0; c < b; ++c)
    a[c] += 1;
}
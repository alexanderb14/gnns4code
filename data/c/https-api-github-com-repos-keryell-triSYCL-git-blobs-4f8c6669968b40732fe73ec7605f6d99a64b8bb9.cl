__kernel void A(const __global int* a, __global int* b) {
  for (unsigned int c = 0; c < 300; ++c)
    b[c] = a[c] + 42;
}
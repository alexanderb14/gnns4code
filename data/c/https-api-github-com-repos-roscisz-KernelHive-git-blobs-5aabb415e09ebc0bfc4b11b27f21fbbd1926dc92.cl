__kernel void A(__global const int* a, unsigned int b, unsigned int c, __global int* d, unsigned int e) {
  int f = get_global_id(0);

  int g = e / get_global_size(0);

  for (int h = 0; h < g; h++) {
    d[(f * g) + h] = a[(f * g) + h];
  }
}
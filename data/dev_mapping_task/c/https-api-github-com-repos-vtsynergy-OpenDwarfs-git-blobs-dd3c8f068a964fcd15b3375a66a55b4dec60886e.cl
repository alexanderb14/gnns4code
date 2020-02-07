void __kernel A(const unsigned int a, __global unsigned int* b, __global unsigned int* c, __global float* d, __global float* e, __global float* f) {
  unsigned int g = get_global_id(0);

  if (g < a) {
    float h = f[g];

    const unsigned int i = b[g];
    const unsigned int j = b[g + 1];

    unsigned int k = 0;
    for (k = i; k < j; k++)
      h += d[k] * e[c[k]];

    f[g] = h;
  }
}
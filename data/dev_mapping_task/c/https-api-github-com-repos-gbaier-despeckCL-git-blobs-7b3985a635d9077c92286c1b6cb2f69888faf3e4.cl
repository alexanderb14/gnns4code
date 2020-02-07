__kernel void A(__global float* a, __global int* b, __global float* c, const int d, const int e, const int f) {
  const int g = get_global_id(0);
  const int h = f * f * d * e;

  if (g < d * e) {
    const int i = b[g];
    for (int j = 0; j < f * f; j++) {
      c[j * d * e + g] = a[i * h + j * d * e + g];
    }
  }
}
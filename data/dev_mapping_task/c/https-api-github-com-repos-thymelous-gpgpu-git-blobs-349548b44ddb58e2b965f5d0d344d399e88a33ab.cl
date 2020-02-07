__kernel void A(const __global float* a, const __global float* b, __global float* c, const unsigned int d, const unsigned int e, const unsigned int f) {
  int g = get_global_id(0);
  int h = get_global_id(1);

  float i = 0.0f;
  for (unsigned int j = 0; j < e; j++) {
    i += a[g * e + j] * b[j * f + h];
  }

  c[g * f + h] = i;
}
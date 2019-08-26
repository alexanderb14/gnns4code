__kernel void A(const int a, const int b, const int c, const int d, __global const int* e, __global const int* f, __global int* g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  int j = 0;

  if ((h <= a) && (i <= c)) {
    for (int k = 0; k < c; k++) {
      j += e[h * b + k] * f[i + d * k];
    }

    g[i + b * h] = j;
  }
}
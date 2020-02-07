__kernel void A(int a, __global int* b, __global int* c, __global float* d, __global float* e, __global float* f) {
  int g = get_global_id(0);

  int h = -1;
  int i = -1;

  for (int j = g; j < a; ++j) {
    if (b[j] == g && h == -1)
      h = j;
    if (b[j] == g + 1 && h != -1 && i == -1) {
      i = j - 1;
      break;
    }
    if (j == a - 1 && h != -1 && i == -1)
      i = j;
  }
  float k = 0.0f;
  for (int j = h; j <= i; ++j)
    k += d[j] * e[c[j]];

  f[g] = k;
}
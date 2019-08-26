__kernel void A(int a, float b, __global float* c, int d, __global float* e, int f, __global float* g) {
  int h = get_global_id(0);
  int i = get_global_id(1);

  float j;
  float k;

  if (i >= h) {
    j = b * c[h * d] * e[i * f];
    k = b * e[h * f] * c[i * d];
    g[h + (i * (i + 1)) / 2] = j + k + g[h + (i * (i + 1)) / 2];
  }
}
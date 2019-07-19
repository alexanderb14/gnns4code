__kernel void A(__global float* a, __global float* b, int c, int d) {
  int e = (int)get_global_id(0);
  int f = (int)get_global_id(1);

  if (f < c && e < d) {
    int g = d * 2;
    float h = a[(f * 2) * g + (e * 2)];
    float i = a[(f * 2) * g + (e * 2 + 1)];
    float j = a[(f * 2 + 1) * g + (e * 2)];
    float k = a[(f * 2 + 1) * g + (e * 2 + 1)];
    b[f * d + e] = 0.25 * (h + i + j + k);
  }
}
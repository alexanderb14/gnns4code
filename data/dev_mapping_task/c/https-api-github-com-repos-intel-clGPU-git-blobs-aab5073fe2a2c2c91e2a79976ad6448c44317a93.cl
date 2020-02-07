__kernel void A(int a, float b, __global float* c, int d, __global float* e) {
  int f = get_global_id(0);
  int g = get_global_id(1);

  float h;

  if (f >= g) {
    h = b * c[f * d] * c[g * d];
    e[(f + ((2 * a - g + 1) * g) / 2) - (1 * g)] = h + e[(f + ((2 * a - g + 1) * g) / 2) - (1 * g)];
  }
}
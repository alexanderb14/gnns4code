__kernel void A(int a, float b, __global float* c, int d, __global float* e) {
  int f = get_global_id(0);
  int g = get_global_id(1);

  float h;

  if (g >= f) {
    h = b * c[f * d] * c[g * d];
    e[f + (g * (g + 1)) / 2] = h + e[f + (g * (g + 1)) / 2];
  }
}
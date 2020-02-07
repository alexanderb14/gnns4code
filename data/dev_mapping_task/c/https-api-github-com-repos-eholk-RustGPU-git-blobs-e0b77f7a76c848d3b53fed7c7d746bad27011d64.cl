__kernel void A(__global void* a, __global void* b, ulong c, __global double* d, __global double* e) {
  ulong f = get_global_id(0) + 1;
  ulong g = get_global_id(1) + 1;

  if (f >= c - 1 || g >= c - 1) {
    return;
  }

  double h = d[(f - 1) * c + g];
  double i = d[(f + 1) * c + g];
  double j = d[(f)*c + (g - 1)];
  double k = d[(f)*c + (g + 1)];

  e[f * c + g] = (h + i + j + k) / 4.0;
}
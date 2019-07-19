typedef unsigned long uint64_t; __kernel void A(__global void* a, __global void* b, uint64_t c, __global double* d, uint64_t e) {
  d[e * c + e] = sqrt(d[e * c + e]);
}

__kernel void B(__global void* a, __global void* b, uint64_t c, __global double* d, uint64_t e) {
  int f = get_global_id(0);

  if (f > e && f < c) {
    double g = d[e * c + e];
    d[f * c + e] = d[f * c + e] / g;

    d[e * c + f] = 0;
  }
}

__kernel void C(__global void* a, __global void* b, uint64_t c, __global double* d, uint64_t e) {
  int f = get_global_id(0);
  int g = get_global_id(1);

  if (f <= e || g <= e)
    return;
  if (f >= c || g > f)
    return;

  double h = d[f * c + e];
  double i = d[g * c + e];
  double j = d[f * c + g];

  d[f * c + g] = j - h * i;
}
__kernel void A(__global double* a, __global double* b, double c) {
  int d = get_global_id(0) + 1;
  int e = get_global_id(1) + 1;
  int f = get_global_id(2) + 1;
  int g = get_global_size(0) + 2;
  b[d * g * g + e * g + f] = (a[d * g * g + (e - 1) * g + f] + a[d * g * g + (e + 1) * g + f] + a[(d - 1) * g * g + e * g + f] + a[(d + 1) * g * g + e * g + f] + a[(d - 1) * g * g + (e - 1) * g + f] + a[(d - 1) * g * g + (e + 1) * g + f] + a[(d + 1) * g * g + (e - 1) * g + f] + a[(d + 1) * g * g + (e + 1) * g + f] + a[d * g * g + (e - 1) * g + (f - 1)] + a[d * g * g + (e + 1) * g + (f - 1)] + a[(d - 1) * g * g + e * g + (f - 1)] + a[(d + 1) * g * g + e * g + (f - 1)] +
                              a[(d - 1) * g * g + (e - 1) * g + (f - 1)] + a[(d - 1) * g * g + (e + 1) * g + (f - 1)] + a[(d + 1) * g * g + (e - 1) * g + (f - 1)] + a[(d + 1) * g * g + (e + 1) * g + (f - 1)] + a[d * g * g + (e - 1) * g + (f + 1)] + a[d * g * g + (e + 1) * g + (f + 1)] + a[(d - 1) * g * g + e * g + (f + 1)] + a[(d + 1) * g * g + e * g + (f + 1)] + a[(d - 1) * g * g + (e - 1) * g + (f + 1)] + a[(d - 1) * g * g + (e + 1) * g + (f + 1)] + a[(d + 1) * g * g + (e - 1) * g + (f + 1)] +
                              a[(d + 1) * g * g + (e + 1) * g + (f + 1)] + a[d * g * g + e * g + (f - 1)] + a[d * g * g + e * g + (f + 1)]) *
                             c;
}
__kernel void B(__global double* a, __global double* b) {
  int c = get_global_id(0) + 1;
  int d = get_global_id(1) + 1;
  int e = get_global_id(2) + 1;
  int f = get_global_size(0) + 2;
  a[c * f * f + d * f + e] = b[c * f * f + d * f + e];
}
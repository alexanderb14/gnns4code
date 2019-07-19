__kernel void A(__global int* a, __global int* b, const int c) {
  int d = get_global_id(0);
  if (d < c) {
    int e = a[d];
    b[d] = e * e;
  }
}

__kernel void B(__global int* a, __global int* b, const int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);
  int f = get_global_size(0);

  int g = (e * f) + d;
  if (g < c) {
    b[g] = a[g];
  }
}
__kernel void A(const int a, const float b, __global float* c, __global float* d, __global float* e) {
  const int f = get_global_id(0);

  if (f < a) {
    c[f] += d[f] + b * e[f];
  }
}

__kernel void B(const int a, const double b, __global double* c, __global double* d, __global double* e) {
  const int f = get_global_id(0);

  if (f < a) {
    c[f] += d[f] + b * e[f];
  }
}
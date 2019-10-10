__kernel void A(const int a, const __global float* b, __global float* c) {
  int d = get_global_id(0);

  if (d < a)
    c[d] += b[d];
}
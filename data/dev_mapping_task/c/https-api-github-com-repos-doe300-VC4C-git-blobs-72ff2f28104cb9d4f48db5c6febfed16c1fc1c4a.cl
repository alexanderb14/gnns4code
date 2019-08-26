kernel void A(const int a, global float* b, global const float* c) {
  const int d = get_global_id(0);
  if (d >= a) {
    return;
  }
  b[d] *= c[d];
}
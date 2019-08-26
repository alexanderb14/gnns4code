kernel void A(const int a, const float b, global float* c) {
  const int d = get_global_id(0);
  if (d >= a) {
    return;
  }
  c[d] += b;
}
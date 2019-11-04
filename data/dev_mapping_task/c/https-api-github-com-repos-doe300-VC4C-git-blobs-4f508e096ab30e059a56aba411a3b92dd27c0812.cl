kernel void A(const int a, global float* b) {
  const int c = get_global_id(0);
  if (c >= a) {
    return;
  }
  b[c] = 1.0f / b[c];
}
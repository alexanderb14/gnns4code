kernel void A(const int a, global const unsigned char* b, global const float* c, global float* d) {
  const int e = get_global_id(0);
  if (e >= a) {
    return;
  }
  d[e] = b[e] == 1 ? c[e] : 0.0f;
}

kernel void B(const int a, global const unsigned char* b, global const float* c, global float* d) {
  const int e = get_global_id(0);
  if (e >= a) {
    return;
  }
  d[e] = b[e] == 1 ? c[e] : 0.0f;
}
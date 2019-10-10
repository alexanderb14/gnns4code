kernel void A(global int* a, const int b) {
  const int c = get_global_id(0);
  if (c < get_global_size(0)) {
    a[c] = b;
  }
}

kernel void B(global long* a, const long b) {
  const int c = get_global_id(0);
  if (c < get_global_size(0)) {
    a[c] = b;
  }
}

kernel void C(global float* a, const float b) {
  const int c = get_global_id(0);
  if (c < get_global_size(0)) {
    a[c] = b;
  }
}
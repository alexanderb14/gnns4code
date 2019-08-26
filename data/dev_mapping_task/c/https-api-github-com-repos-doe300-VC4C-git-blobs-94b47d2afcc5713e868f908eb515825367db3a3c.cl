kernel void A(global float* a, const float b, const int c) {
  if ((int)get_global_id(0) < c) {
    a[get_global_id(0)] = b;
  }
}
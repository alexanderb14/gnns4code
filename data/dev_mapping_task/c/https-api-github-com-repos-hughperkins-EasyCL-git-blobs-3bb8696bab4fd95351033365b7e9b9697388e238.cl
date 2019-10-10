kernel void A(global float* a) {
  const int b = get_global_id(0);
  a[b] = a[b] + 7;
}
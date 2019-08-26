kernel void A(global float* a, global float* b) {
  b[get_global_id(0)] = a[get_global_id(0)] + 5;
}
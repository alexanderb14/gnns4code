__kernel void A(__global float* a, __global float* b, __global float* c, __private unsigned int d) {
  size_t e = get_global_id(0);

  if (e < d) {
    c[e] = -1 * native_log(b[e]) - a[e] * a[e] / 2;
  }
}
kernel void A(global float* a, global float* b, int c) {
  for (int d = get_global_id(0); d < c; d += get_global_size(0)) {
    b[d] = a[d] * 3.1425f + a[d] * a[d] * a[d] * a[d] - 1 / (a[d] + 0.000001f);
  }
}
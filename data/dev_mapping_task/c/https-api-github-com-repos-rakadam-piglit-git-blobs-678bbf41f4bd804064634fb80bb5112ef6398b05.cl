kernel void A(global float* a, global float* b, int c) {
  for (int d = get_global_id(0); d < c; d += get_global_size(0)) {
    float e = a[d];

    if (e < 0) {
      e = -e;
    }

    b[d] = sqrt(e);
  }
}
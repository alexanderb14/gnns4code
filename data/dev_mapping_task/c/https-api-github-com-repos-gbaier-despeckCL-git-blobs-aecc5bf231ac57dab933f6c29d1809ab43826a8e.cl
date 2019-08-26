__kernel void A(__global float* a, const int b, const int c, const int d, const int e) {
  const float f = ((float)c) / b;
  const float g = __clc_pow(min(f, 1.0f), 0.33333f);

  const int h = get_group_id(0) * get_local_size(0) + get_local_id(0);
  const int i = get_group_id(1) * get_local_size(1) + get_local_id(1);

  if ((h < d) && (i < e)) {
    for (int j = 0; j < b; j++) {
      for (int k = 0; k < b; k++) {
        if (j != k) {
          a[2 * (j * b + k) * d * e + h * e + i] *= g;
          a[(2 * (j * b + k) + 1) * d * e + h * e + i] *= g;
        }
      }
    }
  }
}
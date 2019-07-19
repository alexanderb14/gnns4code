__kernel void A(const __global float* const a, __constant float* const b, __global float* const c, const int d, const int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);

  float h = 0;
  for (int i = 0; i < e; i++) {
    const int j = (g + i) * d + f;

    for (int k = 0; k < e; k++) {
      h += ((b[(i * e) + k]) / 9) * a[j + k];
    }
  }

  c[g * get_global_size(0) + f] = h;
}
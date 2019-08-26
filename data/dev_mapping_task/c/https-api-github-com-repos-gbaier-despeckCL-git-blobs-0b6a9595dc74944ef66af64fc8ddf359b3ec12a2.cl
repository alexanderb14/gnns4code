__kernel void A(__global float* a, __global float* b, __global float* c, const int d, const int e, const int f, const int g) {
  const int h = get_group_id(0) * get_local_size(0) + get_local_id(0);
  const int i = get_group_id(1) * get_local_size(1) + get_local_id(1);

  float j = 0.0f;

  if (h < d && i < e) {
    const int k = h * e + i;
    for (int l = 0; l < f; l++) {
      const float m = b[l * d * e + k];
      const float n = a[l * d * e + k];
      j = max(j, max(0.0f, (m - n * n / g) / m));
    }
    c[h * e + i] = j;
  }
}
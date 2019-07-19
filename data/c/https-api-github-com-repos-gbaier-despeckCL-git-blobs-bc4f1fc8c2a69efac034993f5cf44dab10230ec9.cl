__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, __global float* f, const int g, const int h, const int i) {
  const int j = h - i + 1;
  const int k = g - i + 1;
  const int l = (i - 1) / 2;

  const int m = get_group_id(0) * get_local_size(0) + get_local_id(0);
  const int n = get_group_id(1) * get_local_size(1) + get_local_id(1);

  if (m < k && n < j) {
    const float o = a[(m + l) * h + (n + l)];
    const float p = b[(m + l) * h + (n + l)];
    const float q = c[(m + l) * h + (n + l)];

    d[m * j + n] = 0.5f * (__clc_pow(o, 2.0f) + __clc_pow(p, 2.0f));
    e[m * j + n] = o * p * cos(-q);
    f[m * j + n] = o * p * sin(-q);
  }
}
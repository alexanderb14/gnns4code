__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, const int e, const int f) {
  const int g = get_group_id(0) * get_local_size(0) + get_local_id(0);
  const int h = get_group_id(1) * get_local_size(1) + get_local_id(1);

  if ((g < e) && (h < f)) {
    const int i = g * f + h;

    const float j = sqrt(a[i]);
    const float k = sqrt(a[i + 6 * e * f]);

    b[i] = __clc_pow(0.5f * (j + k), 2.0f);
    c[i] = atan2(a[i + 3 * e * f], a[i + 2 * e * f]);
    d[i] = sqrt(__clc_pow(a[i + 3 * e * f], 2.0f) + __clc_pow(a[i + 2 * e * f], 2.0f)) / (j * k);
  }
}
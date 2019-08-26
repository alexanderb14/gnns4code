__kernel void A(__global float* a, __global float* b, __private int c, __private float d, __private float e, __private float f, __private float g, __private float h, __private int i, __private int j) {
  int k = get_local_id(0);
  int l = c * (k / i) + k % i + get_group_id(0) * i;

  if (l + c < j) {
    float m = mad(-mad(f - g, a[l], g) * d, b[l], b[l]);
    barrier(2 | 1);
    b[l + c] = m;
  }

  barrier(2 | 1);
  a[l] = -h * e * b[l] * a[l] + a[l];
}
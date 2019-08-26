__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, __private int e, __private float f, __private float g, __private float h, __private float i, __private float j, __private float k, __private float l, __private float m, __private float n) {
  int o = get_local_id(0);
  int p = e * (o / 4) + o % 4 + get_group_id(0) * 4;

  if (p + e < 5400) {
    d[p + e] = (-(l + (k - l) * c[p])) * f * d[p] + d[p];
    barrier(2 | 1);

    if (p % e != 0 && p % e != e - 1 && p >= e) {
      float q = (p % e) * f;
      float r = -(d[p + e] - d[p]) / f;
      b[p] = a[p] + g * h * ((a[p + 1] + a[p - 1] + a[p + e] + a[p - e] - 4 * a[p]) / (f * f) + (1 / q) * (a[p + 1] - a[p - 1]) / (2 * f)) + r * h / (i * j);
    }
  }
  c[p] = -m * h * d[p] * c[p] + c[p];
  if (o < 4)
    b[p] = n * a[p + e] / (n - 10.0 * f);
  if (o > 211)
    b[p] = n * a[p - e] / (n - 10.0 * f);

  if (p % e == 0)
    b[p] = a[p + 1];
}
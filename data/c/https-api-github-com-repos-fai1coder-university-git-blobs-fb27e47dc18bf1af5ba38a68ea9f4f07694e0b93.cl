__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, __private int e, __private float f, __private float g, __private float h, __private float i, __private float j, __private float k, __private float l, __private float m, __private float n, __private int o, __private int p) {
  int q = get_local_id(0);

  int r = get_global_id(0);
  int s = r % e;

  if (r + e < p) {
    float t = mad(-mad(k - l, c[r], l) * f, d[r], d[r]);
    barrier(2 | 1);
    d[r + e] = t;
    barrier(2 | 1);

    if (s != 0 && s != e - 1 && r >= e) {
      float u = (s)*f;
      float v = -(d[r + e] - d[r]) / f;
      b[r] = a[r] + mad(g * h, ((a[r + 1] + a[r - 1] + a[r + e] + a[r - e] - 4 * a[r]) / (f * f) + (1 / u) * (a[r + 1] - a[r - 1]) / (2 * f)), v * h / (i * j));
    }
  }
  c[r] = -m * h * d[r] * c[r] + c[r];

  barrier(2 | 1);
  if (r < e)
    b[r] = n * b[r + e] / (n - 10.0 * f);
  if (r >= e * (p / e - 1))
    b[r] = n * b[r - e] / (n - 10.0 * f);

  if (s == 0)
    b[r] = b[r + 1];
}
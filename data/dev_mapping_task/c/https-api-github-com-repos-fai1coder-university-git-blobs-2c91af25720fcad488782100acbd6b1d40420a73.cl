__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, __private int e, __private float f, __private float g, __private float h, __private float i, __private float j, __private float k, __private float l, __private float m, __private float n, __private int o, __private int p, __private float q, __private float r, __private float s, __private float t, __private float u, __private int v, __private int w) {
  int x = get_local_id(0);
  int y = e * (x / o) + x % o + get_group_id(0) * o;
  int z = y % e;

  if (y + e < p) {
    float aa;
    if (y > v && y < w)
      aa = mad(-mad(k - l, c[y], l) * f, d[y], d[y]);
    else
      aa = d[y] * (-q * f + 1);
    barrier(2 | 1);
    d[y + e] = aa;
    barrier(2 | 1);

    if (z != 0 && z != e - 1 && y >= e) {
      float ab = (z)*f;
      float ac = -(d[y + e] - d[y]) / f;
      if (y > v && y < w) {
        b[y] = a[y] + mad(g * h, ((a[y + 1] + a[y - 1] + a[y + e] + a[y - e] - 4 * a[y]) / (f * f) + (1 / ab) * (a[y + 1] - a[y - 1]) / (2 * f)), ac * h / (i * j));
      } else
        b[y] = a[y] + mad(r * h, ((a[y + 1] + a[y - 1] + a[y + e] + a[y - e] - 4 * a[y]) / (f * f) + (1 / ab) * (a[y + 1] - a[y - 1]) / (2 * f)), ac * h / (t * s));
    }
  }
  if (y > v && y < w)
    c[y] = -m * h * d[y] * c[y] + c[y];

  if (x < o)
    b[y] = u * a[y + e] / (u - 10.0 * f);
  if (x >= o * ((p / e) - 1))
    b[y] = u * a[y - e] / (u - 10.0 * f);

  if (z == 0)
    b[y] = b[y + 1];
}
__kernel void A(const int a, const int b, const int c, const float d, __global const float* e, const int f, __global const float* g, const int h, const float i, __global float* j, const int k) {
  int l = get_global_id(0);
  int m = get_global_id(1);

  float n = 0.0;
  for (int o = 0; o < c; ++o)
    n += e[(l * f) + o] * g[(o * h) + m];
  j[(l * k) + m] = d * n + i * j[(l * k) + m];
}
__kernel void B(const int a, const int b, const int c, const float d, __global const float* e, const int f, __global const float* g, const int h, const float i, __global float* j, const int k) {
  __local float l[16][16];
  __local float m[16][16];

  __private int n, o, p, q, r, s;
  r = get_global_id(0);
  s = get_global_id(1);
  p = get_local_id(0);
  q = get_local_id(1);

  __private float t = 0.0;

  for (n = 0; n < c; n += 16) {
    l[p][q] = e[(r * f) + n + q];
    m[p][q] = g[((n + p) * h) + s];

    barrier(1);

    for (o = 0; o < 16; ++o)
      t += l[p][o] * m[o][q];

    barrier(1);
  }

  j[(r * k) + s] = d * t + i * j[(r * k) + s];
}
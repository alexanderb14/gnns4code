__kernel void A(int a, int b, int c, float d, __global float* e, int f, __global float* g, int h, float i, __global float* j, int k) {
  uint l = get_global_id(0);

  if (a == (0)) {
    float m = 0;
    for (uint n = 0; n < c; ++n) {
      m = mad(d * e[n * f + l], g[n * h], m);
    }

    if (i != 0)
      j[l * k] = m + i * j[l * k];
    else
      j[l * k] = m;
  }

  if (a == (1) | a == (2)) {
    float m = 0;
    for (uint n = 0; n < b; ++n) {
      m = mad(d * e[l * f + n], g[n * h], m);
    }

    if (i != 0)
      j[l * k] = m + i * j[l * k];
    else
      j[l * k] = m;
  }
}
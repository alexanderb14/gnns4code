__kernel void A(__global float* a, __global float* b, __local float* c, const uint d) {
  int e = get_local_id(0);

  int f = 1;

  c[2 * e] = a[2 * e];
  c[2 * e + 1] = a[2 * e + 1];

  for (int g = d >> 1; g > 0; g >>= 1) {
    barrier(1);

    if (e < g) {
      int h = f * (2 * e + 1) - 1;
      int i = f * (2 * e + 2) - 1;

      c[i] += c[h];
    }
    f *= 2;
  }

  if (e == 0)
    c[d - 1] = 0;

  for (int g = 1; g < d; g *= 2) {
    f >>= 1;
    barrier(1);

    if (e < g) {
      int h = f * (2 * e + 1) - 1;
      int i = f * (2 * e + 2) - 1;

      float j = c[h];
      c[h] = c[i];
      c[i] += j;
    }
  }

  barrier(1);

  b[2 * e] = c[2 * e];
  b[2 * e + 1] = c[2 * e + 1];
}
__kernel void B(__global float* a,

                __local float* b,

                __global float* c, const uint d) {
  const uint e = get_global_id(0);
  const uint f = get_local_id(0);
  const uint g = get_group_id(0);
  const uint h = get_local_size(0);

  const uint i = h << 1;
  int j = 1;

  const int k = f << 1;
  const int l = k + 1;

  const int m = e << 1;
  const int n = m + 1;

  uint o = f;
  uint p = f + h;
  uint q = f + g * h * 2;
  uint r = q + h;
  uint s = ((o) >> 4);
  uint t = ((p) >> 4);
  b[o + s] = (q < d) ? a[q] : 0;
  b[p + t] = (r < d) ? a[r] : 0;

  for (uint u = h; u > 0; u >>= 1) {
    barrier(1);

    if (f < u) {
      uint v = 2 * j * f;
      uint o = v + j - 1;
      uint p = o + j;
      o += ((o) >> 4);
      p += ((p) >> 4);

      b[p] += b[o];
    }
    j <<= 1;
  }

  barrier(1);
  if (f < 1) {
    uint w = i - 1;
    w += ((w) >> 4);
    c[g] = b[w];
    b[w] = 0;
  }

  for (uint u = 1; u < i; u <<= 1) {
    j >>= 1;
    barrier(1);

    if (f < u) {
      uint v = 2 * j * f;
      uint o = v + j - 1;
      uint p = o + j;
      o += ((o) >> 4);
      p += ((p) >> 4);

      float x = b[o];
      b[o] = b[p];
      b[p] += x;
    }
  }

  barrier(1);
  if (q < d)
    a[q] = b[o + s];
  if (r < d)
    a[r] = b[p + t];
}
__kernel void C(__global float* a, __global const float* b, const uint c) {
  uint d = get_global_id(0) * 2;
  const uint e = get_local_id(0);
  const uint f = get_group_id(0);

  __local float g[1];

  if (e < 1) {
    g[0] = b[f];
  }

  barrier(1);

  unsigned int h = f * get_local_size(0) * 2 + get_local_id(0);

  if (h < c)
    a[h] += g[0];
  if (h + get_local_size(0) < c)
    a[h + get_local_size(0)] += g[0];
}
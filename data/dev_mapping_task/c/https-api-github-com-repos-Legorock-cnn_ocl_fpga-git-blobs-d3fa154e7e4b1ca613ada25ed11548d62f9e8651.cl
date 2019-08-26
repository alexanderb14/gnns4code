float A(float a) {
  return max((float)0, a);
}

size_t B(const size_t a, const size_t b, const size_t c) {
  return b + a * c;
}

size_t C(const size_t a, const size_t b, const size_t c, const size_t d, const size_t e) {
  return c + b * (d) + a * (d * e);
}

__kernel __attribute__((reqd_work_group_size(4, 4, 4))) void D(__global float* a, __global float* b) {
  size_t c = get_global_id(0);
  size_t d = get_global_id(1);
  size_t e = get_global_id(2);
  size_t f = get_global_size(0);
  size_t g = get_global_size(1);
  size_t h = f * 2;
  size_t i = g * 2;

  size_t j = c * 2 + h * (d * 2 + e * i);
  size_t k = c * 2 + 1 + h * (d * 2 + e * i);
  size_t l = c * 2 + h * (d * 2 + 1 + e * i);
  size_t m = c * 2 + 1 + h * (d * 2 + 1 + e * i);
  size_t n = c + f * (d + e * g);

  b[n] = max(a[j], max(a[k], max(a[l], a[m])));
  return;
}
__kernel __attribute__((reqd_work_group_size(4, 4, 4))) void E(__global float* a, __global float* b, __constant float* c, __constant float* d, const uchar e, const uchar f, const uchar g) {
  __local float h[(4 + 5 - 1) * (4 + 5 - 1)];

  size_t i = get_global_id(0);
  size_t j = get_global_id(1);
  size_t k = get_global_id(2);
  size_t l = get_global_size(0);
  size_t m = get_global_size(1);

  event_t n;
  size_t o = get_group_id(0) * 4 + get_group_id(1) * 4 * e;
  size_t p = i + l * (j + m * k);

  float q = (float)0;
  for (size_t r = 0; r < g; ++r) {
    for (size_t s = 0; s < (4 + 5 - 1); ++s)
      n = async_work_group_copy(&h[s * (4 + 5 - 1)], &a[o + s * e], (4 + 5 - 1), n);
    o += f * e;

    wait_group_events(1, &n);
    barrier(1);

    for (size_t t = 0; t < 5; ++t) {
      for (size_t u = 0; u < 5; ++u) {
        q += h[B(t + get_local_id(1), u + get_local_id(0), (4 + 5 - 1))] * c[u + (t + r * 5) * 5 + k * 5 * 5 * g];
      }
    }
  }
  b[p] = A(q + d[k]);
  return;
}
__kernel __attribute__((reqd_work_group_size(2, 1, 1))) void F(__global float* a, __global float* b, __constant float* c, __constant float* d, const ushort e) {
  size_t f = get_global_id(0);
  float g = 0;
  for (size_t h = 0; h < e; ++h) {
    g += a[h] * c[f * e + h];
  }
  b[f] = A(g + d[f]);
  return;
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void G(__global float* a, __global float* b) {
  float c[10];
  float d = 0;

  for (uchar e = 0; e < 10; ++e) {
    c[e] = exp(a[e]);
    d += c[e];
  }

  for (uchar e = 0; e < 10; ++e) {
    b[e] = c[e] / d;
  }
  return;
}
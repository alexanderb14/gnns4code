typedef float real_t; __kernel void A(__global real_t* a, __global real_t* b, size_t c, size_t d, size_t e, __constant real_t* f, size_t g, size_t h, __local real_t* i, size_t j, size_t k) {
  const size_t l = h;
  const size_t m = (h / 2);

  const size_t n = k;
  const size_t o = j;

  const size_t p = get_local_size(1);
  const size_t q = get_local_size(0);

  size_t r = get_group_id(0) * o + get_local_id(0);
  size_t s = get_group_id(1) * n + get_local_id(1);

  int t = r - m;
  int u = s - m * e;

  if (t >= 0 && t < c && u >= 0 && u < d) {
    i[get_local_id(0) * p + get_local_id(1)] = b[t * d + u];
  } else {
    i[get_local_id(0) * p + get_local_id(1)] = 0.0;
  }

  barrier(1);
  real_t v = 0.0;
  if (get_local_id(0) < o && get_local_id(1) < n) {
    for (size_t w = 0U; w < l; ++w) {
      for (size_t x = 0U; x < l; ++x) {
        size_t y = get_local_id(1) + x * e;
        v += f[w * l + x] * i[(get_local_id(0) + w) * p + y];
      }
    }
  }

  if (r < c && s < d) {
    a[r * d + s] = v;
  }
}
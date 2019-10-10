typedef float real_t; __kernel void A(__global real_t* a, size_t b, size_t c) {
  size_t d = get_global_id(0);
  size_t e = get_global_id(1);

  real_t f = -1.0 * a[d * c + e];
  a[d * c + e] = 1.0 / (1.0 + exp(f));
}

__kernel void B(__global real_t* a, __global real_t* b, size_t c, size_t d) {
  size_t e = get_global_id(0);
  size_t f = get_global_id(1);

  real_t g = b[e * d + f];
  a[e * d + f] = g * (1.0 - g);
}

__kernel void C(__global real_t* a, size_t b, size_t c) {
  size_t d = get_global_id(0);
  size_t e = get_global_id(1);

  real_t f = a[d * c + e];
  a[d * c + e] = tanh(f);
}

__kernel void D(__global real_t* a, __global real_t* b, size_t c, size_t d) {
  size_t e = get_global_id(0);
  size_t f = get_global_id(1);

  real_t g = b[e * d + f];
  a[e * d + f] = 1.0 - (g * g);
}

__kernel void E(__global real_t* a, size_t b, size_t c) {
  size_t d = get_global_id(0U);
  size_t e = get_global_id(1U);

  real_t f = exp(a[d * c + e]);
  a[d * c + e] = f;
}

__kernel void F(__global real_t* a, size_t b, size_t c) {
  size_t d = get_global_id(0U);

  real_t e = 0.0;
  for (size_t f = 0U; f < c; ++f) {
    e += a[d * c + f];
  }

  for (size_t f = 0U; f < c; ++f) {
    a[d * c + f] /= e;
  }
}
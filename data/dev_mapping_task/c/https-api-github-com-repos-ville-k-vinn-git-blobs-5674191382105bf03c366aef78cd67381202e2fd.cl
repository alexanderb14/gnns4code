typedef float real_t; __kernel void A(__global real_t* a, __global real_t* b, __global real_t* c, size_t d, size_t e, size_t f) {
  size_t g = get_global_id(0);
  size_t h = get_global_id(1);
  size_t i = h;
  size_t j = g;

  real_t k = 0.0;
  for (size_t l = 0; l < e; ++l) {
    k += b[(j * e + l)] * c[(i + l * f)];
  }
  a[(j * f + i)] = k;
}

__kernel void B(__global real_t* a, __global real_t* b, real_t c, size_t d, size_t e) {
  size_t f = get_global_id(0);
  size_t g = get_global_id(1);

  real_t h = c * b[f * e + g];
  a[f * e + g] = h;
}

__kernel void C(__global real_t* a, __global real_t* b, __global real_t* c, size_t d, size_t e) {
  size_t f = get_global_id(0);
  size_t g = get_global_id(1);

  real_t h = b[f * e + g] * c[f * e + g];
  a[f * e + g] = h;
}

__kernel void D(__global real_t* a, __global real_t* b, real_t c, size_t d, size_t e) {
  size_t f = get_global_id(0);
  size_t g = get_global_id(1);

  real_t h = b[f * e + g] + c;
  a[f * e + g] = h;
}

__kernel void E(__global real_t* a, __global real_t* b, __global real_t* c, size_t d, size_t e) {
  size_t f = get_global_id(0);
  size_t g = get_global_id(1);

  real_t h = b[f * e + g] + c[f * e + g];
  a[f * e + g] = h;
}

__kernel void F(__global real_t* a, __global real_t* b, __global real_t* c, size_t d, size_t e) {
  size_t f = get_global_id(0);
  size_t g = get_global_id(1);

  real_t h = b[f * e + g] - c[f * e + g];
  a[f * e + g] = h;
}

__kernel void G(__global real_t* a, __global real_t* b, __global real_t* c, size_t d, size_t e, size_t f) {
  size_t g = get_global_id(0U);

  size_t h = e + f;

  for (size_t i = 0U; i < e; ++i) {
    a[g * h + i] = b[g * e + i];
  }

  for (size_t i = 0U; i < f; ++i) {
    a[g * h + e + i] = c[g * f + i];
  }
}

__kernel void H(__global real_t* a, __global real_t* b, size_t c, size_t d) {
  size_t e = get_global_id(0U);
  size_t f = get_global_id(1U);

  a[f * c + e] = b[e * d + f];
}

__kernel void I(__global real_t* a, __global real_t* b, size_t c, size_t d) {
  size_t e = get_global_id(1);

  real_t f = 0.0;
  for (size_t g = 0U; g < c; ++g) {
    f += b[g * d + e];
  }
  a[e] = f;
}

__kernel void J(__global real_t* a, __global real_t* b, size_t c, size_t d) {
  size_t e = get_global_id(0);

  for (size_t f = 0U; f < d; ++f) {
    a[e] += b[e * d + f];
  }
}

__kernel void K(__global real_t* a, __global real_t* b, size_t c, size_t d) {
  size_t e = get_global_id(0);
  size_t f = get_global_id(1);

  real_t g = b[e * d + f];
  a[e * d + f] = log(g);
}
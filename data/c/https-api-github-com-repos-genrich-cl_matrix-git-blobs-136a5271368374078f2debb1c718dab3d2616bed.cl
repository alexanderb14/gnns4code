__kernel void A(__global double* a) {
  const size_t b = get_global_id(0);
  a[b] = 0;
}

__kernel void B(__global const double* a, __global double* b) {
  const size_t c = get_global_id(0);
  b[c] = -a[c];
}

__kernel void C(__global const double* a, __global double* b) {
  const size_t c = get_global_id(0);
  const size_t d = get_global_id(1);
  const size_t e = get_global_size(0);
  const size_t f = get_global_size(1);

  b[c * f + d] = a[d * e + c];
}

__kernel void D(__global const double* a, __global const double* b, __global double* c) {
  const size_t d = get_global_id(0);
  c[d] = a[d] + b[d];
}

__kernel void E(__global const double* a, const double b, __global double* c) {
  const size_t d = get_global_id(0);
  c[d] = a[d] + b;
}

__kernel void F(__global const double* a, __global const double* b, __global double* c) {
  const size_t d = get_global_id(0);
  c[d] = a[d] - b[d];
}

__kernel void G(const double a, __global const double* b, __global double* c) {
  const size_t d = get_global_id(0);
  c[d] = a - b[d];
}

__kernel void H(__global const double* a, const double b, __global double* c) {
  const size_t d = get_global_id(0);
  c[d] = a[d] * b;
}

__kernel void I(__global const double* a, const double b, __global double* c) {
  const size_t d = get_global_id(0);
  c[d] = __clc_pow(a[d], b);
}

__kernel void J(const double a, __global const double* b, __global double* c) {
  const size_t d = get_global_id(0);
  c[d] = __clc_pow(a, b[d]);
}

__kernel void K(const double a, __global const double* b, __global double* c) {
  const size_t d = get_global_id(0);
  c[d] = a / b[d];
}

__kernel void L(__global const double* a, __global const double* b, __global double* c) {
  const size_t d = get_global_id(0);
  c[d] = a[d] * b[d];
}

__kernel void M(__global const double* a, __global const double* b, __global double* c) {
  const size_t d = get_global_id(0);
  c[d] = a[d] / b[d];
}

__kernel void N(__global const double* a, __global double* b) {
  const size_t c = get_global_id(0);
  b[c] = 1 / (1 + exp(-a[c]));
}

__kernel __attribute__((vec_type_hint(double))) void O(__global const double* a, const uint b, const ulong c, __local double* d, __global double* e) {
  const size_t f = get_global_id(0);
  const size_t g = get_local_id(0);
  const size_t h = get_local_size(0);
  const size_t i = get_group_id(0);
  const size_t j = get_num_groups(0);
  const size_t k = h / 2;

  double l = 0;
  for (uint m = 0; m < b; m++) {
    const ulong n = f + m * j * h;
    l += (((long)(n < c)) ? (a[n]) : ((double)0));
  }
  d[g] = l;
  barrier(1);

  for (uint m = k; m > 0; m >>= 1) {
    if (g < m)
      d[g] += d[g + m];

    barrier(1);
  }

  if (g == 0)
    e[i] = d[0];
}

__kernel __attribute__((vec_type_hint(double))) void P(__global const double* a, const ulong b, __local double* c, __global double* d) {
  const size_t e = get_local_id(0);
  const size_t f = get_local_size(0);
  const size_t g = f / 2;
  const ulong h = e;

  c[e] = (((long)(h < b)) ? (a[e]) : ((double)0));
  barrier(1);

  for (uint i = g; i > 0; i >>= 1) {
    if (e < i)
      c[e] += c[e + i];

    barrier(1);
  }

  if (e == 0)
    d[0] = c[0];
}

__kernel __attribute__((vec_type_hint(double2))) void Q(__global const double2* a, const uint b, const ulong c, __local double2* d, __global double2* e) {
  const size_t f = get_global_id(0);
  const size_t g = get_local_id(0);
  const size_t h = get_local_size(0);
  const size_t i = get_group_id(0);
  const size_t j = get_num_groups(0);
  const size_t k = h / 2;

  double2 l = 0;
  for (uint m = 0; m < b; m++) {
    const ulong2 n = f + m * j * h;
    l += ((n < c) ? (a[n.s0]) : (0));
  }
  d[g] = l;
  barrier(1);

  for (uint m = k; m > 0; m >>= 1) {
    if (g < m)
      d[g] += d[g + m];

    barrier(1);
  }

  if (g == 0)
    e[i] = d[0];
}

__kernel __attribute__((vec_type_hint(double2))) void R(__global const double2* a, const ulong b, __local double2* c, __global double* d) {
  const size_t e = get_local_id(0);
  const size_t f = get_local_size(0);
  const size_t g = f / 2;
  const ulong2 h = e;

  c[e] = ((h < b) ? (a[e]) : (0));
  barrier(1);

  for (uint i = g; i > 0; i >>= 1) {
    if (e < i)
      c[e] += c[e + i];

    barrier(1);
  }

  if (e == 0)
    d[0] = c[0].s0 + c[0].s1;
}
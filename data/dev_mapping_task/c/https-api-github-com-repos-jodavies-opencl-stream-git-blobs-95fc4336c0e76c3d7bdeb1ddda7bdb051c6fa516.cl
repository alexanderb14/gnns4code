__kernel void A(__global double* restrict a, __global double* restrict b, __global double* restrict c) {
  size_t d = get_global_id(0);

  a[d] = 1.0;
  b[d] = 2.0;
  c[d] = 0.0;
}

__kernel void B(__global const double* restrict a, __global double* restrict b) {
  size_t c = get_global_id(0);

  b[c] = a[c];
}
__kernel void C(__global const double2* restrict a, __global double2* restrict b) {
  size_t c = get_global_id(0);

  b[c] = a[c];
}
__kernel void D(__global const double4* restrict a, __global double4* restrict b) {
  size_t c = get_global_id(0);

  b[c] = a[c];
}
__kernel void E(__global const double8* restrict a, __global double8* restrict b) {
  size_t c = get_global_id(0);

  b[c] = a[c];
}
__kernel void F(__global const double16* restrict a, __global double16* restrict b) {
  size_t c = get_global_id(0);

  b[c] = a[c];
}

__kernel void G(const double a, __global double* restrict b, __global const double* restrict c) {
  size_t d = get_global_id(0);

  b[d] = a * c[d];
}
__kernel void H(const double a, __global double2* restrict b, __global const double2* restrict c) {
  size_t d = get_global_id(0);

  b[d] = a * c[d];
}
__kernel void I(const double a, __global double4* restrict b, __global const double4* restrict c) {
  size_t d = get_global_id(0);

  b[d] = a * c[d];
}
__kernel void J(const double a, __global double8* restrict b, __global const double8* restrict c) {
  size_t d = get_global_id(0);

  b[d] = a * c[d];
}
__kernel void K(const double a, __global double16* restrict b, __global const double16* restrict c) {
  size_t d = get_global_id(0);

  b[d] = a * c[d];
}

__kernel void L(__global const double* restrict a, __global const double* restrict b, __global double* restrict c) {
  size_t d = get_global_id(0);

  c[d] = a[d] + b[d];
}
__kernel void M(__global const double2* restrict a, __global const double2* restrict b, __global double2* restrict c) {
  size_t d = get_global_id(0);

  c[d] = a[d] + b[d];
}
__kernel void N(__global const double4* restrict a, __global const double4* restrict b, __global double4* restrict c) {
  size_t d = get_global_id(0);

  c[d] = a[d] + b[d];
}
__kernel void O(__global const double8* restrict a, __global const double8* restrict b, __global double8* restrict c) {
  size_t d = get_global_id(0);

  c[d] = a[d] + b[d];
}
__kernel void P(__global const double16* restrict a, __global const double16* restrict b, __global double16* restrict c) {
  size_t d = get_global_id(0);

  c[d] = a[d] + b[d];
}

__kernel void Q(const double a, __global double* restrict b, __global const double* restrict c, __global const double* restrict d) {
  size_t e = get_global_id(0);

  b[e] = c[e] * a + d[e];
}
__kernel void R(const double a, __global double2* restrict b, __global const double2* restrict c, __global const double2* restrict d) {
  size_t e = get_global_id(0);

  b[e] = c[e] * a + d[e];
}
__kernel void S(const double a, __global double4* restrict b, __global const double4* restrict c, __global const double4* restrict d) {
  size_t e = get_global_id(0);

  b[e] = c[e] * a + d[e];
}
__kernel void T(const double a, __global double8* restrict b, __global const double8* restrict c, __global const double8* restrict d) {
  size_t e = get_global_id(0);

  b[e] = c[e] * a + d[e];
}
__kernel void U(const double a, __global double16* restrict b, __global const double16* restrict c, __global const double16* restrict d) {
  size_t e = get_global_id(0);

  b[e] = c[e] * a + d[e];
}
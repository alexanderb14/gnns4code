__attribute__((always_inline)) inline void A(__global float* a, __global float* b, __global float* c) {
  a[get_global_id(0) + 1] = get_global_id(0);
  b[get_global_id(0) + 1] = get_global_id(0);
  c[get_global_id(0) + 1] = get_global_id(0);
}

__attribute__((always_inline)) inline void B(__global float* a, __global float* b, __global float* c) {
  a[get_global_id(0) + 1] = get_global_id(0);
  b[get_global_id(0) + 1] = get_global_id(0);
  c[get_global_id(0) + 1] = get_global_id(0);
}

__kernel void C(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, __global float* f, int g) {
  __global float* h;

  if (g > 4) {
    h = a;
  } else {
    h = b;
  }

  h[get_global_id(0)] = get_global_id(0);

  A(c, d, e);
  A(e, f, d);

  B(c, c, e);
  B(e, d, e);
}
__kernel void A(__global double2* a, double2 b, uint c) {
  uint d = (uint)get_global_id(0);
  if (d < c) {
    a[d].s0 = b.s0;
    a[d].s1 = b.s1;
  }
}

__kernel void B(__global double2* a, __global double2* b, uint c) {
  uint d = (uint)get_global_id(0);
  if (d < c) {
    a[d].s0 = a[d].s0 + b[d].s0;
    a[d].s1 = a[d].s1 + b[d].s1;
  }
}

__kernel void C(double2 a, __global double2* b, __global double2* c, uint d) {
  uint e = (uint)get_global_id(0);
  if (e < d) {
    c[e].s0 = c[e].s0 + a.s0 * b[e].s0 - a.s1 * b[e].s1;
    c[e].s1 = c[e].s1 + a.s0 * b[e].s1 + a.s1 * b[e].s0;
  }
}

__kernel void D(__global double* a, __global double2* b, uint c) {
  uint d = (uint)get_global_id(0);
  if (d < c) {
    b[d].s0 = a[d] * b[d].s0;
    b[d].s1 = a[d] * b[d].s1;
  }
}

__kernel void E(double2 a, __global double2* b, double2 c, __global double2* d, __global double2* e, uint f) {
  uint g = (uint)get_global_id(0);
  if (g < f) {
    e[g].s0 = a.s0 * b[g].s0 - a.s1 * b[g].s1 + c.s0 * d[g].s0 - c.s1 * d[g].s1;

    e[g].s1 = a.s0 * b[g].s1 + a.s1 * b[g].s0 + c.s0 * d[g].s1 + c.s1 * d[g].s0;
  }
}

__kernel void F(double2 a, __global double* b, __global double2* c, __global double2* d, uint e, uint f) {
  uint g = (uint)get_global_id(0);
  if (g < e) {
    uint h = g / f;
    uint i = g - h * f;

    d[g].s0 = b[i] * (a.s0 * c[g].s0 - a.s1 * c[g].s1);
    d[g].s1 = b[i] * (a.s0 * c[g].s1 + a.s1 * c[g].s0);
  }
}

__kernel void G(__global double2* a, __global double* b, uint c) {
  uint d = (uint)get_global_id(0);
  if (d < c) {
    b[d] = a[d].s0;
  }
}
__kernel void A(__global double* a, __constant uint* b, __constant uint* c, __global double* d) {
  uint e = (uint)get_global_id(0);
  if (e < *b) {
    uint f = *c;
    uint g = e / f;
    a[e] *= d[g];
  }
}

__kernel void B(__global double2* a, __constant uint* b, __constant uint* c, __global double* d) {
  uint e = (uint)get_global_id(0);
  if (e < *b) {
    uint f = *c;
    uint g = e / f;
    a[e].s0 *= d[g];
    a[e].s1 *= d[g];
  }
}

__kernel void C(__global double* a, uint b) {
  uint c = (uint)get_global_id(0);
  if (c < b) {
    a[c + b] -= a[c];
  }
}

__kernel void D(__global double2* a, uint b) {
  uint c = (uint)get_global_id(0);
  if (c < b) {
    a[c + b].s0 -= a[c].s0;
    a[c + b].s1 -= a[c].s1;
  }
}

__kernel void E(__global double* a, uint b) {
  uint c = (uint)get_global_id(0);
  if (c < b) {
    a[c] = a[c + b];
  }
}

__kernel void F(__global double2* a, uint b) {
  uint c = (uint)get_global_id(0);
  if (c < b) {
    a[c].s0 = -a[c + b].s0;
    a[c].s1 = -a[c + b].s1;
  }
}
__kernel void A(__global double2* a, __global double2* b, __constant uint* c, __constant uint* d) {
  uint e = (uint)get_global_id(0);
  if (e < *d) {
    uint f = *c;
    uint g = e / f;
    uint h = e - g * f;

    uint i = f - h;
    if (h == 0) {
      i = 0;
    }

    uint j = i + g * f;

    a[e].s0 = -b[j].s0;
    a[e].s1 = b[j].s1;
  }
}

__kernel void B(__global double2* a, __global double* b, double c, uint d) {
  uint e = (uint)get_global_id(0);
  if (e < d) {
    a[e].s0 = cos(c * b[e]);
    a[e].s1 = sin(c * b[e]);
  }
}

__kernel void C(__global double2* a, __global double* b, double c, uint d) {
  uint e = (uint)get_global_id(0);
  if (e < d) {
    a[e].s0 = cos(c * b[e]);
    a[e].s1 = -sin(c * b[e]);
  }
}

__kernel void D(__global double2* a, __constant uint* b, __constant uint* c, __global double2* d) {
  uint e = (uint)get_global_id(0);
  if (e < *b) {
    uint f = *c;
    uint g = e / f;
    uint h = e - g * f;

    double i = a[e].s0;
    double j = a[e].s1;

    double k = d[h].s0;
    double l = d[h].s1;

    a[e].s0 = (i * k - j * l);
    a[e].s1 = (i * l + j * k);
  }
}
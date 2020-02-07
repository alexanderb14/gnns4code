__kernel void A(__global int* a, __global int* b, __global int* c, __global uint* d) {
  size_t e = get_global_id(0);
  size_t f = get_global_size(0);
  if (e + 1 < f)
    vstore3(((vload3(e, d)) ? (vload3(e, c)) : (vload3(e, b))), e, a);
  else if (e + 1 == f) {
    size_t g = 1 + (f & 1);
    int3 h, i;
    uint3 j;
    switch (g) {
      case 2:
        h.y = b[3 * e + 1];
        i.y = c[3 * e + 1];
        j.y = d[3 * e + 1];

      case 1:
        h.x = b[3 * e];
        i.x = c[3 * e];
        j.x = d[3 * e];
        break;
    }
    h = ((j) ? (i) : (h));
    switch (g) {
      case 2:
        a[3 * e + 1] = h.y;

      case 1:
        a[3 * e] = h.x;
        break;
    }
  }
}
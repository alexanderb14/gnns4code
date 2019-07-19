__kernel void A(__global unsigned int* a) {
  uint b = (uint)get_global_id(0);
  uint c = (uint)get_global_id(1);
  uint d = (uint)get_global_id(2);
  uint e = (uint)get_global_size(0);
  uint f = (uint)get_global_size(1);

  a[d * e * f + c * e + b] = d * e * f + c * e + b;
}

struct xyz {
  unsigned short b;
  unsigned short e;
  unsigned int o;
};

__kernel void B(__global struct xyz* a, __global unsigned int* b, unsigned int c, unsigned int d) {
  uint e = (uint)get_global_id(0);
  if (e >= c)
    return;
  struct xyz f = a[e];
  for (unsigned g = f.b; g <= f.e; g++)
    b[f.o + g] = d;
}
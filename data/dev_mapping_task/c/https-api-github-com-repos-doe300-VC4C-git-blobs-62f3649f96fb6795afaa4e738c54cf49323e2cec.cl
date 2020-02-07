__kernel void A(__global uint* a, uint b, uint c, uint d, uint e, uint f) {
  uint g = 0;
  if (get_global_id(0) >= b)
    g = 64;
  if (get_global_id(1) >= c)
    g = 128;
  if (get_global_id(2) >= d)
    g = 256;

  unsigned int h = (unsigned int)get_global_id(2) * (unsigned int)c * (unsigned int)b + (unsigned int)get_global_id(1) * (unsigned int)b + (unsigned int)get_global_id(0);
  if ((h >= e) && (h < f))
    atom_add(&a[h - e], 1u);
  if (g)
    atom_or(&a[h - e], g);
}

__kernel void B(__global uint* a)

{
  a[get_global_id(0)] = 0;
}
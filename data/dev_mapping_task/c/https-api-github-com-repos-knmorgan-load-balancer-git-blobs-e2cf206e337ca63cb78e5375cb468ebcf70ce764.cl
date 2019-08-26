__kernel void A(__global unsigned long* a, __global unsigned long* b, const unsigned long c, const unsigned long d, __local unsigned long* e) {
  unsigned int f = get_local_size(0) * get_group_id(0) + get_local_id(0);
  unsigned int g = get_local_id(0);
  e[g] = 0;
  if (f < c)
    e[g] = a[f];
  e[get_local_size(0) + g] = a[f + get_local_size(0)];

  barrier(1);
  unsigned int h = get_local_size(0);
  while (h > 0) {
    if (g < h)
      e[g] += e[g + h];
    h = h / 2;
    barrier(1);
  }

  if (g == 0)
    b[get_group_id(0)] = e[0];
}
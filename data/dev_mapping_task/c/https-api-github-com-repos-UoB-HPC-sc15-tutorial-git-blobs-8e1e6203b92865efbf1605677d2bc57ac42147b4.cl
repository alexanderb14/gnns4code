kernel void A(const unsigned a, global TYPE* b, global TYPE* c, global TYPE* d, global TYPE* e) {
  size_t f = get_global_id(0);

  e[f] = (TYPE)0.0;
  for (int g = 0; g < a; g++) {
    if (f != g)
      e[f] += b[f * a + g] * d[g];
  }
  e[f] = (c[f] - e[f]) / b[f * a + f];
}

kernel void B(global TYPE* a, global TYPE* b, local TYPE* c, global TYPE* d) {
  size_t e = get_global_id(0);
  TYPE f;

  f = b[e] - a[e];
  c[get_local_id(0)] = f * f;

  barrier(1);

  for (int g = get_local_size(0) / 2; g > 0; g /= 2) {
    if (get_local_id(0) < g) {
      c[get_local_id(0)] += c[get_local_id(0) + g];
    }
    barrier(1);
  }
  if (get_local_id(0) == 0) {
    d[get_group_id(0)] = c[0];
  }
}
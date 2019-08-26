kernel void A(const unsigned a, global const TYPE* restrict b, global const TYPE* restrict c, global const TYPE* restrict d, global TYPE* restrict e, local TYPE* restrict f) {
  size_t g = get_group_id(0);
  size_t h = get_local_id(0);
  size_t i = get_local_size(0);

  TYPE j = (TYPE)0.0;
  for (int k = h; k < a;) {
    j += b[g * a + k] * d[k] * (TYPE)(g != k);
    k += i;
    j += b[g * a + k] * d[k] * (TYPE)(g != k);
    k += i;
    j += b[g * a + k] * d[k] * (TYPE)(g != k);
    k += i;
    j += b[g * a + k] * d[k] * (TYPE)(g != k);
    k += i;
  }

  f[h] = j;
  barrier(1);
  for (int l = i / 2; l > 0; l /= 2) {
    if (h < l)
      f[h] += f[h + l];
    barrier(1);
  }
  if (h == 0)
    e[g] = (c[g] - f[0]) / b[g * a + g];
}

kernel void B(global const TYPE* restrict a, global const TYPE* restrict b, local TYPE* restrict c, global TYPE* restrict d) {
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
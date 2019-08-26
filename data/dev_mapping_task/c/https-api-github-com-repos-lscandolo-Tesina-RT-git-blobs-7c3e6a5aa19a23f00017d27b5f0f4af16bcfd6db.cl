void kernel A(global unsigned int* a, global unsigned int* b, local unsigned int* c, unsigned int d, global unsigned int* e) {
  int f = get_global_size(0);
  int g = get_local_size(0);
  int h = get_group_id(0);

  int i = h * g * 2;

  if (h == get_num_groups(0) - 1) {
    int j = get_global_id(0);
    int k = get_local_id(0);

    a += i;
    e += i;

    int l = k;
    int m = k + g;
    int n = (((l) >> 5) + ((l) >> (2 * 5)));
    int o = (((m) >> 5) + ((m) >> (2 * 5)));

    if (i + l < d)
      c[l + n] = a[l];
    else
      c[l + n] = 0;

    if (i + m < d)
      c[m + o] = a[m];
    else
      c[m + o] = 0;

    int p = 1;

    for (int q = g; q > 0; q >>= 1) {
      barrier(1);

      if (k < q) {
        int l = p * (2 * k + 1) - 1;
        int m = l + p;
        l += (((l) >> 5) + ((l) >> (2 * 5)));
        m += (((m) >> 5) + ((m) >> (2 * 5)));
        c[m] += c[l];
      }
      p <<= 1;
    }
    barrier(1);

    if (k == 0) {
      int r = g * 2 - 1 + (((g * 2 - 1) >> 5) + ((g * 2 - 1) >> (2 * 5)));
      b[h] = c[r];
      c[r] = 0;
    }

    for (int q = 1; q < g << 1; q <<= 1) {
      p >>= 1;
      barrier(1);
      if (k < q) {
        int l = p * (2 * k + 1) - 1;
        int m = l + p;
        l += (((l) >> 5) + ((l) >> (2 * 5)));
        m += (((m) >> 5) + ((m) >> (2 * 5)));
        int s = c[l];
        c[l] = c[m];
        c[m] += s;
      }
    }
    barrier(1);

    if (i + l <= d)
      e[l] = c[l + n];

    if (i + m <= d)
      e[m] = c[m + o];

  } else {
    int j = get_global_id(0);
    int k = get_local_id(0);

    a += i;
    e += i;

    int l = k;
    int m = k + g;
    int n = (((l) >> 5) + ((l) >> (2 * 5)));
    int o = (((m) >> 5) + ((m) >> (2 * 5)));

    c[l + n] = a[l];
    c[m + o] = a[m];

    int p = 1;

    for (int q = g; q > 0; q >>= 1) {
      barrier(1);

      if (k < q) {
        int l = p * (2 * k + 1) - 1;
        int m = l + p;
        l += (((l) >> 5) + ((l) >> (2 * 5)));
        m += (((m) >> 5) + ((m) >> (2 * 5)));
        c[m] += c[l];
      }
      p <<= 1;
    }
    barrier(1);

    if (k == 0) {
      int r = g * 2 - 1 + (((g * 2 - 1) >> 5) + ((g * 2 - 1) >> (2 * 5)));
      b[h] = c[r];
      c[r] = 0;
    }

    for (int q = 1; q < g << 1; q <<= 1) {
      p >>= 1;
      barrier(1);
      if (k < q) {
        int l = p * (2 * k + 1) - 1;
        int m = l + p;
        l += (((l) >> 5) + ((l) >> (2 * 5)));
        m += (((m) >> 5) + ((m) >> (2 * 5)));
        int s = c[l];
        c[l] = c[m];
        c[m] += s;
      }
    }
    barrier(1);

    e[l] = c[l + n];
    e[m] = c[m + o];
  }
}

void kernel B(global unsigned int* a, global unsigned int* b, unsigned int c)

{
  size_t d = get_global_id(0);
  size_t e = get_local_id(0);

  local unsigned int f;
  if (e == 0) {
    if (d >= c)
      f = b[d / c];
    else
      f = 0;
  }
  barrier(1);

  a[d] += f;
}
constant size_t Ga = 2; constant size_t Gb = 2; kernel void A(global uint* a, const uint b, local uint* c, global uint* d, const uint e, const uint f, global uint* g, const uint h, global uint* i) {
  size_t j = get_local_id(0);
  size_t k = get_group_id(0);
  size_t l = get_local_size(0);

  size_t m = l * Ga;

  size_t n = k * m;

  size_t o = Ga * j;
  if (f == 0) {
    c[o] = a[n + o];
    c[o + 1] = a[n + o + 1];
  } else {
    c[o] = !(a[n + o] & f);
    c[o + 1] = !(a[n + o + 1] & f);
  }

  int p = 1;

  size_t q = j * 2;

  for (int r = m >> 1; r > 0; r >>= 1) {
    barrier(1);

    if (j < r) {
      int s = p * (q + 1) - 1;
      int t = p * (q + 2) - 1;

      c[t] += c[s];
    }

    p *= 2;
  }

  barrier(1);

  if (get_local_id(0) == 0) {
    if (e) {
      d[k] = c[m - 1];
    }

    c[m - 1] = 0;
  }

  for (int r = 1; r < m; r *= 2) {
    p >>= 1;

    barrier(1);

    if (j < r) {
      int s = p * (q + 1) - 1;
      int t = p * (q + 2) - 1;

      uint u = c[s];
      c[s] = c[t];
      c[t] += u;
    }
  }

  barrier(1);

  if (get_global_id(0) == 0) {
    if (h) {
      uint v = b - 1;

      i[0] = !(a[v] & f) + c[v];
    }
  }

  g[n + o] = c[o];
  g[n + o + 1] = c[o + 1];
}

kernel void B(global uint* a, global uint* b, global uint* c, const uint d, const uint e, const uint f, global uint* g) {
  size_t h = get_local_id(0);
  size_t i = get_group_id(0);
  size_t j = get_local_size(0);

  size_t k = i * j * Gb;

  size_t l = Gb * h;

  a[k + l] += b[i];
  a[k + l + 1] += b[i];

  barrier(2);

  if ((get_local_id(0) == 0) && (i == (get_num_groups(0) - 1))) {
    if (f) {
      uint m = d - 1;

      g[0] = !(c[m] & e) + a[m];
    }
  }
}

kernel void C(global uint* a, const uint b, global uint* c, global uint* d, const uint e, global uint* f) {
  size_t g = get_local_id(0);
  size_t h = get_group_id(0);
  size_t i = get_local_size(0);

  size_t j = h * i * Gb;

  size_t k = Gb * g;

  size_t l = j + k;
  size_t m = j + k + 1;

  size_t n = c[l];
  size_t o = c[m];

  uint p = d[0];

  uint q = l - n + p;
  uint r = m - o + p;

  uint s = (a[l] & e) ? q : n;
  uint t = (a[m] & e) ? r : o;

  uint u = b - 1;

  if (l <= u) {
    f[s] = a[l];

    if (m <= u) {
      f[t] = a[m];

      {
        {}
      }
    }
  }
}
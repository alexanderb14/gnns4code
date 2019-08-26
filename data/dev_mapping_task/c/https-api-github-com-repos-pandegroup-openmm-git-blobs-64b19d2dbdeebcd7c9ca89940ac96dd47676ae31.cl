unsigned int A(__local unsigned int* a) {
  int b = get_local_id(0);
  if (b < 64)
    a[b] += a[b + 64];
  barrier(1);
  if (b < 32)
    a[b] += a[b + 32];
  barrier(1);
  if (b < 16)
    a[b] += a[b + 16];
  barrier(1);
  if (b < 8)
    a[b] += a[b + 8];
  barrier(1);
  if (b < 4)
    a[b] += a[b + 4];
  barrier(1);
  if (b < 2)
    a[b] += a[b + 2];
  barrier(1);
  if (b < 1)
    a[b] += a[b + 1];

  barrier(1);
  return a[0];
}

__kernel void B(__global unsigned int* restrict a, __global const unsigned int* restrict b, const unsigned int c, __local unsigned int* restrict d) {
  d[get_local_id(0)] = 0;
  unsigned int e;
  const unsigned int f = c / get_num_groups(0) + ((c % get_num_groups(0)) ? 1 : 0);
  e = (c < (get_group_id(0) + 1) * f) ? c : ((get_group_id(0) + 1) * f);
  for (int g = get_group_id(0) * f; g < (get_group_id(0) + 1) * f; g += get_local_size(0)) {
    if ((g + get_local_id(0)) < e && b[g + get_local_id(0)])
      d[get_local_id(0)]++;
  }
  barrier(1);
  unsigned int h = A(d);
  if (get_local_id(0) == 0)
    a[get_group_id(0)] = h;
  return;
}

int C(__local const unsigned int* a, __local unsigned int* b) {
  const int c = 128;

  __local unsigned int* d = b;
  int e = 1, f = 0;

  int g = get_local_id(0);
  d[e * c + get_local_id(0)] = (get_local_id(0) > 0) ? a[get_local_id(0) - 1] : 0;
  barrier(1);

  for (int h = 1; h < c; h *= 2) {
    e = 1 - e;
    f = 1 - e;
    barrier(1);
    d[e * c + get_local_id(0)] = d[f * c + get_local_id(0)];
    if (get_local_id(0) >= h)
      d[e * c + get_local_id(0)] += d[f * c + get_local_id(0) - h];
  }

  barrier(1);
  return b[127] + a[127];
}

int D(__local const unsigned int* a, __local const unsigned int* b, __local unsigned int* c, __local unsigned int* d) {
  int e = C(b, d);
  int f = get_local_id(0);
  if (b[get_local_id(0)])
    c[d[get_local_id(0)]] = a[get_local_id(0)];
  return e;
}

__kernel void E(__global const unsigned int* restrict a, __global unsigned int* restrict b, __global const unsigned int* restrict c, __global const unsigned int* restrict d, unsigned int e, __global unsigned int* restrict f, __local unsigned int* restrict g, __local unsigned int* restrict h, __local unsigned int* restrict i) {
  __local unsigned int j[256];
  int k = 0;

  int l = get_local_id(0);
  for (int m = 0; m < get_group_id(0); m += get_local_size(0)) {
    if ((m + get_local_id(0)) < get_group_id(0)) {
      h[get_local_id(0)] = d[m + get_local_id(0)];
    } else {
      h[get_local_id(0)] = 0;
    }
    barrier(1);

    k += A(h);
    barrier(1);
  }

  unsigned int n;
  const unsigned int o = e / get_num_groups(0) + ((e % get_num_groups(0)) ? 1 : 0);
  n = (e < (get_group_id(0) + 1) * o) ? e : ((get_group_id(0) + 1) * o);
  for (int m = get_group_id(0) * o; m < (get_group_id(0) + 1) * o; m += get_local_size(0)) {
    if ((m + get_local_id(0)) < n) {
      h[get_local_id(0)] = c[m + get_local_id(0)];
      g[get_local_id(0)] = a[m + get_local_id(0)];
    } else {
      h[get_local_id(0)] = 0;
    }
    barrier(1);
    int p = D(g, h, i, j);
    barrier(1);
    if (get_local_id(0) < p) {
      b[k + get_local_id(0)] = i[get_local_id(0)];
    }
    k += p;
  }
  if (get_group_id(0) == (get_num_groups(0) - 1) && get_local_id(0) == 0) {
    *f = k;
  }
}
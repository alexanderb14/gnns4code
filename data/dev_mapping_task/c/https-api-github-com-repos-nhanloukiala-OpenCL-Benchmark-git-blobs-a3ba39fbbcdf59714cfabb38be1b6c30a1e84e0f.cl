__kernel void A(__global const uint* a, __global uint* b, uint c, __local uint* d) {
  size_t e = get_local_id(0);
  size_t f = get_global_id(0);
  size_t g = get_group_id(0);
  size_t h = get_local_size(0);

  d[e] = 0;
  barrier(1);

  uint i = (a[f] >> c) & 0xFFU;
  atomic_add(d + i, 1);

  barrier(1);

  uint j = g * h + e;
  b[j] = d[e];
}

__kernel void B(__global const uint* a, __global const uint* b, uint c, __local ushort* d, __global uint* e) {
  size_t f = get_group_id(0);
  size_t g = get_local_id(0);
  size_t h = get_global_id(0);
  size_t i = get_local_size(0);

  for (int j = 0; j < (1 << 8); ++j) {
    uint k = f * (1 << 8) * i + g * (1 << 8) + j;
    d[g * (1 << 8) + j] = b[k];
  }

  barrier(1);

  for (int j = 0; j < (1 << 8); ++j) {
    uint l = a[h * (1 << 8) + j];
    l = (l >> c) & 0xFFU;
    uint m = d[g * (1 << 8) + l];
    e[m] = a[h * (1 << 8) + j];
    d[g * (1 << 8) + l] = m + 1;
    barrier(1);
  }
}

__kernel void C(__global uint* a, __global uint* b, __local uint* c, const uint d, __global uint* e) {
  int f = get_local_id(0);
  int g = get_global_id(0);
  int h = get_global_id(1);
  int i = get_group_id(0);
  int j = get_group_id(1);

  int k = (g << 8) + h;
  int l = j * (get_global_size(0) / d) + i;

  c[f] = b[k];
  barrier(1);

  uint m = c[0];
  for (int n = 1; n < d; n <<= 1) {
    if (f >= n) {
      m = c[f - n] + c[f];
    }
    barrier(1);

    c[f] = m;
    barrier(1);
  }

  if (f == 0) {
    e[l] = c[d - 1];
    a[k] = 0;
  } else {
    a[k] = c[f - 1];
  }
}

__kernel void D(__global uint* a, __global uint* b, __local uint* c, const uint d) {
  int e = get_local_id(0);
  int f = get_global_id(0);
  int g = get_group_id(0);

  c[e] = b[f];

  uint h = c[0];

  for (int i = 1; i < d; i <<= 1) {
    if (e >= i) {
      h = c[e - i] + c[e];
    }
    barrier(1);

    c[e] = h;
    barrier(1);
  }

  if (e == 0) {
    a[f] = 0;
  } else {
    a[f] = c[e - 1];
  }
}

__kernel void E(__global uint* a, __global uint* b, __global uint* c, int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  int g = f * d + e;
  a[g] = 0;

  if (e > 0) {
    for (int h = 0; h < e; h++)
      a[g] += b[f * d + h];
  }

  if (e == (d - 1))
    c[f] = a[g] + b[f * d + (d - 1)];
}

__kernel void F(__global uint* a, __global uint* b, uint c) {
  int d = get_global_id(0);
  int e = get_global_id(1);
  int f = get_group_id(0);
  int g = get_group_id(1);

  int h = e + (d << 8);

  int i = g * c + f;

  uint j;
  j = a[i];

  b[h] += j;
}

__kernel void G(__global uint* a, __global uint* b) {
  int c = get_global_id(0);
  int d = get_global_id(1);
  int e = d + (c << 8);
  b[e] += a[d];
}
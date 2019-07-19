int A(volatile __local uint* a, uint b, uint c) {
  uint d;

  do {
    d = a[b] & 0x07FFFFFFU;
    d = c | (d + 1);
    a[b] = d;
  } while (a[b] != d);

  return (d & 0x07FFFFFFU) - 1;
}

__kernel void B(global float* a, global int* b, global uint* c, const int d, global float* e) {
  volatile __local uint f[((1 << 10) * (1))];

  const uint g = get_local_id(0) << (32 - (5));
  const int h = (get_local_id(0) >> (5)) * (1 << 10);
  const int i = get_global_size(0);
  for (int j = get_local_id(0); j < ((1 << 10) * (1)); j += get_local_size(0))
    f[j] = 0;

  barrier(1 | 2);

  for (int k = get_global_id(0); k < d; k += i) {
    float l = a[k];

    int m = (1 << 10) / 2 - 1;
    int n = (1 << 10) / 4;
    float o = e[m];

    while (n >= 1) {
      m = (l < o) ? (m - n) : (m + n);
      o = e[m];
      n /= 2;
    }
    m = (l < o) ? m : (m + 1);

    b[k] = (A(f + h, m, g) << (10)) + m;
  }

  barrier(1 | 2);

  int p = get_group_id(0) * ((1 << 10) * (1));

  for (int j = get_local_id(0); j < ((1 << 10) * (1)); j += get_local_size(0))
    c[p + j] = f[j] & 0x07FFFFFFU;
}

__kernel void C(global uint* a, global uint* b, const int c) {
  int d = get_global_id(0);
  int e = c * ((1 << 10) * (1));
  int f = 0;

  for (int g = d; g < e; g += (1 << 10)) {
    int h = a[g];
    a[g] = f;
    f += h;
  }

  b[d] = f;
}

__kernel void D(global float* a, global int* b, __global float* c, const int d, global uint* e, global uint* f) {
  volatile __local unsigned int g[((1 << 10) * (1))];

  int h = get_group_id(0) * ((1 << 10) * (1));
  const int i = (get_local_id(0) >> (5)) * (1 << 10);
  const int j = get_global_size(0);

  for (int k = get_local_id(0); k < ((1 << 10) * (1)); k += get_local_size(0)) {
    g[k] = f[k & ((1 << 10) - 1)] + e[h + k];
  }

  barrier(1 | 2);

  for (int l = get_global_id(0); l < d; l += j) {
    float m = a[l];
    int n = b[l];
    c[g[i + (n & ((1 << 10) - 1))] + (n >> (10))] = m;
    int o = g[i + (n & ((1 << 10) - 1))] + (n >> (10));
  }
}
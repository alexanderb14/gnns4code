uint A(uint a, __local uint* b, int c) {
  int d = get_local_id(0);
  int e = get_local_size(0);
  b[d] = 0;

  d += e;
  b[d] = a;
  barrier(1);

  uint f;
  for (int g = 1; g < e; g *= 2) {
    f = b[d - g];
    barrier(1);
    b[d] += f;
    barrier(1);
  }
  return b[d - c];
}

__kernel __attribute__((reqd_work_group_size(256, 1, 1))) void B(__global uint* a, const int b, __local uint* c) {
  __local int d;
  d = 0;
  barrier(1);

  int e = (get_local_id(0) < b && (get_local_id(0) + 1) == b) ? 1 : 0;

  for (int f = 0; f < 16; f++) {
    uint g = 0;

    if (get_local_id(0) < b) {
      g = a[(b * f) + get_local_id(0)];
    }

    uint h = A(g, c, 1);

    if (get_local_id(0) < b) {
      a[(b * f) + get_local_id(0)] = h + d;
    }

    if (e) {
      d += h + g;
    }
    barrier(1);
  }
}

__kernel __attribute__((reqd_work_group_size(256, 1, 1))) void C(__global const uint* a, __global uint* b, int4 c) {
  __local uint d[256 * 16];

  uint e = get_global_id(0);
  uint f = get_local_id(0);
  uint g = get_group_id(0);
  uint h = get_local_size(0);

  const int i = c.z;
  const int j = 1024;
  const int k = c.x;
  const int l = k + j - (k % j);

  const int m = c.y;
  const int n = c.w;

  for (int o = 0; o < 16; o++) {
    d[o * get_local_size(0) + f] = 0;
  }
  barrier(1);

  const int p = 4 * 256;

  int q = (l) / p - n * g;
  int r = p * n * g + f;
  for (int s = 0; s < min(n, q); s++) {
    for (int o = 0; o < 4; o++, r += 256) {
      if ((r) < k)

      {
        uint t = (a[r] >> i) & 0xFU;

        d[t * get_local_size(0) + f]++;
      }
    }
  }

  barrier(1);
  if (f < 16) {
    uint u = 0;
    for (int o = 0; o < get_local_size(0); o++) {
      u += d[f * get_local_size(0) + o];
    }
    b[f * get_num_groups(0) + get_group_id(0)] = u;
  }
}

__kernel __attribute__((reqd_work_group_size(256, 1, 1))) void D(__global const uint* a, __global uint* b, int4 c) {
  __local uint d[256 * 16];

  uint e = get_global_id(0);
  uint f = get_local_id(0);
  uint g = get_group_id(0);
  uint h = get_local_size(0);

  const int i = c.z;
  const int j = 1024;
  const int k = c.x;
  const int l = k + j - (k % j);

  const int m = c.y;
  const int n = c.w;

  for (int o = 0; o < 16; o++) {
    d[o * get_local_size(0) + f] = 0;
  }
  barrier(1);

  const int p = 4 * 256;

  int q = (l) / p - n * g;
  int r = p * n * g + f;
  for (int s = 0; s < min(n, q); s++) {
    for (int o = 0; o < 4; o++, r += 256) {
      if ((r) < k)

      {
        uint t = (a[r] >> i);
        uint u = t & (1 << 3);

        t = 0xF - ((((t & 0x7) ^ 0x7) & 0x7) | u);

        d[t * get_local_size(0) + f]++;
      }
    }
  }

  barrier(1);
  if (f < 16) {
    uint v = 0;
    for (int o = 0; o < get_local_size(0); o++) {
      v += d[f * get_local_size(0) + o];
    }
    b[f * get_num_groups(0) + get_group_id(0)] = v;
  }
}

__kernel __attribute__((reqd_work_group_size(256, 1, 1))) void E(__global const uint* a, __global uint* b, int4 c) {
  __local uint d[256 * 16];

  uint e = get_global_id(0);
  uint f = get_local_id(0);
  uint g = get_group_id(0);
  uint h = get_local_size(0);

  const int i = c.z;
  const int j = 1024;
  const int k = c.x;
  const int l = k + j - (k % j);

  const int m = c.y;
  const int n = c.w;

  for (int o = 0; o < 16; o++) {
    d[o * get_local_size(0) + f] = 0;
  }
  barrier(1);

  const int p = 4 * 256;

  int q = (l) / p - n * g;
  int r = p * n * g + f;
  for (int s = 0; s < min(n, q); s++) {
    for (int o = 0; o < 4; o++, r += 256) {
      if ((r) < k)

      {
        uint t = (a[r] >> i) & 0xFU;

        d[(16 - t - 1) * get_local_size(0) + f]++;
      }
    }
  }

  barrier(1);
  if (f < 16) {
    uint u = 0;
    for (int o = 0; o < get_local_size(0); o++) {
      u += d[f * get_local_size(0) + o];
    }
    b[f * get_num_groups(0) + get_group_id(0)] = u;
  }
}

__kernel __attribute__((reqd_work_group_size(256, 1, 1))) void F(__global const uint* a, __global uint* b, int4 c) {
  __local uint d[256 * 16];

  uint e = get_global_id(0);
  uint f = get_local_id(0);
  uint g = get_group_id(0);
  uint h = get_local_size(0);

  const int i = c.z;
  const int j = 1024;
  const int k = c.x;
  const int l = k + j - (k % j);

  const int m = c.y;
  const int n = c.w;

  for (int o = 0; o < 16; o++) {
    d[o * get_local_size(0) + f] = 0;
  }
  barrier(1);

  const int p = 4 * 256;

  int q = (l) / p - n * g;
  int r = p * n * g + f;
  for (int s = 0; s < min(n, q); s++) {
    for (int o = 0; o < 4; o++, r += 256) {
      if ((r) < k)

      {
        uint t = (a[r] >> i);
        uint u = t & (1 << 3);

        t = 0xF - ((((t & 0x7) ^ 0x7) & 0x7) | u);

        d[(16 - t - 1) * get_local_size(0) + f]++;
      }
    }
  }

  barrier(1);
  if (f < 16) {
    uint v = 0;
    for (int o = 0; o < get_local_size(0); o++) {
      v += d[f * get_local_size(0) + o];
    }
    b[f * get_num_groups(0) + get_group_id(0)] = v;
  }
}
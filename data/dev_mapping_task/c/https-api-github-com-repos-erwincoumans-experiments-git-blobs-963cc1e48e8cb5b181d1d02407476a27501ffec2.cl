typedef unsigned int u32; u32 A(__local u32* a, u32 b, int c, int d) {
  u32 e;
  int f = 1;
  for (int g = b >> 1; g > 0; g >>= 1, f <<= 1) {
    barrier(1);
    for (int h = c; h < g; h += d) {
      int i = f * (2 * h + 1) - 1;
      int j = f * (2 * h + 2) - 1;
      a[j] += a[i];
    }
  }

  barrier(1);

  if (c == 0) {
    e = a[b - 1];
    a[b - 1] = 0;
  }

  barrier(1);

  f >>= 1;
  for (int g = 1; g < b; g <<= 1, f >>= 1) {
    barrier(1);
    for (int h = c; h < g; h += d) {
      int i = f * (2 * h + 1) - 1;
      int j = f * (2 * h + 2) - 1;
      u32 k = a[i];
      a[i] = a[j];
      a[j] += k;
    }
  }
  barrier(1);

  return e;
}

__attribute__((reqd_work_group_size(128, 1, 1))) __kernel void B(__global u32* a, __global u32* b, __global u32* c, uint4 d) {
  __local u32 e[128 * 2];

  int f = get_global_id(0);
  int g = get_local_id(0);

  e[2 * g] = (2 * f < d.x) ? b[2 * f] : 0;
  e[2 * g + 1] = (2 * f + 1 < d.x) ? b[2 * f + 1] : 0;

  u32 h = A(e, 128 * 2, get_local_id(0), get_local_size(0));

  if (g == 0)
    c[get_group_id(0)] = h;

  if ((2 * f) < d.x) {
    a[2 * f] = e[2 * g];
  }
  if ((2 * f + 1) < d.x) {
    a[2 * f + 1] = e[2 * g + 1];
  }
}

__attribute__((reqd_work_group_size(128, 1, 1))) __kernel void C(__global u32* a, __global u32* b, uint4 c) {
  const u32 d = 128 * 2;

  int e = get_group_id(0) + 1;
  int f = get_local_id(0);

  u32 g = b[e];

  int h = min((e + 1) * (d), c.x);
  for (int i = e * d + f; i < h; i += get_local_size(0)) {
    a[i] += g;
  }
}

__attribute__((reqd_work_group_size(128, 1, 1))) __kernel void D(__global u32* a, uint4 b) {
  __local u32 c[2048];
  int d = get_global_id(0);
  int e = get_local_id(0);
  int f = get_local_size(0);

  for (int g = e; g < b.z; g += f) {
    c[g] = (g < b.y) ? a[g] : 0;
  }

  barrier(1);

  u32 h = A(c, b.z, get_local_id(0), get_local_size(0));

  for (int g = e; g < b.y; g += f) {
    a[g] = c[g];
  }

  if (d == 0) {
    a[b.y] = h;
  }
}
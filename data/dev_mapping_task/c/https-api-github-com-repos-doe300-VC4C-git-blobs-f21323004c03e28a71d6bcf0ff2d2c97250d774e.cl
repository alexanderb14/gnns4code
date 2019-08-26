uchar A(uchar a, constant const uint* b, constant const uint* c, int d) {
  if (a < b[0])
    return a;

  if (a >= b[d - 1])
    return a;

  int e = 0;
  while (e < d - 1 && a >= b[e + 1])
    e++;

  return c[e];
}

uchar B(uchar a, constant const float* b, constant const float* c, int d) {
  if (a < b[0])
    return a;

  if (a >= b[d - 1])
    return a;

  int e = 0;
  while (e < d - 1 && a > b[e])
    e++;

  if (e > 0)
    e--;

  float f = b[e + 1] - b[e];
  float g = c[e + 1] - c[e];
  float h = a - b[e];
  float i = h / f * g;

  return c[e] + i;
}

kernel void C(global const uchar* a, global uchar* b, int c, int d, int e, constant const uint* f, constant const uint* g, int h) {
  const int i = get_global_id(0) * 4;
  const int j = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);

  if (4 > 1 && i + 4 > e) {
    for (int k = i; k < e; k++)
      b[j * d + k] = A(a[j * c + k], f, g, h);

    return;
  }

  for (int k = i; k < i + 4; k++)
    b[j * d + k] = A(a[j * c + k], f, g, h);
}

kernel void D(global const uchar* a, global uchar* b, int c, int d, int e, constant const float* f, constant const float* g, int h) {
  const int i = get_global_id(0) * 4;
  const int j = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);

  if (4 > 1 && i + 4 > e) {
    for (int k = i; k < e; k++)
      b[j * d + k] = B(a[j * c + k], f, g, h);

    return;
  }

  for (int k = i; k < i + 4; k++)
    b[j * d + k] = B(a[j * c + k], f, g, h);
}

kernel void E(global const uchar* a, global uchar* b, int c, int d, int e, constant const uchar* f) {
  const int g = get_global_id(0) * 4;
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);

  if (4 > 1 && g + 4 > e) {
    for (int i = g; i < e; i++)
      b[h * d + i] = f[a[h * c + i]];

    return;
  }

  for (int i = g; i < g + 4; i++)
    b[h * d + i] = f[a[h * c + i]];
}

__attribute__((reqd_work_group_size(16, 16, 1))) kernel void F(global const uchar* a, global uchar* b, int c, int d, constant const uchar* e) {
  const int f = get_global_id(0) * 4;
  const int g = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);

  const int h = get_local_id(1) * get_local_size(0) + get_local_id(0);
  local uchar i[256];
  i[h] = e[h];
  barrier(1);

  for (int j = f; j < f + 4; j++)
    b[g * d + j] = i[a[g * c + j]];
}
int A(int a, int b) {
  if (a < b)
    return a;
  else {
    int c = a % (2 * b);
    return min(c, 2 * b - 1 - c);
  }
}

__kernel __attribute__((reqd_work_group_size(8, 8, 1))) void B(__global float* a, unsigned int b, unsigned int c, unsigned int d) {
  const int2 e = (int2)(get_global_id(0), get_global_id(1));
  const int2 f = (int2)(get_local_id(0), get_local_id(1));

  __local float g[8][8];

  if (get_group_id(1) == 0) {
    g[f.y][f.x] = a[e.y * d + e.x + b];

    barrier(1);

    a[(f.y - 8) * d + e.x + b] = g[A(8 - 1 - f.y, c)][f.x];

  } else {
    g[f.y][f.x] = a[(c - 8 + f.y) * d + e.x + b];

    barrier(1);

    a[(c + f.y) * d + e.x + b] = g[A(c + f.y, c) - (c - 8)][f.x];
  }
}
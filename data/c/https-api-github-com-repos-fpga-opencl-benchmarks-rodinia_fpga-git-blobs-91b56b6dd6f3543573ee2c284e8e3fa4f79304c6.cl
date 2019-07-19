__kernel void A(int a, __global int* b, __global int* c, __global int* d, int e, int f, int g, int h, __local int* i, __local int* j) {
  int k = get_group_id(0);
  int l = get_local_id(0);

  int m = ((a) <= (f - g - 1) ? (a) : (f - g - 1));

  int n = 256 - (m * 1 * 2);

  int o = (n * k) - h;
  int p = o + 256 - 1;

  int q = o + l;

  int r = (o < 0) ? -o : 0;
  int s = (p > e - 1) ? 256 - 1 - (p - e + 1) : 256 - 1;

  int t = l - 1;
  int u = l + 1;

  t = (t < r) ? r : t;
  u = (u > s) ? s : u;

  bool v = ((l) >= (r) && (l) <= (s));

  if (((q) >= (0) && (q) <= (e - 1))) {
    i[l] = c[q];
  }

  barrier(1);

  bool w;
  for (int x = 0; x < m; x++) {
    w = false;

    if (((l) >= (x + 1) && (l) <= (256 - x - 2)) && v) {
      w = true;
      int y = i[t];
      int z = i[l];
      int aa = i[u];
      int ab = ((y) <= (z) ? (y) : (z));
      ab = ((ab) <= (aa) ? (ab) : (aa));

      int ac = e * (g + x) + q;
      j[l] = ab + b[ac];
    }

    barrier(1);

    if (x == m - 1) {
      break;
    }

    if (w) {
      i[l] = j[l];
    }
    barrier(1);
  }

  if (w) {
    d[q] = j[l];
  }
}
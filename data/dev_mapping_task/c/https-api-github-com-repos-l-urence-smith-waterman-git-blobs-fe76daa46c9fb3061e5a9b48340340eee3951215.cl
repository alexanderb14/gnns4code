enum direction { CENTER, NORTH, NORTH_WEST, WEST };

int A(char a, char b);

__kernel void B(__global int* a, __global int* b, __global int* c, __global int* d, __global int* e, __global char* f, __global char* g) {
  int h = get_global_id(0);
  int i = *c;
  int j = d[2 * h + 0];
  int k = d[2 * h + 1];

  int l, m;
  const int n = -1;
  for (l = j; l < *e + j; ++l) {
    int o = l + 1;
    for (m = k; m < *e + k; ++m) {
      int p = m + 1;
      int q = 0;
      int r = p + o * i;

      int s = a[(p - 1) + (o - 1) * i] + A(f[m], g[l]);
      if (s > q) {
        q = s;
        b[r] = NORTH_WEST;
      }

      int t = a[p + (o - 1) * i] + n;
      if (t > q) {
        q = t;
        b[r] = NORTH;
      }

      int u = a[(p - 1) + o * i] + n;
      if (u > q) {
        q = u;
        b[r] = WEST;
      }

      if (q == 0)
        b[r] = CENTER;

      a[r] = q;
    }
  }
}

int A(char a, char b) {
  const int c = 2;
  const int d = -1;
  if (a == b)
    return c;
  else
    return d;
}
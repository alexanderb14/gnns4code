typedef struct {
  int starting;
  int no_of_edges;
} Node;

__kernel void A(__global const Node* restrict a, __global int* restrict b, __global int* restrict c, __global int* restrict d, __global int* restrict e, __global int* restrict f, int g) {
  __private size_t h = get_global_id(0);

  if (h < g && c[h] != 0) {
    c[h] = 0;
    __private const unsigned int i = a[h].starting;
    __private const unsigned int j = a[h].no_of_edges + a[h].starting;
    __private unsigned int k[8];
    __private int l[8];

    __private const int m = f[h] + 1;
    __private int n, o;

    for (int p = i; p < j; p = p + 8) {
      if (p + 8 - 1 < j) {
        for (int q = 0; q < 8; q++) {
          k[q] = b[p + q];
          l[q] = -(!(e[k[q]]));
          f[k[q]] = ((m) & (l[q])) | ((f[k[q]]) & ~(l[q]));
          d[k[q]] = 1 & !(e[k[q]]);
        }
      } else {
        for (int q = p; q < j; q++) {
          n = b[q];
          o = -(!(e[n]));
          f[n] = ((m)&o) | ((f[n]) & ~o);
          d[n] = 1 & !(e[n]);
        }
      }
    }
  }
}

__kernel void B(__global int* restrict a, __global int* restrict b, __global int* restrict c, __global int* restrict d, int e) {
  unsigned int f = get_global_id(0);
  if (f < e && b[f] == 1) {
    a[f] = 1;
    c[f] = 1;
    *d = 1;
    b[f] = 0;
  }
}
typedef char mask_t; typedef struct {
  int starting;
  int no_of_edges;
} Node;
__kernel void A(__global const Node* restrict a, __global int* restrict b, __global mask_t* restrict c, __global mask_t* restrict d, __global mask_t* restrict e, __global int* restrict f, unsigned int g)

{
  __private size_t h = get_global_id(0);

  if (h < g && c[h] != 0) {
    c[h] = 0;

    __private const unsigned int i = a[h].starting;
    __private const unsigned int j = a[h].no_of_edges + a[h].starting;

    __private unsigned int k[8];
    __private mask_t l[8];

    __private int m;
    __private mask_t n;

    __private const int o = f[h] + 1;

    for (int p = i; p < j; p = p + 8) {
      if (p + 8 - 1 < j)

      {
        for (int q = 0; q < 8; q++) {
          k[q] = b[p + q];
          if (!e[k[q]]) {
            f[k[q]] = f[h] + 1;

            d[k[q]] = 1;
          }
        }
      }

      else {
        for (int q = p; q < j; q++) {
          m = b[q];
          if (!e[m]) {
            f[m] = f[h] + 1;
            d[m] = 1;
          }
        }
      }
    }
  }
}
__kernel void B(__global mask_t* restrict a, __global mask_t* restrict b, __global mask_t* restrict c, __global int* restrict d, unsigned int e) {
  unsigned int f = get_global_id(0);

  if (f < e && b[f] == 1) {
    a[f] = 1;
    c[f] = 1;

    *d = 1;

    b[f] = 0;
  }
}
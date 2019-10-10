typedef struct knode2 {
  int location;
  int indices[256 + 1];
  int keys[256 + 1];
  bool is_leaf;
  int num_keys;
} knode2;

__kernel void A(long a, __global knode2* b, long c, __global long* d, __global long* e, __global long* f, __global long* g, __global int* h, __global int* i, __global int* j, __global int* k, int l, int m) {
  int n = l;

  for (int o = 0; o < a; o++) {
    for (int p = 0; p < n; ++p) {
      for (int q = 0; q < m; q++) {
        if ((b[d[p]].keys[q] <= h[p]) && (b[d[p]].keys[q + 1] > h[p])) {
          if (b[d[p]].indices[q] < c) {
            e[p] = b[d[p]].indices[q];
            break;
          }
        }
      }

      d[p] = e[p];

      for (int q = 0; q < m; q++) {
        if ((b[f[p]].keys[q] <= i[p]) && (b[f[p]].keys[q + 1] > i[p])) {
          if (b[f[p]].indices[q] < c) {
            g[p] = b[f[p]].indices[q];
            break;
          }
        }
      }

      f[p] = g[p];
    }
  }

  for (int p = 0; p < l; ++p) {
    for (int q = 0; q < m; q++) {
      if (b[d[p]].keys[q] == h[p]) {
        j[p] = b[d[p]].indices[q];
        break;
      }
    }

    for (int q = 0; q < m; q++) {
      if (b[f[p]].keys[q] == i[p]) {
        k[p] = b[f[p]].indices[q] - j[p] + 1;
        break;
      }
    }
  }
}
typedef struct knode2 {
  int location;
  int indices[256 + 1];
  int keys[256 + 1];
  bool is_leaf;
  int num_keys;
} knode2;

__kernel void A(long a, __global knode2* b, long c, __global long* d, __global long* e, __global long* f, __global long* g, __global int* h, __global int* i, __global int* j, __global int* k, int l, int m) {
  for (int n = 0; n < l; ++n) {
    for (int o = 0; o < a; o++) {
      for (int p = 0; p < m; p++) {
        if ((b[d[n]].keys[p] <= h[n]) && (b[d[n]].keys[p + 1] > h[n])) {
          if (b[d[n]].indices[p] < c) {
            e[n] = b[d[n]].indices[p];
            break;
          }
        }
      }

      d[n] = e[n];

      for (int p = 0; p < m; p++) {
        if ((b[f[n]].keys[p] <= i[n]) && (b[f[n]].keys[p + 1] > i[n])) {
          if (b[f[n]].indices[p] < c) {
            g[n] = b[f[n]].indices[p];
            break;
          }
        }
      }

      f[n] = g[n];
    }

    for (int p = 0; p < m; p++) {
      if (b[d[n]].keys[p] == h[n]) {
        j[n] = b[d[n]].indices[p];
        break;
      }
    }

    for (int p = 0; p < m; p++) {
      if (b[f[n]].keys[p] == i[n]) {
        k[n] = b[f[n]].indices[p] - j[n] + 1;
        break;
      }
    }
  }
}
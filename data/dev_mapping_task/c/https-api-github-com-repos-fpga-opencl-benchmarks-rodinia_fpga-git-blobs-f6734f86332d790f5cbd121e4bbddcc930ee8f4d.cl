typedef struct record { int value; } record;

typedef struct knode {
  int location;
  int indices[256 + 1];
  int keys[256 + 1];
  bool is_leaf;
  int num_keys;
} knode;

__kernel void A(long a, __global knode* b, long c, __global record* d, __global long* e, __global long* f, __global int* g, __global record* h, int i, int j) {
  int k = i & (~1);

  for (int l = 0; l < a; l++) {
    for (int m = 0; m < k; m++) {
      for (int n = 0; n < j; n++) {
        if ((b[e[m]].keys[n]) <= g[m] && (b[e[m]].keys[n + 1] > g[m])) {
          if (b[f[m]].indices[n] < c) {
            f[m] = b[f[m]].indices[n];
            break;
          }
        }
      }
      e[m] = f[m];
    }

    int m = k;
    if (m < i) {
      for (int l = 0; l < a; l++) {
        for (int n = 0; n < j; n++) {
          if ((b[e[m]].keys[n]) <= g[m] && (b[e[m]].keys[n + 1] > g[m])) {
            if (b[f[m]].indices[n] < c) {
              f[m] = b[f[m]].indices[n];
              break;
            }
          }
        }
        e[m] = f[m];
      }
    }
  }

  for (int m = 0; m < i; m++) {
    for (int n = 0; n < j; n++) {
      if (b[e[m]].keys[n] == g[m]) {
        h[m].value = d[b[e[m]].indices[n]].value;
        break;
      }
    }
  }
}
typedef struct knode2 {
  int location;
  int indices[256 + 1];
  int keys[256 + 1];
  bool is_leaf;
  int num_keys;
} knode2;

__kernel void B(long a, __global knode2* b, long c, __global long* d, __global long* e, __global long* f, __global long* g, __global int* h, __global int* i, __global int* j, __global int* k, int l, int m) {
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
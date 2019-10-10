typedef struct record { int value; } record;

typedef struct knode {
  int location;
  int indices[256 + 1];
  int keys[256 + 1];
  bool is_leaf;
  int num_keys;
} knode;

__kernel void A(long a, __global knode* b, long c, __global record* d, __global long* e, __global long* f, __global int* g, __global record* h, int i, int j) {
  for (int k = 0; k < a; k++) {
    for (int l = 0; l < i; l++) {
      for (int m = 0; m < j; m++) {
        if ((b[e[l]].keys[m]) <= g[l] && (b[e[l]].keys[m + 1] > g[l])) {
          if (b[f[l]].indices[m] < c) {
            f[l] = b[f[l]].indices[m];
            break;
          }
        }
      }
      e[l] = f[l];

      for (int m = 0; m < j; m++) {
        if (b[e[l]].keys[m] == g[l]) {
          h[l].value = d[b[e[l]].indices[m]].value;
          break;
        }
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
  for (int n = 0; n < a; n++) {
    for (int o = 0; o < l; ++o) {
      for (int p = 0; p < m; p++) {
        if ((b[d[o]].keys[p] <= h[o]) && (b[d[o]].keys[p + 1] > h[o])) {
          if (b[d[o]].indices[p] < c) {
            e[o] = b[d[o]].indices[p];
            break;
          }
        }
      }

      d[o] = e[o];

      for (int p = 0; p < m; p++) {
        if ((b[f[o]].keys[p] <= i[o]) && (b[f[o]].keys[p + 1] > i[o])) {
          if (b[f[o]].indices[p] < c) {
            g[o] = b[f[o]].indices[p];
            break;
          }
        }
      }

      f[o] = g[o];
    }
  }

  for (int o = 0; o < l; ++o) {
    for (int p = 0; p < m; p++) {
      if (b[d[o]].keys[p] == h[o]) {
        j[o] = b[d[o]].indices[p];
        break;
      }
    }

    for (int p = 0; p < m; p++) {
      if (b[f[o]].keys[p] == i[o]) {
        k[o] = b[f[o]].indices[p] - j[o] + 1;
        break;
      }
    }
  }
}
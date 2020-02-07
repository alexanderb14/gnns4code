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
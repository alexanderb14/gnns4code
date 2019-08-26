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
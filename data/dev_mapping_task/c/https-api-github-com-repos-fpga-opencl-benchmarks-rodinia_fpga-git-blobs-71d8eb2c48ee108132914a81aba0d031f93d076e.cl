typedef struct record { int value; } record;

typedef struct knode {
  int location;
  int indices[256 + 1];
  int keys[256 + 1];
  bool is_leaf;
  int num_keys;
} knode;

__kernel void A(long a, __global knode* b, long c, __global record* d, __global long* e, __global long* f, __global int* g, __global record* h, int i, int j) {
  for (int k = 0; k < i; k++) {
    int l;
    for (int l = 0; l < a; l++) {
      for (int m = 0; m < j; m++) {
        if ((b[e[k]].keys[m]) <= g[k] && (b[e[k]].keys[m + 1] > g[k])) {
          if (b[f[k]].indices[m] < c) {
            f[k] = b[f[k]].indices[m];
            break;
          }
        }
      }
      e[k] = f[k];
    }

    for (int m = 0; m < j; m++) {
      if (b[e[k]].keys[m] == g[k]) {
        h[k].value = d[b[e[k]].indices[m]].value;
        break;
      }
    }
  }
}
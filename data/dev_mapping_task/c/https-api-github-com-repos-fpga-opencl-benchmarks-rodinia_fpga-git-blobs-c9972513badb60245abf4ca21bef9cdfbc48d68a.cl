typedef struct record { int value; } record;

typedef struct knode {
  int location;
  int indices[256 + 1];
  int keys[256 + 1];
  bool is_leaf;
  int num_keys;
} knode;

__attribute__((num_simd_work_items(2))) __attribute__((reqd_work_group_size(256, 1, 1))) __kernel void A(long a, __global knode* b, long c, __global record* d,

                                                                                                         __global long* e, __global long* f, __global int* g, __global record* h) {
  int i = get_local_id(0);
  int j = get_group_id(0);

  int k;
  for (k = 0; k < a; k++) {
    if ((b[e[j]].keys[i]) <= g[j] && (b[e[j]].keys[i + 1] > g[j])) {
      if (b[f[j]].indices[i] < c) {
        f[j] = b[f[j]].indices[i];
      }
    }

    barrier(1);

    if (i == 0) {
      e[j] = f[j];
    }

    barrier(1);
  }

  if (b[e[j]].keys[i] == g[j]) {
    h[j].value = d[b[e[j]].indices[i]].value;
  }
}
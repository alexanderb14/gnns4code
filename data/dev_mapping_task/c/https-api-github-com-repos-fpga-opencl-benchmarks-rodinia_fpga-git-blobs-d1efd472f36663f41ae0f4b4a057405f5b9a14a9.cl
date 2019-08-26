typedef struct knode2 {
  int location;
  int indices[256 + 1];
  int keys[256 + 1];
  bool is_leaf;
  int num_keys;
} knode2;

__attribute__((num_simd_work_items(2))) __attribute__((reqd_work_group_size(256, 1, 1))) __kernel void A(long a, __global knode2* b, long c,

                                                                                                         __global long* d, __global long* e, __global long* f, __global long* g, __global int* h, __global int* i, __global int* j, __global int* k) {
  int l = get_local_id(0);
  int m = get_group_id(0);

  int n;
  for (n = 0; n < a; n++) {
    if ((b[d[m]].keys[l] <= h[m]) && (b[d[m]].keys[l + 1] > h[m])) {
      if (b[d[m]].indices[l] < c) {
        e[m] = b[d[m]].indices[l];
      }
    }
    if ((b[f[m]].keys[l] <= i[m]) && (b[f[m]].keys[l + 1] > i[m])) {
      if (b[f[m]].indices[l] < c) {
        g[m] = b[f[m]].indices[l];
      }
    }

    barrier(1);

    if (l == 0) {
      d[m] = e[m];
      f[m] = g[m];
    }

    barrier(1);
  }

  if (b[d[m]].keys[l] == h[m]) {
    j[m] = b[d[m]].indices[l];
  }

  barrier(1);

  if (b[f[m]].keys[l] == i[m]) {
    k[m] = b[f[m]].indices[l] - j[m] + 1;
  }
}
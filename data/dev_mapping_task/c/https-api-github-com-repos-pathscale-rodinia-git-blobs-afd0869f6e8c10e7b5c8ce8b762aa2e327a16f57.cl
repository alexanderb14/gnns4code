typedef struct knode {
  int location;
  int indices[508 + 1];
  int keys[508 + 1];
  bool is_leaf;
  int num_keys;
} knode;

__kernel void A(long a, __global knode* b, long c,

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
    __syncthreads();

    if (l == 0) {
      d[m] = e[m];
      f[m] = g[m];
    }
    __syncthreads();
  }

  if (b[d[m]].keys[l] == h[m]) {
    j[m] = b[d[m]].indices[l];
  }
  __syncthreads();

  if (b[f[m]].keys[l] == i[m]) {
    k[m] = b[f[m]].indices[l] - j[m] + 1;
  }
}
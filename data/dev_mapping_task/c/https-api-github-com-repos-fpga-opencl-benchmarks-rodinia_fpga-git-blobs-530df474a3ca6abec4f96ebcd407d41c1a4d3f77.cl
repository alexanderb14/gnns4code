typedef struct record { int value; } record;

typedef struct knode {
  int location;
  int indices[256 + 1];
  int keys[256 + 1];
  bool is_leaf;
  int num_keys;
} knode;

__kernel void A(long a, __global knode* b, long c, __global record* d,

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
typedef struct knode2 {
  int location;
  int indices[256 + 1];
  int keys[256 + 1];
  bool is_leaf;
  int num_keys;
} knode2;

__kernel void B(long a, __global knode2* b, long c,

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
typedef struct {
  int starting;
  int no_of_edges;
} Node;

__kernel void A(__global const Node* restrict a, __global const int* restrict b, __global char* restrict c, __global char* restrict d, __global char* restrict e, __global int* restrict f, const int g) {
  int h = get_global_id(0);
  if (h < g && c[h]) {
    c[h] = false;
    int i = f[h] + 1;
    Node j = a[h];

    for (int k = j.starting; k < (j.no_of_edges + j.starting); k++) {
      int l = b[k];
      if (!e[l]) {
        f[l] = i;
        d[l] = true;
      }
    }
  }
}

__attribute__((num_simd_work_items(16))) __attribute__((reqd_work_group_size(256, 1, 1))) __kernel void B(__global char* restrict a, __global char* restrict b, __global char* restrict c, __global char* restrict d, const int e) {
  int f = get_global_id(0);
  if (f < e && b[f]) {
    a[f] = true;
    c[f] = true;
    *d = true;
    b[f] = false;
  }
}
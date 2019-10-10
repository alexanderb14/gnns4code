typedef struct {
  int starting;
  int no_of_edges;
} Node;

__kernel void A(__global const Node* a, __global int* b, __global int* c, __global int* d, __global int* e, __global int* f, int g) {
  unsigned int h = get_global_id(0);

  if (h < g && c[h] != 0) {
    c[h] = 0;
    int i = (a[h].no_of_edges + a[h].starting);
    for (int j = a[h].starting; j < i; j++) {
      int k = b[j];
      if (!e[k]) {
        f[k] = f[h] + 1;
        d[k] = 1;
      }
    }
  }
}

__kernel void B(__global int* a, __global int* b, __global int* c, __global int* d, int e) {
  unsigned int f = get_global_id(0);
  if (f < e && b[f] == 1) {
    a[f] = 1;
    c[f] = 1;
    *d = 1;
    b[f] = 0;
  }
}
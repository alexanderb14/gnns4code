typedef struct {
  int starting;
  int no_of_edges;
} Node;

__kernel void A(const __global Node* a, const __global int* b, __global char* c, __global char* d, __global char* e, __global int* f, const int g) {
  int h = get_global_id(0);
  if (h < g && c[h]) {
    c[h] = false;
    for (int i = a[h].starting; i < (a[h].no_of_edges + a[h].starting); i++) {
      int j = b[i];
      if (!e[j]) {
        f[j] = f[h] + 1;
        d[j] = true;
      }
    }
  }
}

__kernel void B(__global char* a, __global char* b, __global char* c, __global char* d, const int e) {
  int f = get_global_id(0);
  if (f < e && b[f]) {
    a[f] = true;
    c[f] = true;
    *d = true;
    b[f] = false;
  }
}
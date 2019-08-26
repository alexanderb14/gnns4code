typedef struct {
  int starting;
  int no_of_edges;
} Node;

__kernel void A(__global const Node* a, __global const int* b, __global char* c, __global char* d, __global char* e, __global int* f, const int g) {
  int h;
  for (int i = 0; i < g; i++) {
    h = f[i];
    if (c[i]) {
      c[i] = false;
      for (int j = a[i].starting; j < (a[i].no_of_edges + a[i].starting); j++) {
        int k = b[j];
        if (!e[k]) {
          f[k] = h + 1;
          d[k] = true;
        }
      }
    }
  }
}

__kernel void B(__global char* a, __global char* b, __global char* c, __global char* d, const int e) {
  for (int f = 0; f < e; f++) {
    if (b[f]) {
      a[f] = true;
      c[f] = true;
      *d = true;
      b[f] = false;
    }
  }
}
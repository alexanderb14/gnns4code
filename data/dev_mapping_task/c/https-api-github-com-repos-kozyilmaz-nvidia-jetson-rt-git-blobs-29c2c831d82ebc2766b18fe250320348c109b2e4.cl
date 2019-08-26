typedef struct {
  float weight;

  long assign;
  float cost;
} Point_Struct;

__kernel void A(__global char* a, short b, int c) {
  const int d = get_global_id(0);
  a[d] = b;
}

__kernel void B(__global Point_Struct* a, __global float* b, __global float* c, __global int* d, __global char* e, __local float* f, int g, int h, long i, int j) {
  const int k = get_global_id(0);
  const int l = get_local_id(0);

  if (k < g) {
    if (l == 0)
      for (int m = 0; m < h; m++) {
        f[m] = b[m * g + i];
      }
    barrier(1);

    float n = 0.0;
    for (int m = 0; m < h; m++)
      n += (b[(m * g) + k] - f[m]) * (b[(m * g) + k] - f[m]);
    n = n * a[k].weight;

    float o = a[k].cost;

    int p = k * (j + 1);

    if (n < o) {
      e[k] = '1';
      int q = p + j;
      c[q] = n - o;
    }

    else {
      int r = a[k].assign;
      int s = p + d[r];
      c[s] += o - n;
    }
  }
}
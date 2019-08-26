typedef float real; typedef struct {
  float x;
  float y;
  long level;
} cell;
int A(int a) {
  int b = 1;
  int c;
  for (c = 0; c < a; c++) {
    b *= 2;
  }
  return b;
}
int B(int a) {
  int b = 1;
  int c;
  for (c = 0; c < a; c++) {
    b *= 4;
  }
  return b;
}
__kernel void C(__global int* a, __global const cell* b, const int c, const int d, const int e) {
  const int f = get_global_id(0);

  if (f < c) {
    real g = b[f].x;
    real h = b[f].y;
    int i = b[f].level;

    int j = (int)(((((g - (1.0f / (2.0f * (real)d * (real)A(i)))) * (real)((A(e) * d)))) + (((h - (1.0f / (2.0f * (real)d * (real)A(i)))) * (real)((A(e) * d)))) * (real)((A(e) * d))));
    int k = A(e - i);
    for (int l = 0; l < k; l++) {
      for (int m = 0; m < k; m++) {
        a[j] = f;
        j++;
      }
      j = j - k + ((A(e) * d));
    }
  }
}

__kernel void D(__global real* a, __global const real* b, __global const int* c, __global const cell* d, __global const cell* e, const int f, const int g, const int h) {
  const int i = get_global_id(0);

  if (i < f) {
    a[i] = 0.0f;
    int j, k;
    int l;
    int m = (int)(((((e[i].x - (1.0f / (2.0f * (real)g * (real)A(e[i].level)))) * (real)((A(h) * g)))) + (((e[i].y - (1.0f / (2.0f * (real)g * (real)A(e[i].level)))) * (real)((A(h) * g)))) * (real)((A(h) * g))));
    int n = A(h - e[i].level);
    for (j = 0; j < n; j++) {
      for (k = 0; k < n; k++) {
        l = c[m];
        a[i] += (b[l] / (real)B(h - d[l].level));
        m++;
      }
      m = m - n + ((A(h) * g));
    }
  }
}
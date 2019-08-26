typedef struct vfield {
  double probability;
  int state;
} vfield_t;

__kernel void A(int a, int b, int c, int d, __global double* e, __global double* f, __global vfield_t* g) {
  int h = get_global_id(0);
  double i = __builtin_inff();
  double j = -__builtin_inff();
  int k = -1;
  double l = e[(h * d) + b];
  for (int m = 0; m < c; m++) {
    i = g[m + ((a - 1) * c)].probability + f[(m * c) + h] + l;
    if (i > j) {
      j = i;
      k = m;
    }
  }
  g[h + (a * c)].probability = j;
  g[h + (a * c)].state = k;
}
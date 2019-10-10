int A(double* a, int b, double c) {
  int d = -1;
  int e;
  for (e = 0; e < b; e++) {
    if (a[e] >= c) {
      d = e;
      break;
    }
  }
  if (d == -1)
    return b - 1;
  return d;
}

int B(double* a, int b, int c, double d) {
  if (c < b)
    return -1;
  int e;
  while (c > b) {
    e = b + ((c - b) / 2);
    if (a[e] >= d) {
      if (e == 0)
        return e;
      else if (a[e - 1] < d)
        return e;
      else if (a[e - 1] == d) {
        while (a[e] == d && e >= 0)
          e--;
        e++;
        return e;
      }
    }
    if (a[e] > d)
      c = e - 1;
    else
      b = e + 1;
  }
  return -1;
}
__kernel void C(__global double* a, __global double* b, __global double* c, __global double* d, __global double* e, __global double* f, int g) {
  int h = get_global_id(0);

  if (h < g) {
    int i = -1;
    int j;

    for (j = 0; j < g; j++) {
      if (c[j] >= d[h]) {
        i = j;
        break;
      }
    }
    if (i == -1) {
      i = g - 1;
    }

    e[h] = a[i];
    f[h] = b[i];
  }
}
void kernel A(global int* a, global int* b, global int* c, int d, int e, int f, int g) {
  int h = get_global_id(0) + d;

  if (get_global_id(0) < g) {
    if (a[h] < a[h - e] + f) {
      b[h] = a[h - e] + f;
      c[h - 1] = 1;
    } else {
      b[h] = a[h];
    }
  }
}
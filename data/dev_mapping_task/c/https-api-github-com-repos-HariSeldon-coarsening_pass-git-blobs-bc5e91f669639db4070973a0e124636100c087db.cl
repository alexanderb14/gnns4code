typedef float DATA_TYPE; __kernel void A(__global DATA_TYPE* a, __global DATA_TYPE* b, __global DATA_TYPE* c, __global DATA_TYPE* d, int e, int f, int g) {
  int h = get_global_id(0);
  int i = get_global_id(1);

  if ((i < f) && (h < g)) {
    int j = i * g + h;

    if (i == 0) {
      c[i * g + h] = a[e];
    } else {
      c[i * g + h] = c[i * g + h] - 0.5 * (d[i * g + h] - d[(i - 1) * g + h]);
    }
  }
}

__kernel void B(__global DATA_TYPE* a, __global DATA_TYPE* b, __global DATA_TYPE* c, int d, int e) {
  int f = get_global_id(0);
  int g = get_global_id(1);

  if ((g < d) && (f < e) && (f > 0)) {
    a[g * (e + 1) + f] = a[g * (e + 1) + f] - 0.5 * (c[g * e + f] - c[g * e + (f - 1)]);
  }
}

__kernel void C(__global DATA_TYPE* a, __global DATA_TYPE* b, __global DATA_TYPE* c, int d, int e) {
  int f = get_global_id(0);
  int g = get_global_id(1);

  if ((g < d) && (f < e)) {
    c[g * e + f] = c[g * e + f] - 0.7 * (a[g * (e + 1) + (f + 1)] - a[g * (e + 1) + f] + b[(g + 1) * e + f] - b[g * e + f]);
  }
}
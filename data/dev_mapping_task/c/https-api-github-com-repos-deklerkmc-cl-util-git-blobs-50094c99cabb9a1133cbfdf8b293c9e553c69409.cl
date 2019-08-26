__kernel void A(__global int* a, __global int* b, __local int* c, int d) {
  int e = get_global_id(0);

  int f = get_local_id(0);
  int g = get_group_id(0);

  if (f < 9) {
    c[f] = 0;
  }

  barrier(1);

  if (e < d) {
    int h = a[e];

    atomic_add(&c[h], 1);
  }

  barrier(1);

  if (f < 9) {
    b[g * 16 + f] = c[f];
  }
}

__kernel void B(__global int* a, __global int* b, int c) {
  int d = get_global_id(0);

  int e = get_local_id(0);
  int f = get_group_id(0);

  if (e < 9) {
    int g = 0;
    int h = 0;

    while (g < c) {
      h += a[g * 16 + e];
      g++;
    }

    b[e] = h;
  }
}
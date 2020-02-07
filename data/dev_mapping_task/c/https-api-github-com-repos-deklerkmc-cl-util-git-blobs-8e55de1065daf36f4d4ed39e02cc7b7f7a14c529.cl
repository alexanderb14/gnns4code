__kernel void A(__global uint* a, __global uint* b, __global int* c, __local int* d, int e) {
  int f = get_global_id(0);

  int g = get_local_id(0);
  int h = get_group_id(0);

  if (g < 9) {
    d[g] = 0;
  }

  if (f < e) {
    uint i = a[f];
    uint j = b[f];

    int k;
    if (i == 1)
      k = 0;
    else
      k = 1;

    atomic_add(&d[k], 1);
  }

  barrier(1);

  if (g < 9) {
    c[h * 16 + g] = d[g];
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
__kernel void A(__global int* a, __global int* b) {
  size_t c = get_global_id(0);
  uchar d = get_local_id(0);

  __local int e[12];

  e[d] = a[c];
  barrier(1);
  e[d] = e[d] + e[d + 1];
  b[c] = e[d];
}

__kernel void B(__global int* a, __global int* b) {
  size_t c = get_global_id(0);
  uchar d = get_local_id(0);

  __private int e[12];

  e[0] = a[c];
  e[1] = a[c] + 4;
  e[2] = a[c] + 5;
  e[3] = a[c] + 6;
  e[4] = a[c] + 7;
  e[5] = a[c] + 8;
  e[6] = a[c] + 9;
  e[7] = a[c] + 10;
  e[8] = a[c] + 11;
  e[9] = a[c] + 12;
  e[10] = a[c] + 13;
  e[11] = a[c] + 14;

  barrier(1);
  e[0] = e[0] + e[d];
  b[c] = e[0];
}
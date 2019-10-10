__kernel void A(__global int* a) {
  int b = get_global_id(0);
  a[b] = b;
}

__kernel void B(__global int* a, __global int* b) {
  int c = get_global_id(0);
  a[c] = b[c] + 1;
}

__kernel void C(__global float* a, int b, int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  int f = e * b + d * 8;
  int8 g = (int8){0, 1, 2, 3, 4, 5, 6, 7};
  g += f;
  vstore8(log(convert_float8(g)), 0, a + f);
}
__kernel void A(__global int* restrict a, __global int* restrict b, __global int* restrict c) {
  int d = get_global_id(0);

  int4 e = vload4(d, a);

  int4 f = vload4(d, b);

  vstore4(e + f, d, c);
}
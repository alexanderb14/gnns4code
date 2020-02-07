kernel void A(int a, int b, int c, global int* d) {
  int e = get_global_id(0);

  if (e * 2 + 0 < a) {
    d[e + c] = d[e * 2 + 0 + b];
  }

  if (e * 2 + 1 < a) {
    d[e + c] += d[e * 2 + 1 + b];
  }
}
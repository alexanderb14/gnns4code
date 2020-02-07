kernel void A(global const int* a, global int* b, int c) {
  size_t d = get_global_id(0);

  int e[32];
  for (int f = 0; f < 32; ++f) {
    e[f] = a[f];
  }

  if (d < c) {
    b[d] = d;
  } else {
    b[d] = e[d % 32];
  }
}
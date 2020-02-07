__kernel void A(global int* a, global int* b, global int* c, int d) {
  int e;
  int f;

  int g = get_global_id(0);

  for (f = 0; f < d; f++) {
    e = atomic_add(b + f, e);
  }

  b[g] = e;
}
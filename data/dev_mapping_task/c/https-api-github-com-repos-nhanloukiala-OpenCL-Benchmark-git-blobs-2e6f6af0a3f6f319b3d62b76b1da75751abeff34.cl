__kernel void A(int a, int b, __global int* c, __global int* d, __global int* e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h = 0;

  if ((f < b) && (g < a)) {
    h = 0;
    for (int i = 0; i < a; ++i) {
      h += c[f * b + i] * d[i * a + g];
    }
    e[f * b + g] = h;
  }
}
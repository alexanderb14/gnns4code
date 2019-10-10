__kernel void A(int a, int b, __global int* c, __global int* d, __global int* e, __local int* f) {
  int g = get_global_id(0);
  int h = get_local_id(0);
  int i = get_local_size(0);
  int j = 0;

  int k[1024];

  if (g < b) {
    for (int l = 0; l < a; ++l) {
      k[l] = c[g * b + l];
    }

    for (int m = 0; m < b; ++m) {
      for (int l = h; l < a; l += i)
        f[l] = d[l * a + m];
      barrier(1);

      j = 0;
      for (int l = 0; l < a; ++l) {
        j += k[l] * f[l];
      }
      e[g * b + m] = j;
    }
  }
}
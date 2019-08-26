__kernel void A(__global int* a, __global int* b, int c) {
  int d = (int)get_global_id(0);

  bool e = false;
  bool f;
  int g = a[d];
  for (unsigned int h = 0; h < c; h++, e = !e) {
    if (e) {
      f = false;
      for (unsigned int i = 0; i < c; i++, f = !f) {
        if (f) {
          g++;
        }
      }
    }
  }
  b[d] = g;
}
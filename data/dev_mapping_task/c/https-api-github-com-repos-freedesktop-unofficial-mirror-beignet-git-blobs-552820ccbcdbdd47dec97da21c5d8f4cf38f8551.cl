kernel void A(global float16* a, float16 b, unsigned int c, unsigned int d, float16 e) {
  int f = get_global_id(0);
  if (f < d) {
    a[f * 2 + c] = b;
    a[f * 2 + c + 1] = e;
  }
}
__kernel void A(const int a, const int b, __global int* c, __global int* d) {
  unsigned int e = get_global_id(0);
  unsigned int f = get_global_id(1);
  unsigned int g = e + a * f;
  unsigned int h = 0;

  unsigned int i = 0;
  unsigned int j = a * a;

  if ((e + (b)) % (f) == 0) {
    d[g] = c[g] + 1;
  } else {
    d[g] = 0;
  }
}
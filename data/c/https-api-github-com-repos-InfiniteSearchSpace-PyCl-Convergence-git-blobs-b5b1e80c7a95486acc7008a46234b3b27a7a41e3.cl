__kernel void A(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  unsigned int f = d + a * e;
  unsigned int g = 0;

  unsigned int h = 0;
  unsigned int i = a * a;

  if ((d + 4096) % (e + 4096) == 2) {
    c[f] = b[f] + 1;
  } else {
    c[f] = 0;
  }
}
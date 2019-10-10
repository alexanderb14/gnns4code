__kernel void A(__global int* a, __global char* b, __global int* c, __global int* d) {
  float e = 14846398.5;
  float f = (*a) * e;

  int g = get_global_id(0);
  int h = get_local_id(0);
  d[g] = h;
  int i = *c;
  int j;
  for (j = 0; j < i; j++) {
    int k = 0;
    while (k < f) {
      k++;
    }
  }
  char l;
  l = '1';
  char m;
  m = 'b';
  b[0] = l;
  b[1] = m;
}
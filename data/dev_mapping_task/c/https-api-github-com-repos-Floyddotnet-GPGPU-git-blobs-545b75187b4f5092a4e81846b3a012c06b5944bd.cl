__kernel void A(__global int* a, int b) {
  int c = get_global_id(0);
  if (c > b)
    return;

  a[c] = c;
}

__kernel void B(__global char* a, __global char* b) {
  int c = 796032;
  int d = get_global_id(0);
  __global char* e = a + d;
  int f = 0;
  int g = 0;
  while (e[g] != '\0') {
    f++;
    g += c;
  }
  b[d] = f;
}

__kernel void C(__global char* a, __constant char* b, __global char* c, __global char* d, __global char* e, __global char* f) {
  int g = 796032;
  int h = get_global_id(0);

  __global char* i = e + h;
  __global char* j = f + h;

  __global char* const k = a + h;
  const int l = b[16];
  const int m = c[h];

  __global char* n = i;
  __global char* o = j;
  int p = 0;
  while (p <= m) {
    n[g * p] = p;
    p++;
  }
  int q = 1;
  while (q <= l) {
    o[0] = q;
    p = 1;
    while (p <= m) {
      char r = n[p * g] + 1;
      char s = o[(p - 1) * g] + 1;
      char t = n[(p - 1) * g];
      if ((b[q - 1] != k[g * (p - 1)])) {
        t += 1;
      }

      if (r < s)
        s = r;
      if (t < s)
        s = t;
      o[p * g] = s;
      p++;
    }
    n = (n == i) ? j : i;
    o = (o == j) ? i : j;
    q++;
  }

  d[h] = n[m * g];
}
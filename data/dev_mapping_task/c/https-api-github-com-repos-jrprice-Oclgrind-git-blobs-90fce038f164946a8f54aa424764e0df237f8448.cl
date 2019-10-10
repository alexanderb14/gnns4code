struct S0 {
  uchar f[1];
  ulong g[4];
};

__kernel void A(__global ulong* a) {
  struct S0 b = {{1}, {2, 3, 4, 5}};
  struct S0 c = b;

  volatile int d = 0;
  *a = c.g[d];
}
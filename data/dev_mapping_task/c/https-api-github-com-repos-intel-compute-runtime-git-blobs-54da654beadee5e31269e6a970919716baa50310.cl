__kernel void A(__global ulong* a) {
  __private char b[3];
  __private char2 c[3];
  __private char3 d[3];
  __private char4 e[3];
  __private char8 f[3];
  __private char16 g[3];

  a[0] = (ulong)&b[0];
  a[1] = (ulong)&c[0];
  a[2] = (ulong)&d[0];
  a[3] = (ulong)&e[0];
  a[4] = (ulong)&f[0];
  a[5] = (ulong)&g[0];
}
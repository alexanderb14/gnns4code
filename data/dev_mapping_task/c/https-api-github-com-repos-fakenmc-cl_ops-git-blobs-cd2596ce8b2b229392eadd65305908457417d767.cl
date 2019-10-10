typedef int clo_statetype; uint A(__global clo_statetype* a, uint b) {
  clo_statetype c = a[b];

  int const d = 16807;
  int const e = 2147483647;
  c = (((long)c) * d) % e;

  a[b] = c;

  return __builtin_astype(c, uint) << 1;
}
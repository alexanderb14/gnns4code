void A(ulong* a, ulong b) {
  *a += b;
}
int B() {
  return (get_global_id(2) * get_global_size(1) + get_global_id(1)) * get_global_size(0) + get_global_id(0);
}
union U5 {
  short f0;
  int f3;
};
struct S6 {
  union U5 g_75[5][7][2];
  union U5** g_91[78];
};
__kernel void C(__global ulong* a) {
  int b, c, d;
  struct S6 e;
  struct S6* f = &e;
  union U5* g;
  struct S6 h = { {{{{0xD5e}}, h;
  ulong i = b = 0;
  for (; b < 9; b++) {
    c = 0;
    {
      d = 0;
      { A(&i, f->g_75[b][c][d].f0); }
    }
  }
  a[B()] = i;
}
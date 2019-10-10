kernel void A(global uint* a) {
 private
  char b[3];
 private
  char2 c[3];
 private
  char3 d[3];
 private
  char4 e[3];
 private
  char8 f[3];
 private
  char16 g[3];
  a[0] = (uint)&b[0];
  a[1] = (uint)&c[0];
  a[2] = (uint)&d[0];
  a[3] = (uint)&e[0];
  a[4] = (uint)&f[0];
  a[5] = (uint)&g[0];
}

kernel void B(global uint* a, global char* b, global char2* c, global char2* d, global char4* e, global char8* f, global char16* g) {
  a[0] = (uint)&b[0];
  a[1] = (uint)&c[0];
  a[2] = (uint)&d[0];
  a[3] = (uint)&e[0];
  a[4] = (uint)&f[0];
  a[5] = (uint)&g[0];
}

kernel void C(global uint* a, local char* b, local char2* c, local char2* d, local char4* e, local char8* f, local char16* g) {
  a[0] = (uint)&b[0];
  a[1] = (uint)&c[0];
  a[2] = (uint)&d[0];
  a[3] = (uint)&e[0];
  a[4] = (uint)&f[0];
  a[5] = (uint)&g[0];
}

kernel void D(global uint* a) {
  local char b[3];
  local char2 c[3];
  local char3 d[3];
  local char4 e[3];
  local char8 f[3];
  local char16 g[3];
  a[0] = (uint)&b[0];
  a[1] = (uint)&c[0];
  a[2] = (uint)&d[0];
  a[3] = (uint)&e[0];
  a[4] = (uint)&f[0];
  a[5] = (uint)&g[0];
}

kernel void E(global uint* a, constant char* b, constant char2* c, constant char2* d, constant char4* e, constant char8* f, constant char16* g) {
  a[0] = (uint)&b[0];
  a[1] = (uint)&c[0];
  a[2] = (uint)&d[0];
  a[3] = (uint)&e[0];
  a[4] = (uint)&f[0];
  a[5] = (uint)&g[0];
}

constant char Ga[3] = {0};
constant char2 Gb[3] = {(char2)(0)};
constant char3 Gc[3] = {(char3)(0)};
constant char4 Gd[3] = {(char4)(0)};
constant char8 Ge[3] = {(char8)(0)};
constant char16 Gf[3] = {(char16)(0)};

kernel void F(global uint* a) {
  a[0] = (uint)&Ga;
  a[1] = (uint)&Gb;
  a[2] = (uint)&Gc;
  a[3] = (uint)&Gd;
  a[4] = (uint)&Ge;
  a[5] = (uint)&Gf;
}
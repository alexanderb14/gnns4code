__kernel void A(__global char* a, __global char* b, __global uchar* c) {
  int d = get_global_id(0);

  char e, f;
  e = a[d];
  f = b[d];
  uchar g = abs_diff(e, f);
  c[d] = g;
}

__kernel void B(__global short* a, __global ushort* b) {
  int c = get_global_id(0);

  ushort3 d = abs(vload3(c, a));
  vstore3(d, c, b);
}

__kernel void C(__global char2* a, __global char2* b, __global uchar2* c) {
  int d = get_global_id(0);

  char2 e, f;
  e = a[d];
  f = b[d];
  uchar2 g = abs_diff(e, f);
  c[d] = g;
}
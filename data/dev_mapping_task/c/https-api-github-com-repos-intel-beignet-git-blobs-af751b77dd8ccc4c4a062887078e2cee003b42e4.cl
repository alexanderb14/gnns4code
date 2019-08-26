kernel void A(global ulong4* a, global ulong4* b, global ulong4* c) {
  __global ulong4* d = &a[get_global_id(0)];
  __global ulong4* e = &b[get_global_id(0)];
  __global ulong4* f = &c[get_global_id(0)];
  *f = *d + *e;
  ulong4 g = -convert_ulong4(*f < *e);
  (*f).y += g.x;
  g.y += ((*f).y < g.x);
  (*f).z += g.y;
  g.z += ((*f).z < g.y);
  (*f).w += g.z;
  g.w += ((*f).w < g.z);
}
kernel void B(global uint4* a, global uint4* b, global uint4* c) {
  __global uint4* d = &a[get_global_id(0)];
  __global uint4* e = &b[get_global_id(0)];
  __global uint4* f = &c[get_global_id(0)];
  *f = *d + *e;
  uint4 g = -convert_uint4(*f < *e);
  (*f).y += g.x;
  g.y += ((*f).y < g.x);
  (*f).z += g.y;
  g.z += ((*f).z < g.y);
  (*f).w += g.z;
  g.w += ((*f).w < g.z);
}
kernel void C(global ushort4* a, global ushort4* b, global ushort4* c) {
  __global ushort4* d = &a[get_global_id(0)];
  __global ushort4* e = &b[get_global_id(0)];
  __global ushort4* f = &c[get_global_id(0)];
  *f = *d + *e;
  ushort4 g = -convert_ushort4(*f < *e);
  (*f).y += g.x;
  g.y += ((*f).y < g.x);
  (*f).z += g.y;
  g.z += ((*f).z < g.y);
  (*f).w += g.z;
  g.w += ((*f).w < g.z);
}
kernel void D(global uchar4* a, global uchar4* b, global uchar4* c) {
  __global uchar4* d = &a[get_global_id(0)];
  __global uchar4* e = &b[get_global_id(0)];
  __global uchar4* f = &c[get_global_id(0)];
  *f = *d + *e;
  uchar4 g = -convert_uchar4(*f < *e);
  (*f).y += g.x;
  g.y += ((*f).y < g.x);
  (*f).z += g.y;
  g.z += ((*f).z < g.y);
  (*f).w += g.z;
  g.w += ((*f).w < g.z);
}
kernel void E(global uint4* a, global uint4* b, global uint4* c) {
  __global uint4* d = &a[get_global_id(0)];
  __global uint4* e = &b[get_global_id(0)];
  __global uint4* f = &c[get_global_id(0)];
  uint4 g;
  unsigned h;
  size_t i = sizeof(*d) / sizeof((*d)[0]);
  for (uint j = 0; j < i; j++) {
    g[j] = __builtin_usub_overflow((*d)[j], (*e)[j], &h);
    (*f)[j] = h;
  }
  for (uint j = 0; j < i - 1; j++) {
    g[j + 1] += (*f)[j + 1] < g[j];
    (*f)[j + 1] -= g[j];
  }
}
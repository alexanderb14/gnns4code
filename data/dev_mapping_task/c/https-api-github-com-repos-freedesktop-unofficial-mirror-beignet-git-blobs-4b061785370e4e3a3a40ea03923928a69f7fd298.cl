kernel void A(global ulong* a, global ulong* b) {
  __global ulong* c = &a[get_global_id(0)];
  __global ulong* d = &b[get_global_id(0)];
  *d = clz(*c);
}
kernel void B(global uint* a, global uint* b) {
  __global uint* c = &a[get_global_id(0)];
  __global uint* d = &b[get_global_id(0)];
  *d = clz(*c);
}
kernel void C(global ushort* a, global ushort* b) {
  __global ushort* c = &a[get_global_id(0)];
  __global ushort* d = &b[get_global_id(0)];
  *d = clz(*c);
}
kernel void D(global uchar* a, global uchar* b) {
  __global uchar* c = &a[get_global_id(0)];
  __global uchar* d = &b[get_global_id(0)];
  *d = clz(*c);
}
kernel void E(global long* a, global long* b) {
  __global long* c = &a[get_global_id(0)];
  __global long* d = &b[get_global_id(0)];
  *d = clz(*c);
}
kernel void F(global int* a, global int* b) {
  __global int* c = &a[get_global_id(0)];
  __global int* d = &b[get_global_id(0)];
  *d = clz(*c);
}
kernel void G(global short* a, global short* b) {
  __global short* c = &a[get_global_id(0)];
  __global short* d = &b[get_global_id(0)];
  *d = clz(*c);
}
kernel void H(global char* a, global char* b) {
  __global char* c = &a[get_global_id(0)];
  __global char* d = &b[get_global_id(0)];
  *d = clz(*c);
}
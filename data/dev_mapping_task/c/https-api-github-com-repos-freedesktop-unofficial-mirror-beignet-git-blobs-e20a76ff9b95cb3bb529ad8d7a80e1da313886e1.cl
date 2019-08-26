__kernel void A(__global char* a, __global char* b, __global char* c) {
  int d = get_global_id(0);
  a[d] = sub_sat(b[d], c[d]);
}
__kernel void B(__global uchar* a, __global uchar* b, __global uchar* c) {
  int d = get_global_id(0);
  a[d] = sub_sat(b[d], c[d]);
}
__kernel void C(__global short* a, __global short* b, __global short* c) {
  int d = get_global_id(0);
  a[d] = sub_sat(b[d], c[d]);
}
__kernel void D(__global ushort* a, __global ushort* b, __global ushort* c) {
  int d = get_global_id(0);
  a[d] = sub_sat(b[d], c[d]);
}
__kernel void E(__global int* a, __global int* b, __global int* c) {
  int d = get_global_id(0);
  a[d] = sub_sat(b[d], c[d]);
}
__kernel void F(__global uint* a, __global uint* b, __global uint* c) {
  int d = get_global_id(0);
  a[d] = sub_sat(b[d], c[d]);
}
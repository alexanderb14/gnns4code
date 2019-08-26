__kernel void A(__global int* a, __global int* b, __global int* c) {
  int d = get_global_id(0);
  c[d] = 1;
}
__kernel void B(__global int* a, __global int* b, __global int* c) {
  int d = get_global_id(0);
  c[d] = a[d];
}
__kernel void C(__global int* a, __global int* b, __global int* c) {
  int d = get_global_id(0);
  c[d] = a[d] + b[d];
}

__kernel void D(__global int* a, __global int* b, __global int* c) {
  int d = get_global_id(0);
  int e = 0;
  for (int f = 0; f < 1024; f++)
    e += f;
  c[d] = e;
}
__kernel void E(__global int* a, __global int* b, __global int* c) {
  int d = get_global_id(0);
  for (int e = 0; e < 1024; e++)
    c[d] += a[d];
}
__kernel void F(__global int* a, __global int* b, __global int* c) {
  int d = get_global_id(0);
  for (int e = 0; e < 1024; e++)
    c[d] += a[d] + b[d];
}
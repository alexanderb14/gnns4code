__kernel void A(__global float* a, __global float* b) {
  int c = get_global_id(0);
  b[c] = a[c];
  return;
}

__kernel void B(__global float* a, __global float* b) {
  int c = get_global_id(0);
  if (c < 0)
    atom_add((__global int*)b, 1);
  b[c] = a[c];
  return;
}

__kernel void C(__global float* a, __global float* b) {
  int c = get_global_id(0);
  int d = get_global_id(1);
  b[(d)*1024 + (c)] = a[(d)*1024 + (c)];
}

__kernel void D(__global float4* a, __global float4* b) {
  int c = get_global_id(0);
  int d = get_global_id(1);
  b[(d)*1024 + (c)] = a[(d)*1024 + (c)];
}

__kernel void E(__global float4* a, __global float4* b) {
  int c = get_global_id(0);
  b[c] = a[c];
  return;
}

__kernel void F(__global float* a, __global float* b) {
  int c = get_global_id(0) - 1;
  if ((get_local_id(0) & 0xf) == 0)
    c += 16;
  b[c] = a[c];
}

__kernel void G(__global float* a, __global float* b) {
  int c = get_global_id(0);
  if ((c & 0x1) == 0) {
    c = (c & !63) + 62 - get_local_id(0);
  }
  b[c] = a[c];
}
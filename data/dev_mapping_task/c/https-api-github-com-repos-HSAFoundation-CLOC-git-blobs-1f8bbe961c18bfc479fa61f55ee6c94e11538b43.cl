__kernel void A(__global const int* a, __global int* b) {
  __local int c[512];
  int d = get_local_id(0);
  c[d] = a[d] + a[d + 512] + a[d + 1024] + a[d + 1536] + a[d + 2048] + a[d + 2560] + a[d + 3072] + a[d + 3584] + a[d + 4096] + a[d + 4608] + a[d + 5120] + a[d + 5632] + a[d + 6144] + a[d + 6656] + a[d + 7168] + a[d + 7680];
  barrier(1);
  if (d < 256)
    c[d] = c[d] + c[d + 256];
  barrier(1);
  if (d < 128)
    c[d] = c[d] + c[d + 128];
  barrier(1);
  if (d < 64)
    c[d] = c[d] + c[d + 64];
  barrier(1);
  if (d < 32)
    c[d] = c[d] + c[d + 32];
  if (d < 16)
    c[d] = c[d] + c[d + 16];
  if (d < 8)
    c[d] = c[d] + c[d + 8];
  if (d < 4)
    c[d] = c[d] + c[d + 4];
  if (d < 2)
    c[d] = c[d] + c[d + 2];
  if (d == 0)
    b[0] = c[0] + c[1];
}
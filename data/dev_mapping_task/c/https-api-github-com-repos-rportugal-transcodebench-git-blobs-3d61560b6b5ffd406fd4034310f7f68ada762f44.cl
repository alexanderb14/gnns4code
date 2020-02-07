__kernel void A(__global unsigned char* a, __global short* b, __global unsigned char* c, int d) {
  int e = get_global_id(0);

  if (e >= d)
    return;

  a[e] = c[((unsigned short)(b[e])) >> 3];
}

__kernel void B(__global unsigned char* a, __global short* b, __global unsigned char* c, int d, __local unsigned char* e) {
  int f = 8192 / get_local_size(0);

  for (int g = 0; g < f; g++) {
    e[get_local_id(0) + g * get_local_size(0)] = c[get_local_id(0) + g * get_local_size(0)];
  }

  barrier(1);

  int h = get_global_id(0);
  if (h >= d)
    return;

  a[h] = e[((unsigned short)(b[h])) >> 3];
}

__kernel void C(__global unsigned char* a, __global short* b, __constant unsigned char* c, int d) {
  int e = get_global_id(0);
  if (e >= d)
    return;

  a[e] = c[((unsigned short)(b[e])) >> 3];
}

__kernel void D(__global short* a, __global unsigned char* b, __global short* c, int d) {
  int e = get_global_id(0);

  if (e >= d)
    return;

  a[e] = c[(int)(b[e])];
}

__kernel void E(__global short* a, __global unsigned char* b, __global short* c, int d, __local short* e) {
  int f = 256 / get_local_size(0);

  for (int g = 0; g < f; g++) {
    e[get_local_id(0) + g * get_local_size(0)] = c[get_local_id(0) + g * get_local_size(0)];
  }

  barrier(1);

  int h = get_global_id(0);
  if (h >= d)
    return;

  a[h] = e[(int)(b[h])];
}

__kernel void F(__global short* a, __global unsigned char* b, __constant short* c, int d) {
  int e = get_global_id(0);

  if (e >= d)
    return;
  a[e] = c[(int)(b[e])];
}
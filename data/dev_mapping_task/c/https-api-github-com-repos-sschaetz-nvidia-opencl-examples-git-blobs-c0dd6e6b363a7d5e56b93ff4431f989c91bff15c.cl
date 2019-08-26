__kernel void A(__global float* a, __global float* b, int c, int d, int e, __local float* f) {
  unsigned int g = get_global_id(0);
  unsigned int h = get_global_id(1);

  if ((g + c < d) && (h < e)) {
    unsigned int i = h * d + g + c;
    f[get_local_id(1) * (16 + 1) + get_local_id(0)] = b[i];
  }

  barrier(1);

  g = get_group_id(1) * 16 + get_local_id(0);
  h = get_group_id(0) * 16 + get_local_id(1);
  if ((g < e) && (h + c < d)) {
    unsigned int j = h * e + g;
    a[j] = f[get_local_id(0) * (16 + 1) + get_local_id(1)];
  }
}

__kernel void B(__global float* a, __global float* b, int c, int d, int e) {
  unsigned int f = get_global_id(0);
  unsigned int g = get_global_id(1);

  if (f + c < d && g < e) {
    unsigned int h = f + c + d * g;
    unsigned int i = g + e * f;
    a[i] = b[h];
  }
}

__kernel void C(__global float* a, __global float* b, int c, int d, int e) {
  unsigned int f = get_global_id(0);
  unsigned int g = get_global_id(1);

  if (f + c < d && g < e) {
    unsigned int h = f + c + d * g;
    a[h] = b[h];
  }
}

__kernel void D(__global float* a, __global float* b, int c, int d, int e, __local float* f) {
  unsigned int g = get_global_id(0);
  unsigned int h = get_global_id(1);

  unsigned int i = h * d + g + c;
  if ((g + c < d) && (h < e)) {
    f[get_local_id(1) * (16 + 1) + get_local_id(0)] = b[i];
  }

  barrier(1);

  if ((g < e) && (h + c < d)) {
    a[i] = f[get_local_id(1) * (16 + 1) + get_local_id(0)];
  }
}

__kernel void E(__global float* a, __global float* b, int c, int d, int e) {
  unsigned int f = get_global_id(0);
  unsigned int g = get_global_id(1);

  if (f + c < d && g < e) {
    unsigned int h = g + e * (f + c);
    a[h] = b[h];
  }
}
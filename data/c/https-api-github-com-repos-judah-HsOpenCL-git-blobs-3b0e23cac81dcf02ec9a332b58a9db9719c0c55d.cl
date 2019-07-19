__kernel void A(__global float* a, __global float* b, int c, int d, __local float* e) {
  unsigned int f = get_global_id(0);
  unsigned int g = get_global_id(1);

  if ((f < c) && (g < d)) {
    unsigned int h = g * c + f;
    e[get_local_id(1) * (16 + 1) + get_local_id(0)] = b[h];
  }

  barrier(1);

  f = get_group_id(1) * 16 + get_local_id(0);
  g = get_group_id(0) * 16 + get_local_id(1);
  if ((f < d) && (g < c)) {
    unsigned int i = g * d + f;
    a[i] = e[get_local_id(0) * (16 + 1) + get_local_id(1)];
  }
}

__kernel void B(__global float* a, __global float* b, int c, int d) {
  unsigned int e = get_global_id(0);
  unsigned int f = get_global_id(1);

  if (e < c && f < d) {
    unsigned int g = e + c * f;
    unsigned int h = f + d * e;
    a[h] = b[g];
  }
}
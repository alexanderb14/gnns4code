float A(__global float* a, const uint b, const int c, __global const float* d) {
  (void)b;
  return a[c] * d[c];
}

__kernel void B(__global float* a, __global float* b, const uint c, const uint d, const uint e, const uint f, __global const float* g) {
  int h = get_global_id(0);
  int i = h + e;
  uint j = get_local_size(0) * get_num_groups(0);
  while (h < d) {
    b[h + f] = A(a + f, c, i, g);
    h += j;
  }
}
float C(float a, float b) {
  return (a + b);
}

__kernel void D(__global float* a, const uint b, __global float* c, const uint d, __local float* e, float f) {
  uint g = get_local_size(0);
  uint h = get_local_id(0);
  uint i = get_group_id(0) * g + get_local_id(0);
  uint j = g * get_num_groups(0);
  float k = f;
  a += b;
  if (i < d) {
    k = a[i];
    i += j;
  }
  while (i < d) {
    k = C(k, a[i]);
    i += j;
  }
  e[h] = k;
  barrier(1);
  if (g >= 512) {
    if (h < 256 && h + 256 < d) {
      e[h] = C(e[h], e[h + 256]);
    }
    barrier(1);
  }
  if (g >= 256) {
    if (h < 128 && h + 128 < d) {
      e[h] = C(e[h], e[h + 128]);
    }
    barrier(1);
  }
  if (g >= 128) {
    if (h < 64 && h + 64 < d) {
      e[h] = C(e[h], e[h + 64]);
    }
    barrier(1);
  }
  if (g >= 64) {
    if (h < 32 && h + 32 < d) {
      e[h] = C(e[h], e[h + 32]);
    }
    barrier(1);
  }
  if (g >= 32) {
    if (h < 16 && h + 16 < d) {
      e[h] = C(e[h], e[h + 16]);
    }
    barrier(1);
  }
  if (g >= 16) {
    if (h < 8 && h + 8 < d) {
      e[h] = C(e[h], e[h + 8]);
    }
    barrier(1);
  }
  if (g >= 8) {
    if (h < 4 && h + 4 < d) {
      e[h] = C(e[h], e[h + 4]);
    }
    barrier(1);
  }
  if (g >= 4) {
    if (h < 2 && h + 2 < d) {
      e[h] = C(e[h], e[h + 2]);
    }
    barrier(1);
  }
  if (g >= 2) {
    if (h < 1 && h + 1 < d) {
      e[h] = C(e[h], e[h + 1]);
    }
    barrier(1);
  }
  if (h == 0)
    c[get_group_id(0)] = e[h];
}
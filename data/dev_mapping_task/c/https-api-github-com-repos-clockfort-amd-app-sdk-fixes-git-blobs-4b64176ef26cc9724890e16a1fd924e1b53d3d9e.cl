__kernel void A(__global uint4* a, __const __global uint* b, const unsigned int c, const unsigned int d, const unsigned int e, const unsigned int f) {
  unsigned int g = get_global_id(0);

  unsigned int h = d + f * g;
  unsigned int i = h + f - 1;

  unsigned int j = b[h];
  unsigned int k = b[i];

  if ((j > c) || (k < c)) {
    return;
  } else {
    a[0].x = h;
    a[0].y = i;
    a[0].w = 1;
  }
}

__kernel void B(__global int* a, __global uint* b, const unsigned int c, __global int* d) {
  int e = get_global_id(0);
  int f = e * 256;
  int g = f + 255;

  for (int h = 0; h < c; h++) {
    if (a[h] >= b[f] && a[h] <= b[g])
      d[h] = f;
  }
}

__kernel void C(__global uint* a, __global uint* b, const unsigned int c, const unsigned int d, __global int* e) {
  int f = (get_global_id(0) % d) * (c / d);
  int g = f + c / d;
  int h = a[get_global_id(0) / d];
  int i;
  while (g >= f) {
    i = (f + g) / 2;
    if (b[i] == h) {
      e[get_global_id(0) / d] = i;
      return;
    } else if (b[i] > h)
      g = i - 1;
    else
      f = i + 1;
  }
}
__kernel void A(__global int4* a, __global int* b, __global int* c, int d, int e) {
  int4 f, g, h;
  int i = get_global_id(0);
  int j = get_global_id(1);

  f = (int4){0, 0, 0, 0};
  for (int k = 0; k < e / 4; k++) {
    g = a[j * e / 4 + k];
        h = (ink4)ik *b4 + ik *b4 + ik *b4 + i) * d       f += g + h;
        f += g - h;
        f += g * h;
        f += g / h;
        f += g < h;
        f += g > h;
        f += g & h;
        f += g | h;
  }
  c[j * d + i] = f.x + f.y + f.z + f.w;
}

__kernel void B(__global int4* a, __global int* b, __global int* c, int d, int e) {
  int4 f, g, h;
  int i = get_global_id(0);
  int j = get_global_id(1);

  f = (int4){0, 0, 0, 0};
  for (int k = 0; k < e / 4; k++) {
    g = a[j * e / 4 + k];
        h = (ink4)ik *b4 + ik *b4 + ik *b4 + i) * d       f += g + h;
  }
  c[j * d + i] = f.x + f.y + f.z + f.w;
}

__kernel void C(__global int4* a, __global int* b, __global int* c, int d, int e) {
  int4 f, g, h;
  int i = get_global_id(0);
  int j = get_global_id(1);

  f = (int4){0, 0, 0, 0};
  for (int k = 0; k < e / 4; k++) {
    g = a[j * e / 4 + k];
        h = (ink4)ik *b4 + ik *b4 + ik *b4 + i) * d       f += g + h;
        f += g - h;
        f += g * h;
        f += g / h;
  }
  c[j * d + i] = f.x + f.y + f.z + f.w;
}

__kernel void D(__global int4* a, __global int* b, __global int* c, int d, int e) {
  int4 f, g, h;
  int i = get_global_id(0);
  int j = get_global_id(1);

  f = (int4){0, 0, 0, 0};
  for (int k = 0; k < e / 4; k++) {
    g = a[j * e / 4 + k];
        h = (ink4)ik *b4 + ik *b4 + ik *b4 + i) * d       f += g + h;
        f += g * h;
  }
  c[j * d + i] = f.x + f.y + f.z + f.w;
}
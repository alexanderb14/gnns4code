__kernel void A(__global int* a, __global int* b, __global int* c, int d, int e) {
  int f, g, h;
  int i = get_global_id(0);
  int j = get_global_id(1);

  f = 0;
  for (int k = 0; k < e; k++) {
    g = a[j * e + k];
    h = b[k * d + i];
    f += g + h;
    f += g - h;
    f += g * h;
    f += g / h;
    f += g < h;
    f += g > h;
    f += g & h;
    f += g | h;
  }
  c[j * d + i] = f;
}

__kernel void B(__global int* a, __global int* b, __global int* c, int d, int e) {
  int f, g, h;
  int i = get_global_id(0);
  int j = get_global_id(1);

  f = 0;
  for (int k = 0; k < e; k++) {
    g = a[j * e + k];
    h = b[k * d + i];
    f += g + h;
  }
  c[j * d + i] = f;
}
__kernel void C(__global int* a, __global int* b, __global int* c, int d, int e) {
  int f, g, h;
  int i = get_global_id(0);
  int j = get_global_id(1);

  f = 0;
  for (int k = 0; k < e; k++) {
    g = a[j * e + k];
    h = b[k * d + i];
    f += g + h;
    f += g - h;
    f += g * h;
    f += g / h;
  }
  c[j * d + i] = f;
}
__kernel void D(__global int* a, __global int* b, __global int* c, int d, int e) {
  int f, g, h;
  int i = get_global_id(0);
  int j = get_global_id(1);

  f = 0;
  for (int k = 0; k < e; k++) {
    g = a[j * e + k];
    h = b[k * d + i];
    f += g + h;
    f += g * h;
  }
  c[j * d + i] = f;
}
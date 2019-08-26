typedef float2 magmaFloatComplex; __kernel void A(int a, __global magmaFloatComplex* b, int c, int d) {
  int e = get_group_id(0) * d + get_local_id(0);
  int f, g;
  b += (e + c);
  magmaFloatComplex h;

  h = (float2)(0.0, 0.0);

  for (f = 0; f < a; f += 32) {
    for (g = 0; g < a; g += 32)
      b[g] = h;
    b += 32 * d;
  }
}

__kernel void B(int a, int b, __global magmaFloatComplex* c, int d, int e) {
  int f = get_group_id(0) * 64;

  int g = get_group_id(1) * 32;

  int h = f + get_local_id(0);
  c += d + h + ((g) * (e));
  magmaFloatComplex i;

  i = (float2)(0.0, 0.0);

  for (int j = 0; j < 32; j++)
    if (g + j < b && h < a && h < j + g)
      c[j * e] = i;
}

__kernel void C(int a, int b, __global magmaFloatComplex* c, int d, int e) {
  int f = get_group_id(0) * 64;

  int g = get_group_id(1) * 32;

  int h = f + get_local_id(0);
  c += d + h + ((g) * (e));
  magmaFloatComplex i;

  i = (float2)(0.0, 0.0);

  for (int j = 0; j < 32; j++) {
    if (g + j < b && h < a && h > j + g)
      c[j * e] = i;
  }
}

__kernel void D(int a, int b, __global magmaFloatComplex* c, int d, int e) {
  int f = get_group_id(0) * 64;

  int g = get_group_id(1) * 32;

  int h = f + get_local_id(0);
  c += d + h + ((g) * (e));
  magmaFloatComplex i;

  i = (float2)(0.0, 0.0);

  for (int j = 0; j < 32; j++)
    if (g + j < b && h < a)
      c[j * e] = i;
}
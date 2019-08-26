__kernel void A(__global uchar* a, __global uchar* b, __global uchar* c) {
  int d = get_global_id(0);
  int e = 7;
  uchar f = a[d];
  uchar g = b[d];

  float h = convert_float(f);
  float i = convert_float(g);
  float j = __clc_fabs(h - i);

  if (j < e) {
    j = 255.0;
  } else {
    j = 0.0;
  }

  c[d] = convert_uchar(j);
}
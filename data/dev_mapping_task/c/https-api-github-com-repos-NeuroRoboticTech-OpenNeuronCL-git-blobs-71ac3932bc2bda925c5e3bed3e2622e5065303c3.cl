float A(float a, uchar b) {
  if (__clc_fabs(a) > 0)
    a -= (a * 0.064493000507354736);
  else
    a = 0;

  if (b)
    a += -2.4271199703216553;

  return a;
}

__kernel void B(__global float* a, __global float* b, __global float* c, __global int* d, __global float* e, __global float* f) {
  int g = get_global_id(0);
  float h = a[g];
  float i = b[g];
  float j = c[g];
  int k = d[g];
  uchar l = 0;
  uchar m = 0;

  i = A(i, l);

  h += (i + j - (h * 0.039210598915815353f));

  if (k > 0) {
    k--;
    l = 0;
  } else if (h > 20.0f)
    l = 1;
  else
    l = 0;

  if (m)
    k = 10;

  e[g] = h;
  b[g] = i;
  d[g] = k;
}
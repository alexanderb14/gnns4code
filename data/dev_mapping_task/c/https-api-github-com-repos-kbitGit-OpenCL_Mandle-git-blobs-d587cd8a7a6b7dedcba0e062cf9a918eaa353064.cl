__kernel void A(__global char* a, __global char* b, __global char* c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  double f = (-2.5 + d * ((1.5 - -2.5) / 8192));
  double g = (-2.0 + e * ((2.0 - -2.0) / 8192));

  int h = 0;
  if (g < 0)
    g *= -1;
  if (g < ((2.0 - -2.0) / 8192) / 2)
    g = 0;

  double i = 0.0;
  double j = 0.0;
  double k = i * i;
  double l = j * j;
  while (h < 20000 && ((k + l) < 4)) {
    j = 2 * i * j + g;
    i = k - l + f;
    k = i * i;
    l = j * j;
    h++;
  }
  a[e * 8192 + d] = 1;
  b[e * 8192 + d] = 1;
  c[e * 8192 + d] = 1;

  if (h < 20000) {
    a[e * 8192 + d] = 255;
    b[e * 8192 + d] = 255;
    c[e * 8192 + d] = 255;
  }
}
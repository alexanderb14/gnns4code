__kernel void A(__global uchar* a, __global uchar* b, size_t c, size_t d) {
  float e = 10;
  float f = 70;

  size_t g = get_global_id(0);
  size_t h = get_global_id(1);
  size_t i = g * d + h;

  const uchar j = 255;

  uchar k = a[i];

  if (k >= f)
    b[i] = j;
  else if (k <= e)
    b[i] = 0;
  else {
    float l = (f + e) / 2;

    if (k >= l)
      b[i] = j;
    else
      b[i] = 0;
  }
}
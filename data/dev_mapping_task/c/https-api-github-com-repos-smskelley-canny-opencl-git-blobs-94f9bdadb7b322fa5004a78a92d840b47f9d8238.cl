__kernel void A(__global uchar* a, __global uchar* b, size_t c, size_t d) {
  float e = 10;
  float f = 70;

  size_t g = get_global_id(0);
  size_t h = get_global_id(1);
  size_t i = g * d + h;

  const size_t j = 255;

  if (a[i] >= f)
    b[i] = j;
  else if (a[i] <= e)
    b[i] = 0;
  else {
    float k = (f + e) / 2;

    if (a[i] >= k)
      b[i] = j;
    else
      b[i] = 0;
  }
}
__kernel void A(__global uchar* a, __global uchar* b, __global uchar* c, size_t d, size_t e) {
  size_t f = get_global_id(0);
  size_t g = get_global_id(1);

  const size_t h = f * e + g;
  const size_t i = (f - 1) * e + g;
  const size_t j = (f - 1) * e + (g + 1);
  const size_t k = f * e + (g + 1);
  const size_t l = (f + 1) * e + (g + 1);
  const size_t m = (f + 1) * e + g;
  const size_t n = (f + 1) * e + (g - 1);
  const size_t o = f * e + (g - 1);
  const size_t p = (f - 1) * e + (g - 1);

  switch (c[h]) {
    case 0:

      if (a[h] <= a[k] || a[h] <= a[o]) {
        b[h] = 0;
      }

      else {
        b[h] = a[h];
      }
      break;

    case 45:

      if (a[h] <= a[j] || a[h] <= a[n]) {
        b[h] = 0;
      }

      else {
        b[h] = a[h];
      }
      break;

    case 90:

      if (a[h] <= a[i] || a[h] <= a[m]) {
        b[h] = 0;
      }

      else {
        b[h] = a[h];
      }
      break;

    case 135:

      if (a[h] <= a[p] || a[h] <= a[l]) {
        b[h] = 0;
      }

      else {
        b[h] = a[h];
      }
      break;

    default:
      b[h] = a[h];
      break;
  }
}
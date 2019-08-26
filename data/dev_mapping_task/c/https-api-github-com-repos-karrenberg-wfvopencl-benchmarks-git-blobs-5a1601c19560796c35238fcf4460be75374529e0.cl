__kernel void A(__global uint* a, const uint b, const uint c, const uint d, const uint e) {
  uint f = e;
  uint g = get_global_id(0);

  uint h = 1 << (b - c);
  uint i = 2 * h;

  uint j = (g % h) + (g / h) * i;

  uint k = j + h;

  uint l = a[j];
  uint m = a[k];

  uint n = 1 << b;

  if ((g / n) % 2 == 1)
    f = 1 - f;

  uint o;
  uint p;
  if (l > m) {
    o = l;
    p = m;
  } else {
    o = m;
    p = l;
  }

  if (f) {
    a[j] = p;
    a[k] = o;
  } else {
    a[j] = o;
    a[k] = p;
  }
}
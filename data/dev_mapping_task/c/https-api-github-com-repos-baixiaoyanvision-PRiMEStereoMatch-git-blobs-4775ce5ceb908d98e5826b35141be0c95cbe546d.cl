__kernel void A(__global const uchar* a, __global const uchar* b, __global const uchar* c, __global const uchar* d, const int e, const int f, __global uchar* g, __global uchar* h) {
  const int i = get_global_id(0);
  const int j = get_global_id(1);
  const int k = get_global_id(2);

  const int l = j * f;
  const int m = ((k * e) + j) * f;

  uchar n = *(a + (l * 3) + (3 * i));
  uchar o = *(a + (l * 3) + (3 * i) + 1);
  uchar p = *(a + (l * 3) + (3 * i) + 2);
  uchar q = *(c + l + i);
  uchar r, s, t, u;

  ushort v = 0;
  ushort w = 0;

  if (i >= abs(k)) {
    r = *(b + (l * 3) + 3 * (i - k));
    s = *(b + (l * 3) + 3 * (i - k) + 1);
    t = *(b + (l * 3) + 3 * (i - k) + 2);
    u = *(d + l + (i - k));

    v += abs(n - r);
    v += abs(o - s);
    v += abs(p - t);
    v /= 3;

    w = abs(q - u);
  } else {
    v += abs(n - 255);
    v += abs(o - 255);
    v += abs(p - 255);
    v /= 3;

    w = abs(q - 255);
  }

  v = v > 1835 ? 1835 : v;
  w = w > 524 ? 524 : w;
  *(g + m + i) = 0.9 * v + (1 - 0.9) * w;

  n = *(b + (l * 3) + (3 * i));
  o = *(b + (l * 3) + (3 * i) + 1);
  p = *(b + (l * 3) + (3 * i) + 2);
  q = *(d + l + i);

  v = 0;
  w = 0;

  if (i >= abs(k)) {
    r = *(a + (l * 3) + 3 * (i + k));
    s = *(a + (l * 3) + 3 * (i + k) + 1);
    t = *(a + (l * 3) + 3 * (i + k) + 2);
    u = *(c + l + (i + k));

    v += abs(n - r);
    v += abs(o - s);
    v += abs(p - t);
    v /= 3;

    w = abs(q - u);
  } else {
    v += abs(n - 255);
    v += abs(o - 255);
    v += abs(p - 255);
    v /= 3;

    w = abs(q - 255);
  }

  v = v > 1835 ? 1835 : v;
  w = w > 524 ? 524 : w;
  *(h + m + i) = 0.9 * v + (1 - 0.9) * w;
}
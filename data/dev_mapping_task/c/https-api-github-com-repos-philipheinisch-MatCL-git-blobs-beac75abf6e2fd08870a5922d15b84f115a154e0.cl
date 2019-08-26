kernel void A(global uchar* a, global uchar* b) {
  const int c = get_global_id(0);
  const int d = get_global_id(1);

  const int e = d * (uint)16;
  const int f = e - (uint)16;
  const int g = e + (uint)16;

  uchar h, i, j, k, l, m, n, o, p;
  h = a[f + c - 1];
  i = a[f + c];
  j = a[f + c + 1];

  k = a[e + c - 1];
  l = a[e + c];
  m = a[e + c + 1];

  n = a[g + c - 1];
  o = a[g + c];
  p = a[g + c + 1];

  uchar q = 0;

  uchar r = min(h, i);
  uchar s = max(h, i);
  h = r;
  i = s;

  r = min(k, j);
  s = max(k, j);
  k = r;
  j = s;

  r = min(j, h);
  s = max(j, h);
  j = r;
  h = s;

  r = min(k, i);
  s = max(k, i);
  k = r;
  i = s;

  r = min(i, h);
  s = max(i, h);
  i = r;
  h = s;

  r = min(k, j);
  s = max(k, j);
  k = r;
  j = s;

  r = min(m, l);
  s = max(m, l);
  m = r;
  l = s;

  r = min(o, p);
  s = max(o, p);
  o = r;
  p = s;

  r = min(n, p);
  s = max(n, p);
  n = r;
  p = s;

  r = min(n, o);
  s = max(n, o);
  n = r;
  o = s;

  r = min(l, p);
  s = max(l, p);
  l = r;
  p = s;

  r = min(l, n);
  s = max(l, n);
  l = r;
  n = s;

  r = min(m, o);
  s = max(m, o);
  m = r;
  o = s;

  r = min(l, m);
  s = max(l, m);
  l = r;
  m = s;

  r = min(n, o);
  s = max(n, o);
  n = r;
  o = s;

  r = min(h, p);
  s = max(h, p);
  h = r;
  p = s;

  l = max(h, l);
  m = max(i, m);

  n = max(j, n);
  o = max(k, o);

  l = min(l, n);
  m = min(m, o);

  b[e + c] = (uchar)min(l, m);
}
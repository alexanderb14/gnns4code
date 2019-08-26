kernel void A(const global ulong* a, global ulong* b) {
  const int c = get_global_id(0);
  const int d = get_global_id(1);

  if (d == 0 || d == get_global_size(1))
    return;

  const int e = get_global_size(0);
  const int f = get_global_size(1);
  const int g = e * f;

  const int h = get_local_id(0);
  const int i = get_local_id(1);

  const int j = c * get_local_size(0) + get_local_id(0) + d * get_local_size(1);

  __local ulong k[1920][1];

  k[h][0] = a[c + (d - 1) * e];
  k[h][1] = a[c + (d)*e];
  k[h][2] = a[c + (d + 1) * e];

  barrier(1);

  if (h == 0 || h == get_local_size(0) - 1)
    return;

  ulong l = 0;
  ulong m = 0xFFFFFF;

  for (int n = 0; n < 3; n++) {
    ulong o, p, q, r, s, t, u, v, w;
    o = k[h][i] & m;
    p = k[h + 1][i] & m;
    q = k[h + 1][i + 1] & m;
    r = k[h][i + 1] & m;
    s = k[h][i - 1] & m;
    t = k[h - 1][i - 1] & m;
    u = k[h - 1][i] & m;
    v = k[h - 1][i + 1] & m;
    w = k[h + 1][i - 1] & m;

    ulong x = min(o, p);
    ulong y = max(o, p);
    o = x;
    p = y;

    x = min(r, q);
    y = max(r, q);
    r = x;
    q = y;

    x = min(q, o);
    y = max(q, o);
    q = x;
    o = y;

    x = min(r, p);
    y = max(r, p);
    r = x;
    p = y;

    x = min(p, o);
    y = max(p, o);
    p = x;
    o = y;

    x = min(r, q);
    y = max(r, q);
    r = x;
    q = y;

    x = min(t, s);
    y = max(t, s);
    t = x;
    s = y;

    x = min(v, w);
    y = max(v, w);
    v = x;
    w = y;

    x = min(u, w);
    y = max(u, w);
    u = x;
    w = y;

    x = min(u, v);
    y = max(u, v);
    u = x;
    v = y;

    x = min(s, w);
    y = max(s, w);
    s = x;
    w = y;

    x = min(s, u);
    y = max(s, u);
    s = x;
    u = y;

    x = min(t, v);
    y = max(t, v);
    t = x;
    v = y;

    x = min(s, t);
    y = max(s, t);
    s = x;
    t = y;

    x = min(u, v);
    y = max(u, v);
    u = x;
    v = y;

    x = min(o, w);
    y = max(o, w);
    o = x;
    w = y;

    s = max(o, s);
    t = max(p, t);

    u = max(q, u);
    v = max(r, v);

    s = min(s, u);
    t = min(t, v);

    l |= min(s, t);

    m <<= 8;
  }

  b[c + d * e] = k[h][i];
}
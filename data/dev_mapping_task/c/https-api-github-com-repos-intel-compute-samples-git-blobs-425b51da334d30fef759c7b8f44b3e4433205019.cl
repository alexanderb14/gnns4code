kernel void A(const global uint* a, global uint* b) {
  const int c = get_global_id(0);
  const int d = get_global_id(1);

  const int e = get_global_size(0);
  const int f = get_global_size(1);

  const int g = d * e;
  const int h = g - e;
  const int i = g + e;
  uint j[9];

  if (((h + c - 1) >= 0) && ((i + c + 1) < (f * e))) {
    j[0] = a[h + c - 1];
    j[1] = a[h + c];
    j[2] = a[h + c + 1];

    j[3] = a[g + c - 1];
    j[4] = a[g + c];
    j[5] = a[g + c + 1];

    j[6] = a[i + c - 1];
    j[7] = a[i + c];
    j[8] = a[i + c + 1];

    uint k = 0;
    uint l = 0xFF;

    for (int m = 0; m < 4; m++) {
      uint n, o, p, q, r, s, t, u, v;
      n = j[0] & l;
      o = j[1] & l;
      p = j[2] & l;
      q = j[3] & l;
      r = j[4] & l;
      s = j[5] & l;
      t = j[6] & l;
      u = j[7] & l;
      v = j[8] & l;

      uint w = min(n, o);
      uint x = max(n, o);
      n = w;
      o = x;

      w = min(q, p);
      x = max(q, p);
      q = w;
      p = x;

      w = min(p, n);
      x = max(p, n);
      p = w;
      n = x;

      w = min(q, o);
      x = max(q, o);
      q = w;
      o = x;

      w = min(o, n);
      x = max(o, n);
      o = w;
      n = x;

      w = min(q, p);
      x = max(q, p);
      q = w;
      p = x;

      w = min(s, r);
      x = max(s, r);
      s = w;
      r = x;

      w = min(u, v);
      x = max(u, v);
      u = w;
      v = x;

      w = min(t, v);
      x = max(t, v);
      t = w;
      v = x;

      w = min(t, u);
      x = max(t, u);
      t = w;
      u = x;

      w = min(r, v);
      x = max(r, v);
      r = w;
      v = x;

      w = min(r, t);
      x = max(r, t);
      r = w;
      t = x;

      w = min(s, u);
      x = max(s, u);
      s = w;
      u = x;

      w = min(r, s);
      x = max(r, s);
      r = w;
      s = x;

      w = min(t, u);
      x = max(t, u);
      t = w;
      u = x;

      w = min(n, v);
      x = max(n, v);
      n = w;
      v = x;

      r = max(n, r);
      s = max(o, s);

      t = max(p, t);
      u = max(q, u);

      r = min(r, t);
      s = min(s, u);

      k |= r;

      l <<= 8;
    }

    b[g + c] = k;
  } else {
    b[g + c] = a[g + c];
  }
}
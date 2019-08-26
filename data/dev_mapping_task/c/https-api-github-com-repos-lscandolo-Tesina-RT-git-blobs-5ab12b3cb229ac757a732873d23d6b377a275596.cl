typedef float data_t; kernel void A(global data_t* a, global data_t* b, int c, int d, local data_t* e) {
  int f = get_local_id(0);
  int g = f + c / 2;

  e[f] = a[f];
  if (g < c)
    e[g] = a[g];
  barrier(1);

  for (int h = 1; h < d; h <<= 1) {
    int i = (h << 1);
    bool j = ((c - 1) & i) == 0 && i != d;
    bool k = (i) == d;

    for (int l = h; l > 0; l >>= 1) {
      int m = f & (l - 1);
      int n = (f << 1) - m;
      bool o = !(i & n) && !k;

      int p = n + l;
      data_t q, r;
      q = e[n];
      if (n + l < c)
        r = e[p];

      bool s = (r < q);
      bool t = ((s) == o) == j;
      barrier(1);
      if (t && (n + l < c)) {
        e[n] = r;
        e[p] = q;
      }
      barrier(1);
    }
  }

  a[f] = e[f];
  if (g < c)
    a[g] = e[g];
}

kernel void B(global data_t* a, global data_t* b, int c, int d, int e, int f, int g) {
  int h = get_global_id(0);

  int i = h & (c - 1);
  h = (h << 1) - i;

  a += h;
  if (h + c >= g)
    return;

  data_t j = a[0];
  data_t k = a[c];

  bool l = !(d & h) && !f;
  bool m = (k < j);

  bool n = (m == l) == e;

  if (n) {
    a[0] = k;
    a[c] = j;
  }

  return;
}

kernel void C(global data_t* a, global data_t* b, int c, int d, int e, int f, int g) {
  int h = get_global_id(0);

  int i = h & (c - 1);
  h = ((h - i) << 2) + i;

  a += h;
  if (h + c >= g)
    return;

  bool j = h + 2 * c < g;
  bool k = h + 3 * c < g;
  data_t l, m, n, o, p;

  l = a[0];
  m = a[c];
  if (j)
    n = a[2 * c];
  if (k)
    o = a[3 * c];

  bool q = !(d & h) && !f;
  bool r;

  if (j) {
    {
      r = ((n < l) == q) == e;
      if (r) {
        p = l;
        l = n;
        n = p;
      }
    };
  }

  if (k) {
    {
      r = ((o < m) == q) == e;
      if (r) {
        p = m;
        m = o;
        o = p;
      }
    };
    {
      r = ((o < n) == q) == e;
      if (r) {
        p = n;
        n = o;
        o = p;
      }
    };
  }
  {
    r = ((m < l) == q) == e;
    if (r) {
      p = l;
      l = m;
      m = p;
    }
  };

  a[0] = l;
  a[c] = m;
  if (j)
    a[2 * c] = n;
  if (k)
    a[3 * c] = o;

  return;
}
kernel void D(global data_t* a, global data_t* b, int c, int d, int e, int f, int g) {
  int h = get_global_id(0);

  int i = h & (c - 1);
  h = ((h - i) << 3) + i;

  a += h;
  if (h + c >= g)
    return;
  bool j = !(d & h) && !f;

  data_t k[8];
  int l = 0;
  for (int m = 0; m < 8; ++m) {
    k[m] = a[l];
    l += c;
  }

  bool n;
  data_t o;

  {
    for (int p = 0; p < 4; p++) {
      {
        if ((h + ((0 + p + 4) * c) < g)) {
          n = ((k[0 + p + 4] < k[0 + p]) == j) == e;
          if (n) {
            o = k[0 + p];
            k[0 + p] = k[0 + p + 4];
            k[0 + p + 4] = o;
          }
        }
      }
    }
    {
      for (int q = 0; q < 2; q++) {
        {
          if ((h + ((0 + q + 2) * c) < g)) {
            n = ((k[0 + q + 2] < k[0 + q]) == j) == e;
            if (n) {
              o = k[0 + q];
              k[0 + q] = k[0 + q + 2];
              k[0 + q + 2] = o;
            }
          }
        }
      }
      {{if ((h + ((0 + 1) * c) < g)){n = ((k[0 + 1] < k[0]) == j) == e;
      if (n) {
        o = k[0];
        k[0] = k[0 + 1];
        k[0 + 1] = o;
      }
    }
  }
}
{
  {
    if ((h + ((0 + 2 + 1) * c) < g)) {
      n = ((k[0 + 2 + 1] < k[0 + 2]) == j) == e;
      if (n) {
        o = k[0 + 2];
        k[0 + 2] = k[0 + 2 + 1];
        k[0 + 2 + 1] = o;
      }
    }
  }
}
}
{
  for (int q = 0; q < 2; q++) {
    {
      if ((h + ((0 + 4 + q + 2) * c) < g)) {
        n = ((k[0 + 4 + q + 2] < k[0 + 4 + q]) == j) == e;
        if (n) {
          o = k[0 + 4 + q];
          k[0 + 4 + q] = k[0 + 4 + q + 2];
          k[0 + 4 + q + 2] = o;
        }
      }
    }
  }
  {{if ((h + ((0 + 4 + 1) * c) < g)){n = ((k[0 + 4 + 1] < k[0 + 4]) == j) == e;
  if (n) {
    o = k[0 + 4];
    k[0 + 4] = k[0 + 4 + 1];
    k[0 + 4 + 1] = o;
  }
}
}
}
{
  {
    if ((h + ((0 + 4 + 2 + 1) * c) < g)) {
      n = ((k[0 + 4 + 2 + 1] < k[0 + 4 + 2]) == j) == e;
      if (n) {
        o = k[0 + 4 + 2];
        k[0 + 4 + 2] = k[0 + 4 + 2 + 1];
        k[0 + 4 + 2 + 1] = o;
      }
    }
  }
}
}
}
;

l = 0;
for (int m = 0; m < 8 && (h + ((m)*c) < g); ++m) {
  a[l] = k[m];
  l += c;
}

return;
}

kernel void E(global data_t* a, global data_t* b, int c, int d, int e, int f, int g) {
  int h = get_global_id(0);

  int i = h & (c - 1);
  h = ((h - i) << 4) + i;

  a += h;
  if (h + c >= g)
    return;
  bool j = !(d & h) && !f;

  data_t k[16];
  int l = 0;
  for (int m = 0; m < 16; ++m) {
    k[m] = a[l];
    l += c;
  }

  bool n;
  data_t o;

  {
    for (int p = 0; p < 8; p++) {
      {
        if ((h + ((0 + p + 8) * c) < g)) {
          n = ((k[0 + p + 8] < k[0 + p]) == j) == e;
          if (n) {
            o = k[0 + p];
            k[0 + p] = k[0 + p + 8];
            k[0 + p + 8] = o;
          }
        }
      }
    }
    {
      for (int q = 0; q < 4; q++) {
        {
          if ((h + ((0 + q + 4) * c) < g)) {
            n = ((k[0 + q + 4] < k[0 + q]) == j) == e;
            if (n) {
              o = k[0 + q];
              k[0 + q] = k[0 + q + 4];
              k[0 + q + 4] = o;
            }
          }
        }
      }
      {
        for (int r = 0; r < 2; r++) {
          {
            if ((h + ((0 + r + 2) * c) < g)) {
              n = ((k[0 + r + 2] < k[0 + r]) == j) == e;
              if (n) {
                o = k[0 + r];
                k[0 + r] = k[0 + r + 2];
                k[0 + r + 2] = o;
              }
            }
          }
        }
        {{if ((h + ((0 + 1) * c) < g)){n = ((k[0 + 1] < k[0]) == j) == e;
        if (n) {
          o = k[0];
          k[0] = k[0 + 1];
          k[0 + 1] = o;
        }
      }
    }
  }
  {
    {
      if ((h + ((0 + 2 + 1) * c) < g)) {
        n = ((k[0 + 2 + 1] < k[0 + 2]) == j) == e;
        if (n) {
          o = k[0 + 2];
          k[0 + 2] = k[0 + 2 + 1];
          k[0 + 2 + 1] = o;
        }
      }
    }
  }
}
{
  for (int r = 0; r < 2; r++) {
    {
      if ((h + ((0 + 4 + r + 2) * c) < g)) {
        n = ((k[0 + 4 + r + 2] < k[0 + 4 + r]) == j) == e;
        if (n) {
          o = k[0 + 4 + r];
          k[0 + 4 + r] = k[0 + 4 + r + 2];
          k[0 + 4 + r + 2] = o;
        }
      }
    }
  }
  {{if ((h + ((0 + 4 + 1) * c) < g)){n = ((k[0 + 4 + 1] < k[0 + 4]) == j) == e;
  if (n) {
    o = k[0 + 4];
    k[0 + 4] = k[0 + 4 + 1];
    k[0 + 4 + 1] = o;
  }
}
}
}
{
  {
    if ((h + ((0 + 4 + 2 + 1) * c) < g)) {
      n = ((k[0 + 4 + 2 + 1] < k[0 + 4 + 2]) == j) == e;
      if (n) {
        o = k[0 + 4 + 2];
        k[0 + 4 + 2] = k[0 + 4 + 2 + 1];
        k[0 + 4 + 2 + 1] = o;
      }
    }
  }
}
}
}
{
  for (int q = 0; q < 4; q++) {
    {
      if ((h + ((0 + 8 + q + 4) * c) < g)) {
        n = ((k[0 + 8 + q + 4] < k[0 + 8 + q]) == j) == e;
        if (n) {
          o = k[0 + 8 + q];
          k[0 + 8 + q] = k[0 + 8 + q + 4];
          k[0 + 8 + q + 4] = o;
        }
      }
    }
  }
  {
    for (int r = 0; r < 2; r++) {
      {
        if ((h + ((0 + 8 + r + 2) * c) < g)) {
          n = ((k[0 + 8 + r + 2] < k[0 + 8 + r]) == j) == e;
          if (n) {
            o = k[0 + 8 + r];
            k[0 + 8 + r] = k[0 + 8 + r + 2];
            k[0 + 8 + r + 2] = o;
          }
        }
      }
    }
    {{if ((h + ((0 + 8 + 1) * c) < g)){n = ((k[0 + 8 + 1] < k[0 + 8]) == j) == e;
    if (n) {
      o = k[0 + 8];
      k[0 + 8] = k[0 + 8 + 1];
      k[0 + 8 + 1] = o;
    }
  }
}
}
{
  {
    if ((h + ((0 + 8 + 2 + 1) * c) < g)) {
      n = ((k[0 + 8 + 2 + 1] < k[0 + 8 + 2]) == j) == e;
      if (n) {
        o = k[0 + 8 + 2];
        k[0 + 8 + 2] = k[0 + 8 + 2 + 1];
        k[0 + 8 + 2 + 1] = o;
      }
    }
  }
}
}
{
  for (int r = 0; r < 2; r++) {
    {
      if ((h + ((0 + 8 + 4 + r + 2) * c) < g)) {
        n = ((k[0 + 8 + 4 + r + 2] < k[0 + 8 + 4 + r]) == j) == e;
        if (n) {
          o = k[0 + 8 + 4 + r];
          k[0 + 8 + 4 + r] = k[0 + 8 + 4 + r + 2];
          k[0 + 8 + 4 + r + 2] = o;
        }
      }
    }
  }
  {{if ((h + ((0 + 8 + 4 + 1) * c) < g)){n = ((k[0 + 8 + 4 + 1] < k[0 + 8 + 4]) == j) == e;
  if (n) {
    o = k[0 + 8 + 4];
    k[0 + 8 + 4] = k[0 + 8 + 4 + 1];
    k[0 + 8 + 4 + 1] = o;
  }
}
}
}
{
  {
    if ((h + ((0 + 8 + 4 + 2 + 1) * c) < g)) {
      n = ((k[0 + 8 + 4 + 2 + 1] < k[0 + 8 + 4 + 2]) == j) == e;
      if (n) {
        o = k[0 + 8 + 4 + 2];
        k[0 + 8 + 4 + 2] = k[0 + 8 + 4 + 2 + 1];
        k[0 + 8 + 4 + 2 + 1] = o;
      }
    }
  }
}
}
}
}
;

l = 0;
for (int m = 0; m < 16 && (h + ((m)*c) < g); ++m) {
  a[l] = k[m];
  l += c;
}

return;
}

kernel void F(global data_t* a, global data_t* b, int c, int d, int e, int f, int g) {
  int h = get_global_id(0);

  int i = h & (c - 1);
  h = ((h - i) << 5) + i;

  a += h;
  if (h + c >= g)
    return;
  bool j = !(d & h) && !f;

  data_t k[32];
  int l = 0;
  for (int m = 0; m < 32; ++m) {
    k[m] = a[l];
    l += c;
  }

  bool n;
  data_t o;

  {
    for (int p = 0; p < 16; p++) {
      {
        if ((h + ((0 + p + 16) * c) < g)) {
          n = ((k[0 + p + 16] < k[0 + p]) == j) == e;
          if (n) {
            o = k[0 + p];
            k[0 + p] = k[0 + p + 16];
            k[0 + p + 16] = o;
          }
        }
      }
    }
    {
      for (int q = 0; q < 8; q++) {
        {
          if ((h + ((0 + q + 8) * c) < g)) {
            n = ((k[0 + q + 8] < k[0 + q]) == j) == e;
            if (n) {
              o = k[0 + q];
              k[0 + q] = k[0 + q + 8];
              k[0 + q + 8] = o;
            }
          }
        }
      }
      {
        for (int r = 0; r < 4; r++) {
          {
            if ((h + ((0 + r + 4) * c) < g)) {
              n = ((k[0 + r + 4] < k[0 + r]) == j) == e;
              if (n) {
                o = k[0 + r];
                k[0 + r] = k[0 + r + 4];
                k[0 + r + 4] = o;
              }
            }
          }
        }
        {
          for (int s = 0; s < 2; s++) {
            {
              if ((h + ((0 + s + 2) * c) < g)) {
                n = ((k[0 + s + 2] < k[0 + s]) == j) == e;
                if (n) {
                  o = k[0 + s];
                  k[0 + s] = k[0 + s + 2];
                  k[0 + s + 2] = o;
                }
              }
            }
          }
          {{if ((h + ((0 + 1) * c) < g)){n = ((k[0 + 1] < k[0]) == j) == e;
          if (n) {
            o = k[0];
            k[0] = k[0 + 1];
            k[0 + 1] = o;
          }
        }
      }
    }
    {
      {
        if ((h + ((0 + 2 + 1) * c) < g)) {
          n = ((k[0 + 2 + 1] < k[0 + 2]) == j) == e;
          if (n) {
            o = k[0 + 2];
            k[0 + 2] = k[0 + 2 + 1];
            k[0 + 2 + 1] = o;
          }
        }
      }
    }
  }
  {
    for (int s = 0; s < 2; s++) {
      {
        if ((h + ((0 + 4 + s + 2) * c) < g)) {
          n = ((k[0 + 4 + s + 2] < k[0 + 4 + s]) == j) == e;
          if (n) {
            o = k[0 + 4 + s];
            k[0 + 4 + s] = k[0 + 4 + s + 2];
            k[0 + 4 + s + 2] = o;
          }
        }
      }
    }
    {{if ((h + ((0 + 4 + 1) * c) < g)){n = ((k[0 + 4 + 1] < k[0 + 4]) == j) == e;
    if (n) {
      o = k[0 + 4];
      k[0 + 4] = k[0 + 4 + 1];
      k[0 + 4 + 1] = o;
    }
  }
}
}
{
  {
    if ((h + ((0 + 4 + 2 + 1) * c) < g)) {
      n = ((k[0 + 4 + 2 + 1] < k[0 + 4 + 2]) == j) == e;
      if (n) {
        o = k[0 + 4 + 2];
        k[0 + 4 + 2] = k[0 + 4 + 2 + 1];
        k[0 + 4 + 2 + 1] = o;
      }
    }
  }
}
}
}
{
  for (int r = 0; r < 4; r++) {
    {
      if ((h + ((0 + 8 + r + 4) * c) < g)) {
        n = ((k[0 + 8 + r + 4] < k[0 + 8 + r]) == j) == e;
        if (n) {
          o = k[0 + 8 + r];
          k[0 + 8 + r] = k[0 + 8 + r + 4];
          k[0 + 8 + r + 4] = o;
        }
      }
    }
  }
  {
    for (int s = 0; s < 2; s++) {
      {
        if ((h + ((0 + 8 + s + 2) * c) < g)) {
          n = ((k[0 + 8 + s + 2] < k[0 + 8 + s]) == j) == e;
          if (n) {
            o = k[0 + 8 + s];
            k[0 + 8 + s] = k[0 + 8 + s + 2];
            k[0 + 8 + s + 2] = o;
          }
        }
      }
    }
    {{if ((h + ((0 + 8 + 1) * c) < g)){n = ((k[0 + 8 + 1] < k[0 + 8]) == j) == e;
    if (n) {
      o = k[0 + 8];
      k[0 + 8] = k[0 + 8 + 1];
      k[0 + 8 + 1] = o;
    }
  }
}
}
{
  {
    if ((h + ((0 + 8 + 2 + 1) * c) < g)) {
      n = ((k[0 + 8 + 2 + 1] < k[0 + 8 + 2]) == j) == e;
      if (n) {
        o = k[0 + 8 + 2];
        k[0 + 8 + 2] = k[0 + 8 + 2 + 1];
        k[0 + 8 + 2 + 1] = o;
      }
    }
  }
}
}
{
  for (int s = 0; s < 2; s++) {
    {
      if ((h + ((0 + 8 + 4 + s + 2) * c) < g)) {
        n = ((k[0 + 8 + 4 + s + 2] < k[0 + 8 + 4 + s]) == j) == e;
        if (n) {
          o = k[0 + 8 + 4 + s];
          k[0 + 8 + 4 + s] = k[0 + 8 + 4 + s + 2];
          k[0 + 8 + 4 + s + 2] = o;
        }
      }
    }
  }
  {{if ((h + ((0 + 8 + 4 + 1) * c) < g)){n = ((k[0 + 8 + 4 + 1] < k[0 + 8 + 4]) == j) == e;
  if (n) {
    o = k[0 + 8 + 4];
    k[0 + 8 + 4] = k[0 + 8 + 4 + 1];
    k[0 + 8 + 4 + 1] = o;
  }
}
}
}
{
  {
    if ((h + ((0 + 8 + 4 + 2 + 1) * c) < g)) {
      n = ((k[0 + 8 + 4 + 2 + 1] < k[0 + 8 + 4 + 2]) == j) == e;
      if (n) {
        o = k[0 + 8 + 4 + 2];
        k[0 + 8 + 4 + 2] = k[0 + 8 + 4 + 2 + 1];
        k[0 + 8 + 4 + 2 + 1] = o;
      }
    }
  }
}
}
}
}
{
  for (int q = 0; q < 8; q++) {
    {
      if ((h + ((0 + 16 + q + 8) * c) < g)) {
        n = ((k[0 + 16 + q + 8] < k[0 + 16 + q]) == j) == e;
        if (n) {
          o = k[0 + 16 + q];
          k[0 + 16 + q] = k[0 + 16 + q + 8];
          k[0 + 16 + q + 8] = o;
        }
      }
    }
  }
  {
    for (int r = 0; r < 4; r++) {
      {
        if ((h + ((0 + 16 + r + 4) * c) < g)) {
          n = ((k[0 + 16 + r + 4] < k[0 + 16 + r]) == j) == e;
          if (n) {
            o = k[0 + 16 + r];
            k[0 + 16 + r] = k[0 + 16 + r + 4];
            k[0 + 16 + r + 4] = o;
          }
        }
      }
    }
    {
      for (int s = 0; s < 2; s++) {
        {
          if ((h + ((0 + 16 + s + 2) * c) < g)) {
            n = ((k[0 + 16 + s + 2] < k[0 + 16 + s]) == j) == e;
            if (n) {
              o = k[0 + 16 + s];
              k[0 + 16 + s] = k[0 + 16 + s + 2];
              k[0 + 16 + s + 2] = o;
            }
          }
        }
      }
      {{if ((h + ((0 + 16 + 1) * c) < g)){n = ((k[0 + 16 + 1] < k[0 + 16]) == j) == e;
      if (n) {
        o = k[0 + 16];
        k[0 + 16] = k[0 + 16 + 1];
        k[0 + 16 + 1] = o;
      }
    }
  }
}
{
  {
    if ((h + ((0 + 16 + 2 + 1) * c) < g)) {
      n = ((k[0 + 16 + 2 + 1] < k[0 + 16 + 2]) == j) == e;
      if (n) {
        o = k[0 + 16 + 2];
        k[0 + 16 + 2] = k[0 + 16 + 2 + 1];
        k[0 + 16 + 2 + 1] = o;
      }
    }
  }
}
}
{
  for (int s = 0; s < 2; s++) {
    {
      if ((h + ((0 + 16 + 4 + s + 2) * c) < g)) {
        n = ((k[0 + 16 + 4 + s + 2] < k[0 + 16 + 4 + s]) == j) == e;
        if (n) {
          o = k[0 + 16 + 4 + s];
          k[0 + 16 + 4 + s] = k[0 + 16 + 4 + s + 2];
          k[0 + 16 + 4 + s + 2] = o;
        }
      }
    }
  }
  {{if ((h + ((0 + 16 + 4 + 1) * c) < g)){n = ((k[0 + 16 + 4 + 1] < k[0 + 16 + 4]) == j) == e;
  if (n) {
    o = k[0 + 16 + 4];
    k[0 + 16 + 4] = k[0 + 16 + 4 + 1];
    k[0 + 16 + 4 + 1] = o;
  }
}
}
}
{
  {
    if ((h + ((0 + 16 + 4 + 2 + 1) * c) < g)) {
      n = ((k[0 + 16 + 4 + 2 + 1] < k[0 + 16 + 4 + 2]) == j) == e;
      if (n) {
        o = k[0 + 16 + 4 + 2];
        k[0 + 16 + 4 + 2] = k[0 + 16 + 4 + 2 + 1];
        k[0 + 16 + 4 + 2 + 1] = o;
      }
    }
  }
}
}
}
{
  for (int r = 0; r < 4; r++) {
    {
      if ((h + ((0 + 16 + 8 + r + 4) * c) < g)) {
        n = ((k[0 + 16 + 8 + r + 4] < k[0 + 16 + 8 + r]) == j) == e;
        if (n) {
          o = k[0 + 16 + 8 + r];
          k[0 + 16 + 8 + r] = k[0 + 16 + 8 + r + 4];
          k[0 + 16 + 8 + r + 4] = o;
        }
      }
    }
  }
  {
    for (int s = 0; s < 2; s++) {
      {
        if ((h + ((0 + 16 + 8 + s + 2) * c) < g)) {
          n = ((k[0 + 16 + 8 + s + 2] < k[0 + 16 + 8 + s]) == j) == e;
          if (n) {
            o = k[0 + 16 + 8 + s];
            k[0 + 16 + 8 + s] = k[0 + 16 + 8 + s + 2];
            k[0 + 16 + 8 + s + 2] = o;
          }
        }
      }
    }
    {{if ((h + ((0 + 16 + 8 + 1) * c) < g)){n = ((k[0 + 16 + 8 + 1] < k[0 + 16 + 8]) == j) == e;
    if (n) {
      o = k[0 + 16 + 8];
      k[0 + 16 + 8] = k[0 + 16 + 8 + 1];
      k[0 + 16 + 8 + 1] = o;
    }
  }
}
}
{
  {
    if ((h + ((0 + 16 + 8 + 2 + 1) * c) < g)) {
      n = ((k[0 + 16 + 8 + 2 + 1] < k[0 + 16 + 8 + 2]) == j) == e;
      if (n) {
        o = k[0 + 16 + 8 + 2];
        k[0 + 16 + 8 + 2] = k[0 + 16 + 8 + 2 + 1];
        k[0 + 16 + 8 + 2 + 1] = o;
      }
    }
  }
}
}
{
  for (int s = 0; s < 2; s++) {
    {
      if ((h + ((0 + 16 + 8 + 4 + s + 2) * c) < g)) {
        n = ((k[0 + 16 + 8 + 4 + s + 2] < k[0 + 16 + 8 + 4 + s]) == j) == e;
        if (n) {
          o = k[0 + 16 + 8 + 4 + s];
          k[0 + 16 + 8 + 4 + s] = k[0 + 16 + 8 + 4 + s + 2];
          k[0 + 16 + 8 + 4 + s + 2] = o;
        }
      }
    }
  }
  {{if ((h + ((0 + 16 + 8 + 4 + 1) * c) < g)){n = ((k[0 + 16 + 8 + 4 + 1] < k[0 + 16 + 8 + 4]) == j) == e;
  if (n) {
    o = k[0 + 16 + 8 + 4];
    k[0 + 16 + 8 + 4] = k[0 + 16 + 8 + 4 + 1];
    k[0 + 16 + 8 + 4 + 1] = o;
  }
}
}
}
{
  {
    if ((h + ((0 + 16 + 8 + 4 + 2 + 1) * c) < g)) {
      n = ((k[0 + 16 + 8 + 4 + 2 + 1] < k[0 + 16 + 8 + 4 + 2]) == j) == e;
      if (n) {
        o = k[0 + 16 + 8 + 4 + 2];
        k[0 + 16 + 8 + 4 + 2] = k[0 + 16 + 8 + 4 + 2 + 1];
        k[0 + 16 + 8 + 4 + 2 + 1] = o;
      }
    }
  }
}
}
}
}
}
;

l = 0;
for (int m = 0; m < 32 && (h + ((m)*c) < g); ++m) {
  a[l] = k[m];
  l += c;
}

return;
}

kernel void G(global data_t* a, global data_t* b, int c, int d, int e, int f, int g, int h, local data_t* i)

{
  int j = get_global_id(0);
  int k = 2 * h - 1;

  for (int l = c; l > 0; l >>= 1) {
    int m = j & (l - 1);
    int n = (j << 1) - m;
    bool o = !(d & n) && !f;
    data_t p, q;

    bool r = n + l >= g;

    if (l == c) {
      p = a[n];
      if (!r)
        q = a[n + l];
    } else {
      barrier(1);
      p = i[n & k];
      if (!r)
        q = i[(n + l) & k];
    }

    bool s = (q < p);
    bool t = ((s == o) == e) && !r;
    if (t) {
      data_t i = p;
      p = q;
      q = i;
    }

    if (l == 1) {
      a[n] = p;
      if (!r)
        a[n + l] = q;
    } else {
      barrier(1);
      i[n & k] = p;
      if (!r)
        i[(n + l) & k] = q;
    }
  }
}

kernel void H(global data_t* a, global data_t* b, int c, int d, int e, int f, int g, int h, local data_t* i) {
  int j = get_global_id(0);
  int k = 4 * h - 1;

  int l, m, n;
  bool o;
  data_t p[4], q;

  l = c >> 1;
  m = j & (l - 1);
  n = ((j - m) << 2) + m;

  bool r = !(d & n) && !f;

  for (int s = 0; s < 4; s++)
    if ((n + ((s)*l) < g))
      p[s] = a[n + s * l];

  {
    for (int t = 0; t < 2; t++) {
      {
        if ((n + ((0 + t + 2) * l) < g)) {
          o = ((p[0 + t + 2] < p[0 + t]) == r) == e;
          if (o) {
            q = p[0 + t];
            p[0 + t] = p[0 + t + 2];
            p[0 + t + 2] = q;
          }
        }
      }
    }
    {{if ((n + ((0 + 1) * l) < g)){o = ((p[0 + 1] < p[0]) == r) == e;
    if (o) {
      q = p[0];
      p[0] = p[0 + 1];
      p[0 + 1] = q;
    }
  }
}
}
{
  {
    if ((n + ((0 + 2 + 1) * l) < g)) {
      o = ((p[0 + 2 + 1] < p[0 + 2]) == r) == e;
      if (o) {
        q = p[0 + 2];
        p[0 + 2] = p[0 + 2 + 1];
        p[0 + 2 + 1] = q;
      }
    }
  }
}
}
;

for (int s = 0; s < 4; s++)
  if ((n + ((s)*l) < g))
    i[(n + s * l) & k] = p[s];
barrier(1);

for (; l > 1; l >>= 2) {
  m = j & (l - 1);
  n = ((j - m) << 2) + m;
  r = !(d & n) && !f;
  for (int s = 0; s < 4; s++)
    if ((n + ((s)*l) < g))
      p[s] = i[(n + s * l) & k];
  {
    for (int t = 0; t < 2; t++) {
      {
        if ((n + ((0 + t + 2) * l) < g)) {
          o = ((p[0 + t + 2] < p[0 + t]) == r) == e;
          if (o) {
            q = p[0 + t];
            p[0 + t] = p[0 + t + 2];
            p[0 + t + 2] = q;
          }
        }
      }
    }
    {{if ((n + ((0 + 1) * l) < g)){o = ((p[0 + 1] < p[0]) == r) == e;
    if (o) {
      q = p[0];
      p[0] = p[0 + 1];
      p[0 + 1] = q;
    }
  }
}
}
{
  {
    if ((n + ((0 + 2 + 1) * l) < g)) {
      o = ((p[0 + 2 + 1] < p[0 + 2]) == r) == e;
      if (o) {
        q = p[0 + 2];
        p[0 + 2] = p[0 + 2 + 1];
        p[0 + 2 + 1] = q;
      }
    }
  }
}
}
;
barrier(1);
for (int s = 0; s < 4; s++)
  if ((n + ((s)*l) < g))
    i[(n + s * l) & k] = p[s];
barrier(1);
}

n = j << 2;
r = !(d & n) && !f;
for (int s = 0; s < 4; s++)
  if (n + s < g)
    p[s] = i[(n + s) & k];
{
  for (int t = 0; t < 2; t++) {
    {
      if ((n + ((0 + t + 2) * l) < g)) {
        o = ((p[0 + t + 2] < p[0 + t]) == r) == e;
        if (o) {
          q = p[0 + t];
          p[0 + t] = p[0 + t + 2];
          p[0 + t + 2] = q;
        }
      }
    }
  }
  {{if ((n + ((0 + 1) * l) < g)){o = ((p[0 + 1] < p[0]) == r) == e;
  if (o) {
    q = p[0];
    p[0] = p[0 + 1];
    p[0 + 1] = q;
  }
}
}
}
{
  {
    if ((n + ((0 + 2 + 1) * l) < g)) {
      o = ((p[0 + 2 + 1] < p[0 + 2]) == r) == e;
      if (o) {
        q = p[0 + 2];
        p[0 + 2] = p[0 + 2 + 1];
        p[0 + 2 + 1] = q;
      }
    }
  }
}
}
;
for (int s = 0; s < 4; s++)
  if (n + s < g)
    a[n + s] = p[s];
}

kernel void I(local unsigned int* a, local unsigned int* b) {
  size_t c = get_local_id(0);
  size_t d = get_local_size(0);

  int e = 1;

  b[2 * c] = a[2 * c];
  b[2 * c + 1] = a[2 * c + 1];

  for (int f = d; f > 0; f >>= 1) {
    barrier(1);

    if (c < f) {
      int g = e * (2 * c + 1) - 1;
      int h = g + e;
      b[h] += b[g];
    }
    e <<= 1;
  }
  barrier(1);

  if (c == 0) {
    b[d * 2 - 1] = 0;
  }

  for (int f = 1; f < d << 1; f <<= 1) {
    e >>= 1;
    barrier(1);
    if (c < f) {
      int g = e * (2 * c + 1) - 1;
      int h = g + e;
      int i = b[g];
      b[g] = b[h];
      b[h] += i;
    }
  }
  barrier(1);
}

kernel void J(local unsigned int* a, local unsigned int* b, local unsigned int* c, local unsigned int* d) {
  size_t e = get_local_id(0);
  size_t f = get_local_size(0);

  unsigned int g = c[2 * f - 1] + b[2 * f - 1];

  bool h = !b[2 * e];
  bool i = !b[2 * e + 1];

  unsigned int j = h ? 2 * e - c[2 * e] + g : c[2 * e];
  unsigned int k = i ? (2 * e + 1) - c[2 * e + 1] + g : c[2 * e + 1];

  d[j] = a[2 * e];
  d[k] = a[2 * e + 1];
  barrier(1);
}

void K(local unsigned int* a, unsigned int b, local unsigned int* c, global unsigned int* d) {
  size_t e = get_local_id(0);
  size_t f = get_local_size(0);
  size_t g = get_group_id(0);
  size_t h = get_num_groups(0);

  unsigned int i, j;

  i = (c[e] >> (4 * b)) & 0xf;
  j = (c[e + 1] >> (4 * b)) & 0xf;

  if (e <= 0xf)
    a[e] = 0;
  barrier(1);

  if (i != j) {
    a[i] = e + 1;
  }

  i = (c[e + f] >> (4 * b)) & 0xf;
  if (e != f - 1) {
    j = (c[e + f + 1] >> (4 * b)) & 0xf;
    if (i != j)
      a[i] = e + f + 1;
  } else {
    a[i] = 2 * f;
  }
  barrier(1);

  if (e == 0) {
    for (int k = 1; k < (1 << 4); ++k)
      if (a[k] == 0)
        a[k] = a[k - 1];
  }
  barrier(1);

  if (e == 0) {
    d[g] = a[0];
  } else if (e < (1 << 4)) {
    d[g + e * h] = a[e] - a[e - 1];
  }
  barrier(1);
}

kernel void L(global unsigned int* a, local unsigned int* b, local unsigned int* c, local unsigned int* d, local unsigned int* e, unsigned int f, unsigned int g, local unsigned int* h, global unsigned int* i, global unsigned int* j) {
  size_t k = get_global_id(0);

  size_t l = get_local_id(0);
  size_t m = get_local_size(0);
  size_t n = get_group_id(0);

  size_t o = 2 * m * n;
  a += 2 * m * n;
  j += 2 * m * n;

  if (o + 2 * l < g)
    b[2 * l] = a[2 * l];
  else
    b[2 * l] = 0xffffffffu;

  if (o + 2 * l + 1 < g)
    b[2 * l + 1] = a[2 * l + 1];
  else
    b[2 * l + 1] = 0xffffffffu;

  barrier(1);

  unsigned int p = 0x1 << (4 * f);
  unsigned int q = 0;

  do {
    c[2 * l] = !(b[2 * l] & p);
    barrier(1);
    c[2 * l + 1] = !(b[2 * l + 1] & p);
    barrier(1);

    I(c, e);
    barrier(1);

    J(b, c, e, d);
    barrier(1);

    p <<= 1;
    q++;

    if (q < 4) {
      b[2 * l] = d[2 * l];
      b[2 * l + 1] = d[2 * l + 1];
      barrier(1);
    }

  } while (q < 4);

  K(h, f, d, i);
  barrier(2 | 1);

  j[2 * l] = d[2 * l];
  j[2 * l + 1] = d[2 * l + 1];
  return;
}

kernel void M(global unsigned int* a, global unsigned int* b, unsigned int c, unsigned int d, local unsigned int* e) {
  size_t f = get_global_id(0);

  size_t g = get_local_id(0);
  size_t h = get_local_size(0);
  size_t i = get_group_id(0);

  size_t j = i * c;
  a += j;

  if (j + 2 * g < d)
    e[2 * g] = a[2 * g];

  if (j + 2 * g + 1 < d)
    e[2 * g + 1] = a[2 * g + 1];
  barrier(1);

  int k = 1;
  for (int l = h; l > 0; l >>= 1) {
    barrier(1);

    if (g < l) {
      int m = k * (2 * g + 1) - 1;
      int n = m + k;
      e[n] += e[m];
    }
    k <<= 1;
  }
  barrier(1);

  if (g == 0) {
    b[i] = e[h * 2 - 1];
    e[h * 2 - 1] = 0;
  }

  for (int l = 1; l < h << 1; l <<= 1) {
    k >>= 1;
    barrier(1);
    if (g < l) {
      int m = k * (2 * g + 1) - 1;
      int n = m + k;
      int o = e[m];
      e[m] = e[n];
      e[n] += o;
    }
  }
  barrier(1);

  if (j + 2 * g < d)
    a[2 * g] = e[2 * g];

  if (j + 2 * g + 1 < d)
    a[2 * g + 1] = e[2 * g + 1];
}

kernel void N(global unsigned int* a, local unsigned int* b, unsigned int c, unsigned int d, global unsigned int* e) {
  size_t f = get_global_id(0);
  size_t g = get_local_id(0);

  if (g == 0) {
    b[0] = 0;
  }
  barrier(1);

  for (unsigned int h = 1; h < c; ++h) {
    if (g == 0) {
      b[h] = a[h - 1] + b[h - 1];
    }
  }
  barrier(1);

  unsigned int i = b[0];
  e[f] += i;
}

kernel void O(global unsigned int* a, global unsigned int* b, unsigned int c, unsigned int d, local unsigned int* e, global unsigned int* f) {
  size_t g = get_global_id(0);

  size_t h = get_local_size(0);
  size_t i = get_local_id(0);

  size_t j = get_group_id(0);
  size_t k = get_num_groups(0);

  unsigned int l = ((j / 2) % c);

  if (i < (1 << 4)) {
    e[i] = b[l + c * i + 1];
    e[i] -= b[l + c * i];
  }
  if (l == c - 1 && i == (1 << 4) - 1) {
    e[i] = get_global_size(0);
    e[i] -= b[l + c * i];
  }
  barrier(1);
  unsigned int m = 0, n;
  for (int o = 1; o < (1 << 4); ++o) {
    if (i == 0) {
      n = e[o - 1] + m;
      m = e[o];
      e[o] = n;
    }
  }

  if (i == 0)
    e[0] = 0;

  barrier(1);

  unsigned int p = i + h * (j % 2);

  unsigned int q = (1 << 4) - 1;
  unsigned int r = p - e[(1 << 4) - 1];
  for (int o = 1; o < (1 << 4); ++o) {
    if (p < e[o]) {
      q = o - 1;
      r = p - e[o - 1];
      break;
    }
  }

  unsigned int s = l + c * q;
  unsigned int t = b[s] + r;

  if (t < d)
    f[t] = a[g];
}
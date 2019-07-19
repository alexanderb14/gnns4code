typedef struct { unsigned int code[2]; } morton_code_t;

int A(morton_code_t a, morton_code_t b) {
  if (2 == 1) {
    return a.code[0] < b.code[0];
  } else if (2 == 2) {
    return (a.code[1] == b.code[1] && a.code[0] < b.code[0]) || a.code[1] < b.code[1];
  } else {
    for (int c = 0; c < 2 - 1; ++c) {
      if (a.code[c] != b.code[c])
        return a.code[c] < b.code[c];
    }
    return a.code[2 - 1] < b.code[2 - 1];
  }
}

kernel void B(global morton_code_t* a, global unsigned int* b, int c, int d, int e, int f, int g) {
  int h = get_global_id(0);

  int i = h & (c - 1);
  h = (h << 1) - i;

  b += h;
  if (h + c >= g)
    return;

  morton_code_t j = a[b[0]];
  morton_code_t k = a[b[c]];

  bool l = !(d & h) && !f;
  bool m = A(k, j);

  bool n = (m == l) == e;

  if (n) {
    unsigned int o;
    o = b[0];
    b[0] = b[c];
    b[c] = o;
  }

  return;
}
kernel void C(global morton_code_t* a, global unsigned int* b, int c, int d, int e, int f, int g) {
  int h = get_global_id(0);

  int i = h & (c - 1);
  h = ((h - i) << 2) + i;

  b += h;
  if (h + c >= g)
    return;
  bool j = !(d & h) && !f;

  morton_code_t k[4];
  unsigned int l[4];
  unsigned int m[4];
  int n = 0;
  for (int o = 0; o < 4 && (h + ((o)*c) < g); ++o) {
    k[o] = a[b[n]];
    l[o] = o;
    m[o] = b[n];
    n += c;
  }

  bool p;
  unsigned int q;

  {
    for (int r = 0; r < 2; r++) {
      {
        if ((h + ((0 + r + 2) * c) < g)) {
          p = (A(k[l[0 + r + 2]], k[l[0 + r]]) == j) == e;
          if (p) {
            q = l[0 + r];
            l[0 + r] = l[0 + r + 2];
            l[0 + r + 2] = q;
          }
        }
      };
    }
    {{if ((h + ((0 + 1) * c) < g)){p = (A(k[l[0 + 1]], k[l[0]]) == j) == e;
    if (p) {
      q = l[0];
      l[0] = l[0 + 1];
      l[0 + 1] = q;
    }
  }
}
}
{{if ((h + ((0 + 2 + 1) * c) < g)){p = (A(k[l[0 + 2 + 1]], k[l[0 + 2]]) == j) == e;
if (p) {
  q = l[0 + 2];
  l[0 + 2] = l[0 + 2 + 1];
  l[0 + 2 + 1] = q;
}
}
}
}
;
}
;

n = 0;
for (int o = 0; o < 4 && (h + ((o)*c) < g) && (h + ((l[o]) * c) < g); ++o) {
  b[n] = m[l[o]];
  n += c;
}

return;
}

kernel void D(global morton_code_t* a, global unsigned int* b, int c, int d, int e, int f, int g) {
  int h = get_global_id(0);

  int i = h & (c - 1);
  h = ((h - i) << 3) + i;

  b += h;
  if (h + c >= g)
    return;
  bool j = !(d & h) && !f;

  morton_code_t k[8];
  unsigned int l[8];
  unsigned int m[8];
  int n = 0;
  for (int o = 0; o < 8 && (h + ((o)*c) < g); ++o) {
    k[o] = a[b[n]];
    l[o] = o;
    m[o] = b[n];
    n += c;
  }

  bool p;
  unsigned int q;

  {
    for (int r = 0; r < 4; r++) {
      {
        if ((h + ((0 + r + 4) * c) < g)) {
          p = (A(k[l[0 + r + 4]], k[l[0 + r]]) == j) == e;
          if (p) {
            q = l[0 + r];
            l[0 + r] = l[0 + r + 4];
            l[0 + r + 4] = q;
          }
        }
      };
    }
    {
      for (int s = 0; s < 2; s++) {
        {
          if ((h + ((0 + s + 2) * c) < g)) {
            p = (A(k[l[0 + s + 2]], k[l[0 + s]]) == j) == e;
            if (p) {
              q = l[0 + s];
              l[0 + s] = l[0 + s + 2];
              l[0 + s + 2] = q;
            }
          }
        };
      }
      {{if ((h + ((0 + 1) * c) < g)){p = (A(k[l[0 + 1]], k[l[0]]) == j) == e;
      if (p) {
        q = l[0];
        l[0] = l[0 + 1];
        l[0 + 1] = q;
      }
    }
  }
}
{{if ((h + ((0 + 2 + 1) * c) < g)){p = (A(k[l[0 + 2 + 1]], k[l[0 + 2]]) == j) == e;
if (p) {
  q = l[0 + 2];
  l[0 + 2] = l[0 + 2 + 1];
  l[0 + 2 + 1] = q;
}
}
}
}
;
}
{
  for (int s = 0; s < 2; s++) {
    {
      if ((h + ((0 + 4 + s + 2) * c) < g)) {
        p = (A(k[l[0 + 4 + s + 2]], k[l[0 + 4 + s]]) == j) == e;
        if (p) {
          q = l[0 + 4 + s];
          l[0 + 4 + s] = l[0 + 4 + s + 2];
          l[0 + 4 + s + 2] = q;
        }
      }
    };
  }
  {{if ((h + ((0 + 4 + 1) * c) < g)){p = (A(k[l[0 + 4 + 1]], k[l[0 + 4]]) == j) == e;
  if (p) {
    q = l[0 + 4];
    l[0 + 4] = l[0 + 4 + 1];
    l[0 + 4 + 1] = q;
  }
}
}
}
{{if ((h + ((0 + 4 + 2 + 1) * c) < g)){p = (A(k[l[0 + 4 + 2 + 1]], k[l[0 + 4 + 2]]) == j) == e;
if (p) {
  q = l[0 + 4 + 2];
  l[0 + 4 + 2] = l[0 + 4 + 2 + 1];
  l[0 + 4 + 2 + 1] = q;
}
}
}
}
;
}
;
}
;

n = 0;
for (int o = 0; o < 8 && (h + ((o)*c) < g) && (h + ((l[o]) * c) < g); ++o) {
  b[n] = m[l[o]];
  n += c;
}

return;
}

kernel void E(global morton_code_t* a, global unsigned int* b, int c, int d, int e, int f, int g) {
  int h = get_global_id(0);

  int i = h & (c - 1);
  h = ((h - i) << 4) + i;

  b += h;
  if (h + c >= g)
    return;
  bool j = !(d & h) && !f;

  morton_code_t k[16];
  unsigned int l[16];
  unsigned int m[16];
  int n = 0;
  for (int o = 0; o < 16 && (h + ((o)*c) < g); ++o) {
    k[o] = a[b[n]];
    l[o] = o;
    m[o] = b[n];
    n += c;
  }

  bool p;
  unsigned int q;

  {
    for (int r = 0; r < 8; r++) {
      {
        if ((h + ((0 + r + 8) * c) < g)) {
          p = (A(k[l[0 + r + 8]], k[l[0 + r]]) == j) == e;
          if (p) {
            q = l[0 + r];
            l[0 + r] = l[0 + r + 8];
            l[0 + r + 8] = q;
          }
        }
      };
    }
    {
      for (int s = 0; s < 4; s++) {
        {
          if ((h + ((0 + s + 4) * c) < g)) {
            p = (A(k[l[0 + s + 4]], k[l[0 + s]]) == j) == e;
            if (p) {
              q = l[0 + s];
              l[0 + s] = l[0 + s + 4];
              l[0 + s + 4] = q;
            }
          }
        };
      }
      {
        for (int t = 0; t < 2; t++) {
          {
            if ((h + ((0 + t + 2) * c) < g)) {
              p = (A(k[l[0 + t + 2]], k[l[0 + t]]) == j) == e;
              if (p) {
                q = l[0 + t];
                l[0 + t] = l[0 + t + 2];
                l[0 + t + 2] = q;
              }
            }
          };
        }
        {{if ((h + ((0 + 1) * c) < g)){p = (A(k[l[0 + 1]], k[l[0]]) == j) == e;
        if (p) {
          q = l[0];
          l[0] = l[0 + 1];
          l[0 + 1] = q;
        }
      }
    }
  }
  {{if ((h + ((0 + 2 + 1) * c) < g)){p = (A(k[l[0 + 2 + 1]], k[l[0 + 2]]) == j) == e;
  if (p) {
    q = l[0 + 2];
    l[0 + 2] = l[0 + 2 + 1];
    l[0 + 2 + 1] = q;
  }
}
}
}
;
}
{
  for (int t = 0; t < 2; t++) {
    {
      if ((h + ((0 + 4 + t + 2) * c) < g)) {
        p = (A(k[l[0 + 4 + t + 2]], k[l[0 + 4 + t]]) == j) == e;
        if (p) {
          q = l[0 + 4 + t];
          l[0 + 4 + t] = l[0 + 4 + t + 2];
          l[0 + 4 + t + 2] = q;
        }
      }
    };
  }
  {{if ((h + ((0 + 4 + 1) * c) < g)){p = (A(k[l[0 + 4 + 1]], k[l[0 + 4]]) == j) == e;
  if (p) {
    q = l[0 + 4];
    l[0 + 4] = l[0 + 4 + 1];
    l[0 + 4 + 1] = q;
  }
}
}
}
{{if ((h + ((0 + 4 + 2 + 1) * c) < g)){p = (A(k[l[0 + 4 + 2 + 1]], k[l[0 + 4 + 2]]) == j) == e;
if (p) {
  q = l[0 + 4 + 2];
  l[0 + 4 + 2] = l[0 + 4 + 2 + 1];
  l[0 + 4 + 2 + 1] = q;
}
}
}
}
;
}
;
}
{
  for (int s = 0; s < 4; s++) {
    {
      if ((h + ((0 + 8 + s + 4) * c) < g)) {
        p = (A(k[l[0 + 8 + s + 4]], k[l[0 + 8 + s]]) == j) == e;
        if (p) {
          q = l[0 + 8 + s];
          l[0 + 8 + s] = l[0 + 8 + s + 4];
          l[0 + 8 + s + 4] = q;
        }
      }
    };
  }
  {
    for (int t = 0; t < 2; t++) {
      {
        if ((h + ((0 + 8 + t + 2) * c) < g)) {
          p = (A(k[l[0 + 8 + t + 2]], k[l[0 + 8 + t]]) == j) == e;
          if (p) {
            q = l[0 + 8 + t];
            l[0 + 8 + t] = l[0 + 8 + t + 2];
            l[0 + 8 + t + 2] = q;
          }
        }
      };
    }
    {{if ((h + ((0 + 8 + 1) * c) < g)){p = (A(k[l[0 + 8 + 1]], k[l[0 + 8]]) == j) == e;
    if (p) {
      q = l[0 + 8];
      l[0 + 8] = l[0 + 8 + 1];
      l[0 + 8 + 1] = q;
    }
  }
}
}
{{if ((h + ((0 + 8 + 2 + 1) * c) < g)){p = (A(k[l[0 + 8 + 2 + 1]], k[l[0 + 8 + 2]]) == j) == e;
if (p) {
  q = l[0 + 8 + 2];
  l[0 + 8 + 2] = l[0 + 8 + 2 + 1];
  l[0 + 8 + 2 + 1] = q;
}
}
}
}
;
}
{
  for (int t = 0; t < 2; t++) {
    {
      if ((h + ((0 + 8 + 4 + t + 2) * c) < g)) {
        p = (A(k[l[0 + 8 + 4 + t + 2]], k[l[0 + 8 + 4 + t]]) == j) == e;
        if (p) {
          q = l[0 + 8 + 4 + t];
          l[0 + 8 + 4 + t] = l[0 + 8 + 4 + t + 2];
          l[0 + 8 + 4 + t + 2] = q;
        }
      }
    };
  }
  {{if ((h + ((0 + 8 + 4 + 1) * c) < g)){p = (A(k[l[0 + 8 + 4 + 1]], k[l[0 + 8 + 4]]) == j) == e;
  if (p) {
    q = l[0 + 8 + 4];
    l[0 + 8 + 4] = l[0 + 8 + 4 + 1];
    l[0 + 8 + 4 + 1] = q;
  }
}
}
}
{{if ((h + ((0 + 8 + 4 + 2 + 1) * c) < g)){p = (A(k[l[0 + 8 + 4 + 2 + 1]], k[l[0 + 8 + 4 + 2]]) == j) == e;
if (p) {
  q = l[0 + 8 + 4 + 2];
  l[0 + 8 + 4 + 2] = l[0 + 8 + 4 + 2 + 1];
  l[0 + 8 + 4 + 2 + 1] = q;
}
}
}
}
;
}
;
}
;
}
;

n = 0;
for (int o = 0; o < 16 && (h + ((o)*c) < g) && (h + ((l[o]) * c) < g); ++o) {
  b[n] = m[l[o]];
  n += c;
}

return;
}
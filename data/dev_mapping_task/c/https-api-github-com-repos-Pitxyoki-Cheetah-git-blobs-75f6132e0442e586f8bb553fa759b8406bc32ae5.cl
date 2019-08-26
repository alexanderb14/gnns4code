struct node {
  int sp;
  int osp;
  float time;
  int I;
  int cut;
  int dna;
  __global struct node* a[2];
  __global struct node* d[2];
};

struct nodeptr {
  __global struct node* ptr;
};

__global struct node* A(__global struct node* a, __private int* b) {
  return &(a[(*b)++]);
}

unsigned int B(__private unsigned int* a) {
  (*a) = (*a) * 1103515245 + 12345;
  return ((unsigned)((*a)) % 0xffffffff);
}

__private float C(__private unsigned int* a) {
  __private float b = B(a) / (0xffffffff * 1.0f);
  return b;
}

int D(int a, int b, __private unsigned int* c) {
  unsigned int d = B(c);
  return ((unsigned)d % (b - a + 1) + a);
}

float E(__private unsigned int* a) {
  unsigned int b = B(a);
  float c = (-log(b / (1.0f * 0xffffffff)));
  return c;
}

void F(int a,

       __global int* b, __private float c, __global struct nodeptr* d, __global int* e, __private int* f, __global struct nodeptr* g, __private int* h,

       __private unsigned int* i, __global struct node* j, __private int* k) {
  int l, m, n;
  __global struct node* o;

  while (1) {
    l = D(0, b[a] - 1, i);
    m = D(0, b[a] - 1, i);
    if (m != l)
      break;
  }
  if (l > m) {
    n = l;
    l = m;
    m = n;
  }
  o = A(j, k);
  o->time = c;
  o->d[0] = d[(a * 300) + l].ptr;
  o->d[1] = d[(a * 300) + m].ptr;
  o->a[0] = o->a[1] = 0;
  o->dna = 0;
  o->I = 0;
  o->sp = e[a];
  d[(a * 300) + l].ptr->a[0] = o;
  d[(a * 300) + m].ptr->a[0] = o;
  d[(a * 300) + l].ptr->a[1] = d[(a * 300) + m].ptr->a[1] = 0;
  d[(a * 300) + l].ptr = o;
  d[(a * 300) + m].ptr = d[(a * 300) + b[a] - 1].ptr;
  --b[a];
  (*f)--;
  g[(*h)].ptr = o;
  (*h)++;

  return;
}

void G(int a, int b,

       __global int* c, __private unsigned int* d, __global int* e, __global struct nodeptr* f, __private int* g, __global int* h

       ) {
  int i, j, k, l, m;
  __global struct node* n;

  i = D(0, c[a] - 1, d);

  while (1) {
    j = D(0, b - 1, d);
    if (j != e[a])
      break;
  }

  f[(a * 300) + i].ptr->sp = j;
  n = f[(a * 300) + i].ptr;
  f[(a * 300) + i].ptr = f[(a * 300) + c[a] - 1].ptr;
  for (k = 0; k < (*g); ++k) {
    if (e[k] == j)
      break;
  }
  if (k == (*g)) {
    if (c[a] == 1) {
      k = a;
      e[k] = j;
      c[k] = 0;
    } else {
      (*g)++;
      e[k] = j;
      c[k] = 0;
      --c[a];
    }
  } else {
    if (c[a] == 1) {
      for (l = a; l < (*g) - 1; ++l) {
        e[l] = e[l + 1];
        c[l] = c[l + 1];
        if (c[l] >= h[l]) {
          h[l] *= 2;
        }
        for (m = 0; m < c[l]; ++m) {
          f[(l * 300) + m].ptr = f[((l + 1) * 300) + m].ptr;
        }
      }
      (*g)--;
      if (k > a)
        --k;
    } else {
      --c[a];
    }
  }
  f[(k * 300) + c[k]].ptr = n;
  ++c[k];
}

void H(__global float* a, __global int* b, __global float* c, __global int* d, __global float* e, __private int f, __private float* g) {
  a[0 + 0] = c[b[0]] * d[0] * (d[0] - 1.0f) * 0.5f;
  a[0 + 1] = a[0 + 0] + e[b[0]] * d[0];
  for (int h = 1; h < f; ++h) {
    a[(h * 2) + 0] = a[((h - 1) * 2) + 1] + c[b[h]] * d[h] * (d[h] - 1.0f) * 0.5f;
    a[(h * 2) + 1] = a[(h * 2) + 0] + e[b[h]] * d[h];
  }
  (*g) = a[((f - 1) * 2) + 1];
}

__private int I(int a, int b,

                __private unsigned int* c, __private int* d) {
  int e;
  if (b) {
    e = D(0, 1, c) * 2 - 1;
    return a + e;
  } else {
    (*d)++;
    return (*d);
  }
}

float J(float a) {
  float b, c, d;
  float e[6] = {76.18009173f, -86.50532033f, 24.01409822f, -1.231739516f, 0.120858003e-2f, -0.536382e-5f};
  int f;

  b = a - 1.0f;
  c = b + 5.5f;
  c -= (b + 0.5f) * log(c);
  d = 1.0f;
  for (f = 0; f <= 5; f++) {
    b += 1.0f;
    d += e[f] / b;
  }
  return -c + log(2.50662827465f * d);
}

int K(float a,

      __private unsigned int* b) {
  float c, d, e, f = (-1.0f);
  float g, h, i;

  if (a < 12.0f) {
    if (a != f) {
      f = a;
      e = exp(-a);
    }
    g = -1;
    h = 1.0f;
    do {
      g += 1.0f;
      h *= C(b);
    } while (h > e);
  } else {
    if (a != f) {
      f = a;
      c = sqrt(2.0f * a);
      d = log(a);
      e = a * d - J(a + 1.0f);
    }
    do {
      do {
        i = tan(3.141592653589793f * C(b));
        g = c * i + a;
      } while (g < 0.0f);
      g = __clc_floor(g);
      h = 0.9f * (1.0f + i * i) * exp(g * d - J(g + 1.0f) - e);
    } while (C(b) > h);
  }
  return (int)(g + 0.5f);
}

void L(__global struct node* a, int* b, float c, int d, int e, int f,

       __global int* g, __global int* h, __private unsigned int* i, __private int* j) {
  int k, l, m, n;
  float o;

  if (a->a[0] == 0 && a->a[1] == 0) {
    return;
  } else {
    a->dna = a->a[0]->dna;
  }
  o = a->a[0]->time - a->time;
  l = K(o * c, i);
  for (k = 0; k < l; ++k) {
    a->dna = I(a->dna, d, i, j);
  }
  if (a->d[0] == 0 && a->d[1] == 0) {
    m = a->osp;
    for (k = 0; k < *b; ++k) {
      if (g[(m * 50 * 100) + k] == a->dna) {
        break;
      }
    }
    if (k < *b) {
      ++h[(m * 50 * 100) + k];
    } else {
      for (n = 0; n < e; ++n) {
        g[(n * 50 * 100) + k] = a->dna;
        h[(n * 50 * 100) + k] = 0;
      }
      h[(m * 50 * 100) + k] = 1;
      (*b)++;
    }
    return;
  }
  return;
}

int M(__global int* a, __private int b, __private int* c, __private float d, __private float e, __private int f, __private int g, __private int h, __private int i,

      __global float* j, __global float* k, __global int* l, __global int* m, __global int* n, __global struct nodeptr* o, __global struct nodeptr* p, __global float* q, __global struct node* r,

      __private unsigned int* s, __global int* t, __global int* u) {
  __private int v;
  __private int w;
  __private int x;
  __private int y;
  __private float z;

  __private int aa;
  __private int ab;
  __private int ac;
  __private int ad;

  __private float ae;
  __private float af;

  __private int ag = 0;

  aa = 0;
  (*c) = 0;
  for (v = 0; v < f; ++v) {
    j[v] = f / 0.5f;
    k[v] = j[v] * e;
  }
  ab = g;
  for (v = 0; v < f; ++v)
    l[v] = 0;
  for (v = 0; v < g; ++v) {
    l[v] = v;
  }
  for (v = 0; v < f; ++v) {
    m[v] = a[v];
  }
  ad = b;
  w = 10 * ad;

  x = 0;
  for (y = 0; y < f; ++y) {
    n[y] = 2 * a[y];
    if (n[y] < 10)
      n[y] = 10;
  }

  for (y = 0; y < f; ++y) {
    for (v = 0; v < m[y]; ++v) {
      if (ag == 8000)
        return -1;

      __global struct node* ah = A(r, &ag);

      ah->d[0] = ah->d[1] = 0;
      ah->a[0] = ah->a[1] = 0;
      ah->time = 0.0f;
      ah->dna = 0;
      ah->I = 0;
      ah->sp = l[y];
      ah->osp = l[y];
      p[x].ptr = ah;

      o[(y * 300) + v].ptr = ah;
      ++x;
    }
  }

  ac = ad;
  ae = 0.0f;

startcycle:

  if (ab > f) {
    return 1;
  }
  for (y = 0; y < ab; ++y) {
    if (m[y] > n[y]) {
      return 2;
    }
    if (m[y] >= n[y] - 5) {
      n[y] = 2 * n[y];
      if (m[y] > n[y]) {
        return 3;
      }
      for (v = 0; v < m[y]; ++v) {
        if (o[(y * 300) + v].ptr->sp != l[y]) {
          return 4;
        }
      }

      for (v = 0; v < m[y]; ++v) {
        if (o[(y * 300) + v].ptr->sp != l[y]) {
          return 5;
        }
      }
    }
  }
  if (ac >= w - 1) {
    w = 2 * w;
  }

  H(q, l, j, m, k, ab, &af);

  ae += E(s) / af;

  bool ai = false;
  while (ai == false) {
    z = C(s);
    for (y = 0; y < ab; ++y) {
      for (v = 0; v < 2; ++v) {
        if (z < q[(y * 2) + v] / af) {
          ai = true;
          break;
        }
      }
      if (ai)
        break;
    }
  }

  if (v == 0) {
    if (ag == 8000)
      return -1;
    F(y, m, ae, o, l, &ad, p, &ac, s, r, &ag);

  } else {
    G(y, f, m, s, l, o, &ab, n);
  }
  if (v != 0 || (v == 0 && ad != 1))
    goto startcycle;

  p[ac - 1].ptr->dna = 0;
  (*c) = 0;
  for (v = ac - 1; v >= 0; --v) {
    L(p[v].ptr, c, d, i, g, h, t, u, s, &aa);
  }

  return 0;
}

void N(__private int a, __global int* b, __private int c,

       __private float* d, __private float* e,

       __global int* f) {
  int g, h, i;
  float j, k, l, m, n, o;

  k = 0.0f;
  for (h = 0; h < c; ++h) {
    for (g = 0, j = 0.0f; g < a; ++g) {
      j += f[(h * 50 * 100) + g] * f[(h * 50 * 100) + g];
    }
    k += (j - b[h]) / (b[h] * (b[h] - 1));
  }

  l = 0.0f;
  for (h = 0; h < c; ++h) {
    for (i = h + 1; i < c; ++i) {
      for (g = 0, m = 0.0f; g < a; ++g) {
        m += f[(h * 50 * 100) + g] * f[(i * 50 * 100) + g];
      }
      l += m / (b[h] * b[i]);
    }
  }

  n = k / c;
  o = 2 * l / (c * (c - 1));

  float p = 1.0f - n;
  *d = 1.0f - o;
  *e = 1.0f - (p) / (*d);
}
__kernel void O(

    __global int* a, __global int* b, __global unsigned int* c, __global int* d, __global int* e, __global int* f, __global int* g, __global int* h, __global float* i,

    __global struct node* j, __global struct nodeptr* k, __global struct nodeptr* l,

    __global float* m, __global float* n, __global float* o, __global int* p, __global int* q, __global int* r, __global int* s, __global int* t,

    __global float* u, __global float* v, __global float* w, __global float* x) {
  __private int y = get_global_id(0);
  if (get_global_size(1) > 1)
    y += (get_global_id(1) * get_global_size(0));

  __private int z = (*a) / get_global_size(0);
  if (get_global_size(1) > 1)
    z = z / get_global_size(1);

  __private int aa = *b;
  __private unsigned int ab = (*c) + y;
  __private int ac = *d;
  __private int ad = *e;
  __private int ae = *g;
  __private int af = *h;

  __global struct node* ag = &(j[y * 8000]);
  __global struct nodeptr* ah = &(k[y * 200 * 300]);
  __global struct nodeptr* ai = &(l[y * 8000]);

  __global float* aj = &(m[y * 200]);
  __global float* ak = &(n[y * 200]);
  __global float* al = &(o[y * (200 * 2)]);

  __global int* am = &(p[y * 200]);
  __global int* an = &(q[y * 200]);
  __global int* ao = &(r[y * 200]);

  __global int* ap = &(s[y * (ae * aa * 100)]);
  __global int* aq = &(t[y * (ae * aa * 100)]);

  __private int ar = 0;
  __private int as = 0;
  __private int at;
  __private float au;
  __private float av;
  __private float aw;
  __private float ax;
  __private float ay;
  __private float az;

  aw = 0.5f * (1.0f / (*i) - 1);

  u[y] = v[y] = 0.0f;

  while (true) {
    if (as == 0) {
      ax = C(&ab);

      if (!ac)
        au = ax / (1 - ax);
      else {
        av = 1 / (1 - ax);
        av *= av;
        au = (av - 1) * 0.5f;
      }
      if (au > 100000)
        au = 100000;
    }

    int ba = M(f, ad, &at, au, aw, af, ae, aa, ac,

               aj, ak, an, am, ao, ah, ai, al, ag, &ab, ap, aq);
    if (ba != 0) {
      x[(y * z) + 1] = 999.0f;
      w[(y * z) + 1] = 999.0f;

      return;
    }
    if (at > 1) {
      N(at, f, ae, &az, &ay, aq);

      x[(y * z) + ar] = az;
      w[(y * z) + ar] = ay;
      u[y] += ay * az;
      v[y] += az;
      ++ar;
      if (ar == z)
        break;
      as = 0;
    } else {
      ++as;
      if (as > 1000)
        as = 0;
    }
  }
}
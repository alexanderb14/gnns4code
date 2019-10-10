typedef struct { float x, y, z; } Vec;
typedef struct {
  Vec orig, target;

  Vec dir, x, y;
} Camera;

typedef struct { Vec o, d; } Ray;

enum Refl { DIFF, SPEC, REFR };

typedef struct {
  float rad;
  Vec p, e, c;
  enum Refl refl;
} Sphere;

float A(unsigned int* a, unsigned int* b) {
  *a = 36969 * ((*a) & 65535) + ((*a) >> 16);
  *b = 18000 * ((*b) & 65535) + ((*b) >> 16);

  unsigned int c = ((*a) << 16) + (*b);

  union {
    float f;
    unsigned int ui;
  } d;
  d.ui = (c & 0x007fffff) | 0x40000000;

  return (d.f - 2.f) / 2.f;
}

float B(__constant const Sphere* a, const Ray* b) {
  Vec c;
  {
    (c).x = (a->p).x - (b->o).x;
    (c).y = (a->p).y - (b->o).y;
    (c).z = (a->p).z - (b->o).z;
  };

  float d = ((c).x * (b->d).x + (c).y * (b->d).y + (c).z * (b->d).z);
  float e = d * d - ((c).x * (c).x + (c).y * (c).y + (c).z * (c).z) + a->rad * a->rad;
  if (e < 0.f)
    return 0.f;
  else
    e = sqrt(e);

  float f = d - e;
  if (f > 0.01f)
    return f;
  else {
    f = d + e;

    if (f > 0.01f)
      return f;
    else
      return 0.f;
  }
}

void C(const float a, const float b, Vec* c) {
  const float d = 1.f - 2.f * a;
  const float e = sqrt(max(0.f, 1.f - d * d));
  const float f = 2.f * 3.14159265358979323846f * b;
  const float g = e * cos(f);
  const float h = e * sin(f);

  {
    (*c).x = g;
    (*c).y = h;
    (*c).z = d;
  };
}

int D(__constant const Sphere* a, const unsigned int b, const Ray* c, float* d, unsigned int* e) {
  float f = (*d) = 1e20f;

  unsigned int g = b;
  for (; g--;) {
    const float h = B(&a[g], c);
    if ((h != 0.f) && (h < *d)) {
      *d = h;
      *e = g;
    }
  }

  return (*d < f);
}

int E(__constant const Sphere* a, const unsigned int b, const Ray* c, const float d) {
  unsigned int e = b;
  for (; e--;) {
    const float f = B(&a[e], c);
    if ((f != 0.f) && (f < d))
      return 1;
  }

  return 0;
}

void F(__constant const Sphere* a, const unsigned int b, unsigned int* c, unsigned int* d, const Vec* e, const Vec* f, Vec* g) {
  {
    (*g).x = 0.f;
    (*g).y = 0.f;
    (*g).z = 0.f;
  };

  unsigned int h;
  for (h = 0; h < b; h++) {
    __constant const Sphere* i = &a[h];
    if (!(((i->e).x == 0.f) && ((i->e).x == 0.f) && ((i->e).z == 0.f))) {
      Ray j;
      j.o = *e;

      Vec k;
      C(A(c, d), A(c, d), &k);
      Vec l;
      {
        float m = (i->rad);
        {
          (l).x = m * (k).x;
          (l).y = m * (k).y;
          (l).z = m * (k).z;
        }
      };
      {
        (l).x = (l).x + (i->p).x;
        (l).y = (l).y + (i->p).y;
        (l).z = (l).z + (i->p).z;
      };

      {
        (j.d).x = (l).x - (*e).x;
        (j.d).y = (l).y - (*e).y;
        (j.d).z = (l).z - (*e).z;
      };
      const float n = sqrt(((j.d).x * (j.d).x + (j.d).y * (j.d).y + (j.d).z * (j.d).z));
      {
        float m = (1.f / n);
        {
          (j.d).x = m * (j.d).x;
          (j.d).y = m * (j.d).y;
          (j.d).z = m * (j.d).z;
        }
      };

      float o = ((j.d).x * (k).x + (j.d).y * (k).y + (j.d).z * (k).z);
      if (o > 0.f) {
        continue;
      } else
        o = -o;

      const float p = ((j.d).x * (*f).x + (j.d).y * (*f).y + (j.d).z * (*f).z);
      if ((p > 0.f) && (!E(a, b, &j, n - 0.01f))) {
        Vec q;
        {
          (q).x = (i->e).x;
          (q).y = (i->e).y;
          (q).z = (i->e).z;
        };
        const float r = (4.f * 3.14159265358979323846f * i->rad * i->rad) * p * o / (n * n);
        {
          float m = (r);
          {
            (q).x = m * (q).x;
            (q).y = m * (q).y;
            (q).z = m * (q).z;
          }
        };
        {
          (*g).x = (*g).x + (q).x;
          (*g).y = (*g).y + (q).y;
          (*g).z = (*g).z + (q).z;
        };
      }
    }
  }
}

void G(__constant const Sphere* a, const unsigned int b, const Ray* c, unsigned int* d, unsigned int* e, Vec* f) {
  Ray g;
  {
    {
      ((g).o).x = ((*c).o).x;
      ((g).o).y = ((*c).o).y;
      ((g).o).z = ((*c).o).z;
    };
    {
      ((g).d).x = ((*c).d).x;
      ((g).d).y = ((*c).d).y;
      ((g).d).z = ((*c).d).z;
    };
  };
  Vec h;
  {
    (h).x = 0.f;
    (h).y = 0.f;
    (h).z = 0.f;
  };
  Vec i;
  {
    (i).x = 1.f;
    (i).y = 1.f;
    (i).z = 1.f;
  };

  unsigned int j = 0;
  int k = 1;
  for (;; ++j) {
    if (j > 6) {
      *f = h;
      return;
    }

    float l;
    unsigned int m = 0;
    if (!D(a, b, &g, &l, &m)) {
      *f = h;
      return;
    }

    __constant const Sphere* n = &a[m];

    Vec o;
    {
      float p = (l);
      {
        (o).x = p * (g.d).x;
        (o).y = p * (g.d).y;
        (o).z = p * (g.d).z;
      }
    };
    {
      (o).x = (g.o).x + (o).x;
      (o).y = (g.o).y + (o).y;
      (o).z = (g.o).z + (o).z;
    };

    Vec q;
    {
      (q).x = (o).x - (n->p).x;
      (q).y = (o).y - (n->p).y;
      (q).z = (o).z - (n->p).z;
    };
    {
      float r = 1.f / sqrt(((q).x * (q).x + (q).y * (q).y + (q).z * (q).z));
      {
        float p = (r);
        {
          (q).x = p * (q).x;
          (q).y = p * (q).y;
          (q).z = p * (q).z;
        }
      };
    };

    const float s = ((q).x * (g.d).x + (q).y * (g.d).y + (q).z * (g.d).z);
    Vec t;

    const float u = -1.f * sign(s);
    {
      float p = (u);
      {
        (t).x = p * (q).x;
        (t).y = p * (q).y;
        (t).z = p * (q).z;
      }
    };

    Vec v;
    {
      (v).x = (n->e).x;
      (v).y = (n->e).y;
      (v).z = (n->e).z;
    };
    if (!(((v).x == 0.f) && ((v).x == 0.f) && ((v).z == 0.f))) {
      if (k) {
        {
          float p = (__clc_fabs(s));
          {
            (v).x = p * (v).x;
            (v).y = p * (v).y;
            (v).z = p * (v).z;
          }
        };
        {
          (v).x = (i).x * (v).x;
          (v).y = (i).y * (v).y;
          (v).z = (i).z * (v).z;
        };
        {
          (h).x = (h).x + (v).x;
          (h).y = (h).y + (v).y;
          (h).z = (h).z + (v).z;
        };
      }

      *f = h;
      return;
    }

    if (n->refl == DIFF) {
      k = 0;
      {
        (i).x = (i).x * (n->c).x;
        (i).y = (i).y * (n->c).y;
        (i).z = (i).z * (n->c).z;
      };

      Vec w;
      F(a, b, d, e, &o, &t, &w);
      {
        (w).x = (i).x * (w).x;
        (w).y = (i).y * (w).y;
        (w).z = (i).z * (w).z;
      };
      {
        (h).x = (h).x + (w).x;
        (h).y = (h).y + (w).y;
        (h).z = (h).z + (w).z;
      };

      float x = 2.f * 3.14159265358979323846f * A(d, e);
      float y = A(d, e);
      float z = sqrt(y);

      Vec aa;
      {
        (aa).x = (t).x;
        (aa).y = (t).y;
        (aa).z = (t).z;
      };

      Vec ab, ac;
      if (__clc_fabs(aa.x) > .1f) {
        {
          (ac).x = 0.f;
          (ac).y = 1.f;
          (ac).z = 0.f;
        };
      } else {
        {
          (ac).x = 1.f;
          (ac).y = 0.f;
          (ac).z = 0.f;
        };
      }
      {
        (ab).x = (ac).y * (aa).z - (ac).z * (aa).y;
        (ab).y = (ac).z * (aa).x - (ac).x * (aa).z;
        (ab).z = (ac).x * (aa).y - (ac).y * (aa).x;
      };
      {
        float r = 1.f / sqrt(((ab).x * (ab).x + (ab).y * (ab).y + (ab).z * (ab).z));
        {
          float p = (r);
          {
            (ab).x = p * (ab).x;
            (ab).y = p * (ab).y;
            (ab).z = p * (ab).z;
          }
        };
      };

      Vec ad;
      {
        (ad).x = (aa).y * (ab).z - (aa).z * (ab).y;
        (ad).y = (aa).z * (ab).x - (aa).x * (ab).z;
        (ad).z = (aa).x * (ab).y - (aa).y * (ab).x;
      };

      Vec ae;
      {
        float p = (cos(x) * z);
        {
          (ab).x = p * (ab).x;
          (ab).y = p * (ab).y;
          (ab).z = p * (ab).z;
        }
      };
      {
        float p = (sin(x) * z);
        {
          (ad).x = p * (ad).x;
          (ad).y = p * (ad).y;
          (ad).z = p * (ad).z;
        }
      };
      {
        (ae).x = (ab).x + (ad).x;
        (ae).y = (ab).y + (ad).y;
        (ae).z = (ab).z + (ad).z;
      };
      {
        float p = (sqrt(1 - y));
        {
          (aa).x = p * (aa).x;
          (aa).y = p * (aa).y;
          (aa).z = p * (aa).z;
        }
      };
      {
        (ae).x = (ae).x + (aa).x;
        (ae).y = (ae).y + (aa).y;
        (ae).z = (ae).z + (aa).z;
      };

      g.o = o;
      g.d = ae;
      continue;
    } else if (n->refl == SPEC) {
      k = 1;

      Vec ae;
      {
        float p = (2.f * ((q).x * (g.d).x + (q).y * (g.d).y + (q).z * (g.d).z));
        {
          (ae).x = p * (q).x;
          (ae).y = p * (q).y;
          (ae).z = p * (q).z;
        }
      };
      {
        (ae).x = (g.d).x - (ae).x;
        (ae).y = (g.d).y - (ae).y;
        (ae).z = (g.d).z - (ae).z;
      };

      {
        (i).x = (i).x * (n->c).x;
        (i).y = (i).y * (n->c).y;
        (i).z = (i).z * (n->c).z;
      };

      {
        {
          ((g).o).x = (o).x;
          ((g).o).y = (o).y;
          ((g).o).z = (o).z;
        };
        {
          ((g).d).x = (ae).x;
          ((g).d).y = (ae).y;
          ((g).d).z = (ae).z;
        };
      };
      continue;
    } else {
      k = 1;

      Vec ae;
      {
        float p = (2.f * ((q).x * (g.d).x + (q).y * (g.d).y + (q).z * (g.d).z));
        {
          (ae).x = p * (q).x;
          (ae).y = p * (q).y;
          (ae).z = p * (q).z;
        }
      };
      {
        (ae).x = (g.d).x - (ae).x;
        (ae).y = (g.d).y - (ae).y;
        (ae).z = (g.d).z - (ae).z;
      };

      Ray af;
      {
        {
          ((af).o).x = (o).x;
          ((af).o).y = (o).y;
          ((af).o).z = (o).z;
        };
        {
          ((af).d).x = (ae).x;
          ((af).d).y = (ae).y;
          ((af).d).z = (ae).z;
        };
      };
      int ag = (((q).x * (t).x + (q).y * (t).y + (q).z * (t).z) > 0);

      float ah = 1.f;
      float ai = 1.5f;
      float aj = ag ? ah / ai : ai / ah;
      float ak = ((g.d).x * (t).x + (g.d).y * (t).y + (g.d).z * (t).z);
      float al = 1.f - aj * aj * (1.f - ak * ak);

      if (al < 0.f) {
        {
          (i).x = (i).x * (n->c).x;
          (i).y = (i).y * (n->c).y;
          (i).z = (i).z * (n->c).z;
        };

        {
          {
            ((g).o).x = ((af).o).x;
            ((g).o).y = ((af).o).y;
            ((g).o).z = ((af).o).z;
          };
          {
            ((g).d).x = ((af).d).x;
            ((g).d).y = ((af).d).y;
            ((g).d).z = ((af).d).z;
          };
        };
        continue;
      }

      float am = (ag ? 1 : -1) * (ak * aj + sqrt(al));
      Vec an;
      {
        float p = (am);
        {
          (an).x = p * (q).x;
          (an).y = p * (q).y;
          (an).z = p * (q).z;
        }
      };
      Vec ao;
      {
        float p = (aj);
        {
          (ao).x = p * (g.d).x;
          (ao).y = p * (g.d).y;
          (ao).z = p * (g.d).z;
        }
      };
      {
        (ao).x = (ao).x - (an).x;
        (ao).y = (ao).y - (an).y;
        (ao).z = (ao).z - (an).z;
      };
      {
        float r = 1.f / sqrt(((ao).x * (ao).x + (ao).y * (ao).y + (ao).z * (ao).z));
        {
          float p = (r);
          {
            (ao).x = p * (ao).x;
            (ao).y = p * (ao).y;
            (ao).z = p * (ao).z;
          }
        };
      };

      float ac = ai - ah;
      float ap = ai + ah;
      float aq = ac * ac / (ap * ap);
      float ar = 1 - (ag ? -ak : ((ao).x * (q).x + (ao).y * (q).y + (ao).z * (q).z));

      float as = aq + (1 - aq) * ar * ar * ar * ar * ar;
      float at = 1.f - as;
      float au = .25f + .5f * as;
      float av = as / au;
      float aw = at / (1.f - au);

      if (A(d, e) < au) {
        {
          float p = (av);
          {
            (i).x = p * (i).x;
            (i).y = p * (i).y;
            (i).z = p * (i).z;
          }
        };
        {
          (i).x = (i).x * (n->c).x;
          (i).y = (i).y * (n->c).y;
          (i).z = (i).z * (n->c).z;
        };

        {
          {
            ((g).o).x = ((af).o).x;
            ((g).o).y = ((af).o).y;
            ((g).o).z = ((af).o).z;
          };
          {
            ((g).d).x = ((af).d).x;
            ((g).d).y = ((af).d).y;
            ((g).d).z = ((af).d).z;
          };
        };
        continue;
      } else {
        {
          float p = (aw);
          {
            (i).x = p * (i).x;
            (i).y = p * (i).y;
            (i).z = p * (i).z;
          }
        };
        {
          (i).x = (i).x * (n->c).x;
          (i).y = (i).y * (n->c).y;
          (i).z = (i).z * (n->c).z;
        };

        {
          {
            ((g).o).x = (o).x;
            ((g).o).y = (o).y;
            ((g).o).z = (o).z;
          };
          {
            ((g).d).x = (ao).x;
            ((g).d).y = (ao).y;
            ((g).d).z = (ao).z;
          };
        };
        continue;
      }
    }
  }
}

void H(__constant const Camera* a, unsigned int* b, unsigned int* c, const int d, const int e, const int f, const int g, Ray* h) {
  const float i = 1.f / d;
  const float j = 1.f / e;
  const float k = A(b, c) - .5f;
  const float l = A(b, c) - .5f;
  const float m = (f + k) * i - .5f;
  const float n = (g + l) * j - .5f;

  Vec o;
  {
    (o).x = a->x.x * m + a->y.x * n + a->dir.x;
    (o).y = a->x.y * m + a->y.y * n + a->dir.y;
    (o).z = a->x.z * m + a->y.z * n + a->dir.z;
  };

  Vec p;
  {
    float q = (0.1f);
    {
      (p).x = q * (o).x;
      (p).y = q * (o).y;
      (p).z = q * (o).z;
    }
  };
  {
    (p).x = (p).x + (a->orig).x;
    (p).y = (p).y + (a->orig).y;
    (p).z = (p).z + (a->orig).z;
  }

  {
    float r = 1.f / sqrt(((o).x * (o).x + (o).y * (o).y + (o).z * (o).z));
    {
      float q = (r);
      {
        (o).x = q * (o).x;
        (o).y = q * (o).y;
        (o).z = q * (o).z;
      }
    };
  };
  {
    {
      ((*h).o).x = (p).x;
      ((*h).o).y = (p).y;
      ((*h).o).z = (p).z;
    };
    {
      ((*h).d).x = (o).x;
      ((*h).d).y = (o).y;
      ((*h).d).z = (o).z;
    };
  };
}

__kernel void I(__global Vec* a, __global unsigned int* b, __constant const Sphere* c, __constant const Camera* d, const unsigned int e, const unsigned int f, const unsigned int g, const unsigned int h, __global int* i, const unsigned int j, const unsigned int k) {
  const int l = get_global_id(0);

  if (l >= k)
    return;

  const int m = (j + l) % f;
  const int n = (j + l) / f;

  unsigned int o = b[2 * l];
  unsigned int p = b[2 * l + 1];

  Ray q;
  H(d, &o, &p, f, g, m, n, &q);

  Vec r;
  G(c, e, &q, &o, &p, &r);

  if (h == 0) {
    {
      (a[l]).x = (r).x;
      (a[l]).y = (r).y;
      (a[l]).z = (r).z;
    };
  } else {
    const float s = h;
    const float t = 1.f / (h + 1.f);
    a[l].x = (a[l].x * s + r.x) * t;
    a[l].y = (a[l].y * s + r.y) * t;
    a[l].z = (a[l].z * s + r.z) * t;
  }

  i[l] = ((int)(__clc_pow(clamp(a[l].x, 0.f, 1.f), 1.f / 2.2f) * 255.f + .5f)) | (((int)(__clc_pow(clamp(a[l].y, 0.f, 1.f), 1.f / 2.2f) * 255.f + .5f)) << 8) | (((int)(__clc_pow(clamp(a[l].z, 0.f, 1.f), 1.f / 2.2f) * 255.f + .5f)) << 16);

  b[2 * l] = o;
  b[2 * l + 1] = p;
}
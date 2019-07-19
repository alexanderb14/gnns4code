typedef float2 Vector2; typedef struct __attribute__((packed)) __attribute__((aligned(16))) __Line {
  Vector2 direction;
  Vector2 point;
} Line;

typedef struct __attribute__((packed)) __attribute__((aligned(8))) __AgentNeighborBuf {
  float first;
  ushort second;
} AgentNeighborBuf;

typedef struct __attribute__((packed)) __attribute__((aligned(64))) __Agent {
  Vector2 position_;
  Vector2 prefVelocity_;
  Vector2 velocity_;
  Vector2 newVelocity_;
  uint numAgentNeighbors_;
  uint numOrcaLines_;
  uint id_;
} Agent;
typedef struct __attribute__((packed)) __attribute__((aligned(32))) __AgentTreeNode {
  uint begin;
  uint end;
  uint left;
  float maxX;
  float maxY;
  float minX;
  float minY;
  uint right;
} AgentTreeNode;

inline float A(Vector2 a) {
  return dot(a, a);
}

inline float B(Vector2 a, Vector2 b) {
  return a.x * b.y - a.y * b.x;
}

inline float C(float a) {
  return a * a;
}

typedef struct __attribute__((packed)) __attribute__((aligned(16))) __StackNode {
  uchar retCode;
  float distSqLeft;
  float distSqRight;
  ushort node;
} StackNode;

__global StackNode* D(__global StackNode* a, uchar b, float c, float d, ushort e) {
  StackNode f;
  f.retCode = b;
  f.distSqLeft = c;
  f.distSqRight = d;
  f.node = e;

  *a = f;
  return a + 1;
}

bool E(const __global Line* a, uint b, const Vector2 c, bool d, Vector2* e, uint f) {
  const Line g = a[f + b];
  const float h = dot(g.point, g.direction);
  const float i = C(h) + 5.76f - A(g.point);
  if (i < 0.0f) {
    return false;
  }

  const float j = sqrt(i);
  float k = -h - j;
  float l = -h + j;

  int m = 0;

  for (uint n = 0; n < b; ++n) {
    const Line o = a[f + n];
    const float p = B(g.direction, o.direction);
    const float q = B(o.direction, g.point - o.point);

    if (__clc_fabs(p) <= 0.00001f) {
      if (q < 0.0f) {
        m = 1;
        break;
      } else {
        continue;
      }
    }

    const float r = q / p;

    if (p >= 0.0f) {
      l = (l < r) ? l : r;
    } else {
      k = (k > r) ? k : r;
    }

    if (k > l) {
      m = 1;
      break;
    }
  }

  if (m == 1)
    return false;

  if (d) {
    if (dot(c, g.direction) > 0.0f) {
      *e = g.point + l * g.direction;
    } else {
      *e = g.point + k * g.direction;
    }
  } else {
    const float r = dot(g.direction, (c - g.point));

    if (r < k) {
      *e = g.point + k * g.direction;
    } else if (r > l) {
      *e = g.point + l * g.direction;
    } else {
      *e = g.point + r * g.direction;
    }
  }

  return true;
}

uint F(const __global Line* a, uint b, const Vector2 c, bool d, Vector2* e, uint f) {
  const float g = 2.4f;
  if (d) {
    *e = c * g;
  } else if (A(c) > 5.76f) {
    *e = normalize(c) * g;
  } else {
    *e = c;
  }

  for (uint h = 0; h < b; ++h) {
    if (B(a[f + h].direction, a[f + h].point - *e) > 0.0f) {
      const Vector2 i = *e;
      if (!E(a, h, c, d, e, f)) {
        *e = i;
        return h;
      }
    }
  }

  return b;
}

void G(const __global Line* a, uint b, uint c, uint d, Vector2* e, uint f, __global Line* g) {
  float h = 0.0f;

  for (uint i = d; i < b; ++i) {
    const Line j = a[f + i];
    if (B(j.direction, j.point - *e) > h) {
      for (uint k = 0; k < c; ++k) {
        g[f + k] = a[f + k];
      }
      uint l = c;

      for (uint m = c; m < i; ++m) {
        Line n;
        const Line o = a[f + m];

        float p = B(j.direction, o.direction);

        if (__clc_fabs(p) <= 0.00001f) {
          if (dot(j.direction, o.direction) > 0.0f) {
            continue;
          } else {
            n.point = 0.5f * (j.point + o.point);
          }
        } else {
          n.point = j.point + (B(o.direction, j.point - o.point) / p) * j.direction;
        }

        n.direction = normalize(o.direction - j.direction);
        g[l++] = n;
      }

      const Vector2 q = *e;

      if (F(g, l, (Vector2)(-jection.y, jection.x), true, e, f) < l) {
        *e = q;
      }

      h = B(j.direction, j.point - *e);
    }
  }
}

__kernel void H(__global Agent* a, __global AgentTreeNode* b, float c, __global AgentNeighborBuf* d, __global Line* e, __global Line* f, __global unsigned* g, __global StackNode* h) {
  Agent i = a[get_global_id(0)];

  float j = 225.0f;
  ushort k = 0;
  __global StackNode* l = &h[get_global_id(0) * 20];

  uchar m = 0;
  float n;
  float o;

  for (;;) {
    const AgentTreeNode p = b[k];
    ushort q;
    uchar r = 0;
    switch (m) {
      case 0:
        if (p.end - p.begin <= 10) {
          for (uint s = p.begin; s < p.end; ++s) {
            Agent t = a[g[s]];
            if (i.id_ != t.id_) {
              const float u = A(i.position_ - t.position_);

              if (u < j) {
                const ushort v = 10 * get_global_id(0);

                if (i.numAgentNeighbors_ < 10) {
                  d[v + i.numAgentNeighbors_].first = u;
                  d[v + i.numAgentNeighbors_].second = t.id_;
                  ++i.numAgentNeighbors_;
                }

                uchar s = i.numAgentNeighbors_ - 1;

                while (s != 0 && u < d[v + s - 1].first) {
                  d[v + s] = d[v + s - 1];
                  --s;
                }

                d[v + s].first = u;
                d[v + s].second = t.id_;

                if (i.numAgentNeighbors_ == 10) {
                  j = d[v + i.numAgentNeighbors_ - 1].first;
                }
              }
            }
          }
          break;
        } else {
          AgentTreeNode w = b[p.left];
          n = C(max(0.0f, w.minX - i.position_.x)) + C(max(0.0f, i.position_.x - w.maxX)) + C(max(0.0f, w.minY - i.position_.y)) + C(max(0.0f, i.position_.y - w.maxY));

          AgentTreeNode x = b[p.right];
          o = C(max(0.0f, x.minX - i.position_.x)) + C(max(0.0f, i.position_.x - x.maxX)) + C(max(0.0f, x.minY - i.position_.y)) + C(max(0.0f, i.position_.y - x.maxY));

          if (n < o) {
            if (n < j) {
              q = k;
              r = 1;
              k = p.left;
              m = 0;
              break;

              case 1:

                if (o < j) {
                  q = k;
                  r = 3;
                  k = p.right;
                  m = 0;
                  break;
                }
            }
          } else {
            if (o < j) {
              q = k;
              r = 2;
              k = p.right;
              m = 0;
              break;
              case 2:

                if (n < j) {
                  q = k;
                  r = 3;
                  k = p.left;
                  m = 0;
                  break;
                }
            }
          }
        }
      case 3:
        break;
    }
    if (r != 0) {
      l = D(l, r, n, o, q);
      continue;
    }

    if (&h[0] == l) {
      break;
    }

    l--;
    StackNode y = *l;
    m = y.retCode;
    n = y.distSqLeft;
    o = y.distSqRight;
    k = y.node;
  }

  i.numOrcaLines_ = 0;

  const float z = 0.1f;
  uint aa = 10 * get_global_id(0);
  uint ab = 26 * get_global_id(0);

  for (uint s = 0; s < i.numAgentNeighbors_; ++s) {
    const Agent ac = a[d[aa + s].second];

    const Vector2 ad = ac.position_ - i.position_;
    const Vector2 ae = i.velocity_ - ac.velocity_;
    const float u = A(ad);
    const float af = 4.8f;
    const float ag = 23.04f;

    Line ah;
    Vector2 ai;

    if (u > ag) {
      const Vector2 aj = ae - z * ad;

      const float ak = A(aj);

      const float al = dot(aj, ad);

      if (al < 0.0f && C(al) > ag * ak) {
        const float am = sqrt(ak);
        const Vector2 an = aj / am;

                ah.direction = (Vector2)(an -an;
                ai = (af * z - am) * an;
      } else {
        const float ao = sqrt(u - ag);

        if (B(ad, aj) > 0.0f) {
          ao u;
        } else {
          ao u;
        }

        const float ap = dot(ae, ah.direction);

        ai = ap * ah.direction - ae;
      }
    } else {
      const float aq = 1.66666662693023681640625f;

      const Vector2 aj = ae - aq * ad;

      const float am = length(aj);
      const Vector2 an = aj / am;

            ah.direction = (Vector2)(an -an;
            ai = (af * aq - am) * an;
    }

    ah.point = i.velocity_ + 0.5f * ai;
    e[ab + i.numOrcaLines_++] = ah;
  }

  uint ar = F(e, i.numOrcaLines_, i.prefVelocity_, false, &i.newVelocity_, ab);

  if (ar < i.numOrcaLines_) {
    G(e, i.numOrcaLines_, 0, ar, &i.newVelocity_, ab, f);
  }

  a[get_global_id(0)].newVelocity_ = i.newVelocity_;
}

__kernel void I(__global Agent* restrict a, float b) {
  int c = get_global_id(0);
  __global Agent* d = &a[c];

  d->velocity_ = d->newVelocity_;
  d->position_ += d->velocity_ * b;
}
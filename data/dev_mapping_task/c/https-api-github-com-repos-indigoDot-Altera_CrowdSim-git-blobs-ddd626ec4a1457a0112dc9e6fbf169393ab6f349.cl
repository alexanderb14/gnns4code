typedef float simFloat; typedef float2 Vector2; typedef struct __Line {
  Vector2 direction;
  Vector2 point;
} Line;

struct __Agent;

typedef struct __Obstacle {
  int isConvex_;
  __global struct __Obstacle* nextObstacle_;
  Vector2 point_;
  __global struct __Obstacle* prevObstacle_;
  Vector2 unitDir_;

  uint id_;
} Obstacle;

typedef struct __AgentNeighbor {
  simFloat first;
  __global const struct __Agent* second;
} AgentNeighbor;

typedef struct __AgentNeighborBuf {
  simFloat first;
  uint second;
} AgentNeighborBuf;

typedef struct __ObstacleNeighbor {
  simFloat first;
  __global const struct __Obstacle* second;
} ObstacleNeighbor;

typedef struct __Agent {
  long spacer1;
  uint numAgentNeighbors_;
  uint maxNeighbors_;
  simFloat maxSpeed_;
  simFloat neighborDist_;
  Vector2 newVelocity_;

  long spacer2;
  uint numObstacleNeighbors_;
  uint maxObstacleNeighbors_;

  long spacer3;
  uint numOrcaLines_;

  long spacer4;
  Vector2 position_;
  Vector2 prefVelocity_;
  simFloat radius_;

  long spacer5;
  simFloat timeHorizon_;
  simFloat timeHorizonObst_;
  Vector2 velocity_;
  uint id_;
} Agent;

typedef struct __PAgent { __global Agent* value; } PAgent;

typedef struct __AgentTreeNode {
  uint begin;
  uint end;
  uint left;
  simFloat maxX;
  simFloat maxY;
  simFloat minX;
  simFloat minY;
  uint right;
} AgentTreeNode;

typedef struct __ObstacleTreeNode {
  __global struct __ObstacleTreeNode* left;
  __global const struct __Obstacle* obstacle;
  __global struct __ObstacleTreeNode* right;
} ObstacleTreeNode;

inline simFloat A(simFloat a) {
  if (a < 0.0f)
    return -a;
  else
    return a;
}

inline simFloat B(Vector2 a, Vector2 b) {
  return a.x * b.x + a.y * b.y;
}

inline simFloat C(simFloat a) {
  float b = sqrt((float)a);
  return (simFloat)b;
}

inline simFloat D(Vector2 a) {
  return C(a.x * a.x + a.y * a.y);
}

inline Vector2 E(Vector2 a) {
  simFloat b = D(a);
  Vector2 c;
  c.x = a.x / b;
  c.y = a.y / b;
  return c;
}

inline simFloat F(Vector2 a) {
  return B(a, a);
}

inline simFloat G(Vector2 a, Vector2 b) {
  return a.x * b.y - a.y * b.x;
}

inline simFloat H(simFloat a) {
  return a * a;
}
void I(__global Agent* a, __global const Agent* b, simFloat* c, __global AgentNeighborBuf* d) {
  if (a->id_ != b->id_) {
    const simFloat e = F(a->position_ - b->position_);

    if (e < *c) {
      uint f = a->maxNeighbors_ * get_global_id(0);
      if (a->numAgentNeighbors_ < a->maxNeighbors_) {
        d[f + a->numAgentNeighbors_].first = e;
        d[f + a->numAgentNeighbors_].second = b->id_;
        a->numAgentNeighbors_++;
      }

      uint g = a->numAgentNeighbors_ - 1;

      while (g != 0 && e < d[f + g - 1].first) {
        d[f + g] = d[f + g - 1];
        --g;
      }

      d[f + g].first = e;
      d[f + g].second = b->id_;

      if (a->numAgentNeighbors_ == a->maxNeighbors_) {
        *c = d[f + a->numAgentNeighbors_ - 1].first;
      }
    }
  }
}

typedef struct __StackNode {
  uint retCode;
  simFloat distSqLeft;
  simFloat distSqRight;
  uint node;
} StackNode;

__global StackNode* J(__global StackNode* a, uint b, simFloat c, simFloat d, uint e) {
  a->retCode = b;
  a->distSqLeft = c;
  a->distSqRight = d;
  a->node = e;
  return a + 1;
}

void K(__global Agent* a, __global Agent* b, __global AgentTreeNode* c, simFloat* d, uint e, __global AgentNeighborBuf* f, __global unsigned* g, __global StackNode* h) {
  __global StackNode* i = &h[0];
  uint j = 0;

  simFloat k;
  simFloat l;

  for (;;) {
    switch (j) {
      case 0:
        if (c[e].end - c[e].begin <= 10) {
          for (uint m = c[e].begin; m < c[e].end; ++m) {
            I(b, &a[g[m]], d, f);
          }
          break;
        } else {
          k = H(max(0.0f, c[c[e].left].minX - b->position_.x)) + H(max(0.0f, b->position_.x - c[c[e].left].maxX)) + H(max(0.0f, c[c[e].left].minY - b->position_.y)) + H(max(0.0f, b->position_.y - c[c[e].left].maxY));

          l = H(max(0.0f, c[c[e].right].minX - b->position_.x)) + H(max(0.0f, b->position_.x - c[c[e].right].maxX)) + H(max(0.0f, c[c[e].right].minY - b->position_.y)) + H(max(0.0f, b->position_.y - c[c[e].right].maxY));

          if (k < l) {
            if (k < *d) {
              i = J(i, 1, k, l, e);
              e = c[e].left;
              j = 0;
              continue;

              case 1:

                if (l < *d) {
                  i = J(i, 3, k, l, e);
                  e = c[e].right;
                  j = 0;
                  continue;
                }
            }
          } else {
            if (l < *d) {
              i = J(i, 2, k, l, e);
              e = c[e].right;
              j = 0;
              continue;
              case 2:

                if (k < *d) {
                  i = J(i, 3, k, l, e);
                  e = c[e].left;
                  j = 0;
                  continue;
                }
            }
          }
        }
      case 3:
        break;
    }

    if (&h[0] == i) {
      break;
    }

    i--;

    j = i->retCode;
    k = i->distSqLeft;
    l = i->distSqRight;
    e = i->node;
  }
}

void L(__global Agent* a, __global Agent* b, __global AgentTreeNode* c, __global AgentNeighborBuf* d, __global unsigned* e, __global StackNode* f) {
  a->numObstacleNeighbors_ = 0;
  simFloat g = H(a->timeHorizonObst_ * a->maxSpeed_ + a->radius_);

  a->numAgentNeighbors_ = 0;

  if (a->maxNeighbors_ > 0) {
    g = H(a->neighborDist_);
    K(b, a, c, &g, 0, d, e, f);
  }
}

bool M(const __global Line* a, uint b, simFloat c, const Vector2 d, bool e, __global Vector2* f, uint g) {
  const simFloat h = B(a[g + b].point, a[g + b].direction);
  const simFloat i = H(h) + H(c) - F(a[g + b].point);

  if (i < 0.0f) {
    return false;
  }

  const simFloat j = C(i);
  simFloat k = -h - j;
  simFloat l = -h + j;

  int m = 0;

  for (uint n = 0; n < b; ++n) {
    const simFloat o = G(a[g + b].direction, a[g + n].direction);
    const simFloat p = G(a[g + n].direction, a[g + b].point - a[g + n].point);

    if (A(o) <= 0.00001f) {
      if (p < 0.0f) {
        m = 1;
        break;
      } else {
        continue;
      }
    }

    const simFloat q = p / o;

    if (o >= 0.0f) {
      l = (l < q) ? l : q;
    } else {
      k = (k > q) ? k : q;
    }

    if (k > l) {
      m = 1;
      break;
    }
  }

  if (m == 1)
    return false;

  if (e) {
    if (B(d, a[g + b].direction) > 0.0f) {
      *f = a[g + b].point + l * a[g + b].direction;
    } else {
      *f = a[g + b].point + k * a[g + b].direction;
    }
  } else {
    const simFloat q = B(a[g + b].direction, (d - a[g + b].point));

    if (q < k) {
      *f = a[g + b].point + k * a[g + b].direction;
    } else if (q > l) {
      *f = a[g + b].point + l * a[g + b].direction;
    } else {
      *f = a[g + b].point + q * a[g + b].direction;
    }
  }

  return true;
}

uint N(const __global Line* a, uint b, simFloat c, const Vector2 d, bool e, __global Vector2* f, uint g) {
  if (e) {
    *f = d * c;
  } else if (F(d) > H(c)) {
    *f = E(d) * c;
  } else {
    *f = d;
  }

  for (uint h = 0; h < b; ++h) {
    if (G(a[g + h].direction, a[g + h].point - *f) > 0.0f) {
      const Vector2 i = *f;
      if (!M(a, h, c, d, e, f, g)) {
        *f = i;
        return h;
      }
    }
  }

  return b;
}

void O(const __global Line* a, uint b, uint c, uint d, simFloat e, __global Vector2* f, uint g, __global Line* h) {
  simFloat i = 0.0f;

  for (uint j = d; j < b; ++j) {
    if (G(a[g + j].direction, a[g + j].point - *f) > i) {
      for (uint k = 0; k < c; ++k) {
        h[g + k] = a[g + k];
      }
      uint l = c;

      for (uint m = c; m < j; ++m) {
        Line n;

        simFloat o = G(a[g + j].direction, a[g + m].direction);

        if (A(o) <= 0.00001f) {
          if (B(a[g + j].direction, a[g + m].direction) > 0.0f) {
            continue;
          } else {
            n.point = (simFloat)0.5f * (a[g + j].point + a[g + m].point);
          }
        } else {
          n.point = a[g + j].point + (G(a[g + m].direction, a[g + j].point - a[g + m].point) / o) * a[g + j].direction;
        }

        n.direction = E(a[g + m].direction - a[g + j].direction);
        h[l++] = n;
      }

      const Vector2 p = *f;

      if (N(h, l, e, (Vectoj2)girectioj.ygirection.x), true, f, g) < l) {
          *f = p;
        }

      i = G(a[g + j].direction, a[g + j].point - *f);
    }
  }
}

__kernel void P(__global Agent* a, __global AgentTreeNode* restrict b, simFloat c, __global AgentNeighborBuf* restrict d, __global Line* restrict e, __global Line* restrict f, __global unsigned* restrict g, __global StackNode* restrict h) {
  __global Agent* i = &a[get_global_id(0)];

  L(i, a, b, d, g, h);

  i->numOrcaLines_ = 0;
  simFloat j = i->radius_;
  Vector2 k = i->position_;
  Vector2 l = i->velocity_;

  const uint m = i->numOrcaLines_;

  const simFloat n = 1.0f / i->timeHorizon_;
  uint o = i->maxNeighbors_ * get_global_id(0);
  uint p = (i->maxNeighbors_ + i->maxObstacleNeighbors_) * get_global_id(0);

  for (uint q = 0; q < i->numAgentNeighbors_; ++q) {
    const __global Agent* const r = &a[d[o + q].second];

    const Vector2 s = r->position_ - k;
    const Vector2 t = l - r->velocity_;
    const simFloat u = F(s);
    const simFloat v = j + r->radius_;
    const simFloat w = H(v);

    Line x;
    Vector2 y;

    if (u > w) {
      const Vector2 z = t - n * s;

      const simFloat aa = F(z);

      const simFloat ab = B(z, s);

      if (ab < 0.0f && H(ab) > w * aa) {
        const simFloat ac = C(aa);
        const Vector2 ad = z / ac;

                x.direction = (Vector2)(ad -ad;
                y = (v * n - ac) * ad;
      } else {
        const simFloat ae = C(u - w);

                if (G(s, z) > 0.ae {
          u;
                }
                elsae

 u;
      }

      const simFloat af = B(t, x.direction);

      y = af * x.direction - t;
    }
  }
  else {
    const simFloat ag = 1.0f / c;

    const Vector2 z = t - ag * s;

    const simFloat ac = D(z);
    const Vector2 ad = z / ac;

            x.direction = (Vector2)(ad -ad;
            y = (v * ag - ac) * ad;
  }

  x.point = l + (simFloat)0.5f * y;
  e[p + i->numOrcaLines_++] = x;
}

uint ah = N(e, i->numOrcaLines_, i->maxSpeed_, i->prefVelocity_, false, &i->newVelocity_, p);

if (ah < i->numOrcaLines_) {
  O(e, i->numOrcaLines_, m, ah, i->maxSpeed_, &i->newVelocity_, p, f);
}
}

__kernel void Q(__global Agent* restrict a, simFloat b) {
  int c = get_global_id(0);
  __global Agent* d = &a[c];

  d->velocity_ = d->newVelocity_;
  d->position_ += d->velocity_ * b;
}
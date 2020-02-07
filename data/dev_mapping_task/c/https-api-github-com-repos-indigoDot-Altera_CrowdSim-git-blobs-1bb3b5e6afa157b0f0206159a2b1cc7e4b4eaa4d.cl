typedef float2 Vector2; typedef struct __Line {
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
  float first;
  __global const struct __Agent* second;
} AgentNeighbor;

typedef struct __AgentNeighborBuf {
  float first;
  uint second;
} AgentNeighborBuf;

typedef struct __ObstacleNeighbor {
  float first;
  __global const struct __Obstacle* second;
} ObstacleNeighbor;
typedef struct __Agent {
  long spacer1;
  uint numAgentNeighbors_;
  uint maxNeighbors_;
  float maxSpeed_;
  float neighborDist_;
  Vector2 newVelocity_;

  long spacer2;
  uint numObstacleNeighbors_;
  uint maxObstacleNeighbors_;

  long spacer3;
  uint numOrcaLines_;

  long spacer4;
  Vector2 position_;
  Vector2 prefVelocity_;
  float radius_;

  long spacer5;
  float timeHorizon_;
  float timeHorizonObst_;
  Vector2 velocity_;
  uint id_;
} Agent;

typedef struct __PAgent { __global Agent* value; } PAgent;

typedef struct __AgentTreeNode {
  uint begin;
  uint end;
  uint left;
  float maxX;
  float maxY;
  float minX;
  float minY;
  uint right;
} AgentTreeNode;

typedef struct __ObstacleTreeNode {
  __global struct __ObstacleTreeNode* left;
  __global const struct __Obstacle* obstacle;
  __global struct __ObstacleTreeNode* right;
} ObstacleTreeNode;

inline float A(Vector2 a) {
  return dot(a, a);
}

inline float B(Vector2 a, Vector2 b) {
  return a.x * b.y - a.y * b.x;
}

inline float C(float a) {
  return a * a;
}

void D(__global Agent* a, __global const Agent* b, float* c, __global AgentNeighborBuf* d) {
  if (a->id_ != b->id_) {
    const float e = A(a->position_ - b->position_);

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
  float distSqLeft;
  float distSqRight;
  uint node;
} StackNode;

__global StackNode* E(__global StackNode* a, uint b, float c, float d, uint e) {
  a->retCode = b;
  a->distSqLeft = c;
  a->distSqRight = d;
  a->node = e;
  return a + 1;
}

void F(__global Agent* a, __global Agent* b, __global AgentTreeNode* c, float* d, uint e, __global AgentNeighborBuf* f, __global unsigned* g, __global StackNode* h) {
  __global StackNode* i = &h[get_global_id(0) * 20];

  uint j = 0;

  float k;
  float l;

  for (;;) {
    switch (j) {
      case 0:
        if (c[e].end - c[e].begin <= 10) {
          for (uint m = c[e].begin; m < c[e].end; ++m) {
            D(b, &a[g[m]], d, f);
          }
          break;
        } else {
          k = C(max(0.0f, c[c[e].left].minX - b->position_.x)) + C(max(0.0f, b->position_.x - c[c[e].left].maxX)) + C(max(0.0f, c[c[e].left].minY - b->position_.y)) + C(max(0.0f, b->position_.y - c[c[e].left].maxY));

          l = C(max(0.0f, c[c[e].right].minX - b->position_.x)) + C(max(0.0f, b->position_.x - c[c[e].right].maxX)) + C(max(0.0f, c[c[e].right].minY - b->position_.y)) + C(max(0.0f, b->position_.y - c[c[e].right].maxY));

          if (k < l) {
            if (k < *d) {
              i = E(i, 1, k, l, e);
              e = c[e].left;
              j = 0;
              continue;

              case 1:

                if (l < *d) {
                  i = E(i, 3, k, l, e);
                  e = c[e].right;
                  j = 0;
                  continue;
                }
            }
          } else {
            if (l < *d) {
              i = E(i, 2, k, l, e);
              e = c[e].right;
              j = 0;
              continue;
              case 2:

                if (k < *d) {
                  i = E(i, 3, k, l, e);
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

void G(__global Agent* a, __global Agent* b, __global AgentTreeNode* c, __global AgentNeighborBuf* d, __global unsigned* e, __global StackNode* f) {
  a->numObstacleNeighbors_ = 0;
  float g = C(a->timeHorizonObst_ * a->maxSpeed_ + a->radius_);

  a->numAgentNeighbors_ = 0;

  if (a->maxNeighbors_ > 0) {
    g = C(a->neighborDist_);
    F(b, a, c, &g, 0, d, e, f);
  }
}

bool H(const __global Line* a, uint b, float c, const Vector2 d, bool e, Vector2* f, uint g) {
  const float h = dot(a[g + b].point, a[g + b].direction);
  const float i = C(h) + C(c) - A(a[g + b].point);

  if (i < 0.0f) {
    return false;
  }

  const float j = sqrt(i);
  float k = -h - j;
  float l = -h + j;

  int m = 0;

  for (uint n = 0; n < b; ++n) {
    const float o = B(a[g + b].direction, a[g + n].direction);
    const float p = B(a[g + n].direction, a[g + b].point - a[g + n].point);

    if (__clc_fabs(o) <= 0.00001f) {
      if (p < 0.0f) {
        m = 1;
        break;
      } else {
        continue;
      }
    }

    const float q = p / o;

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
    if (dot(d, a[g + b].direction) > 0.0f) {
      *f = a[g + b].point + l * a[g + b].direction;
    } else {
      *f = a[g + b].point + k * a[g + b].direction;
    }
  } else {
    const float q = dot(a[g + b].direction, (d - a[g + b].point));

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

uint I(const __global Line* a, uint b, float c, const Vector2 d, bool e, Vector2* f, uint g) {
  if (e) {
    *f = d * c;
  } else if (A(d) > C(c)) {
    *f = normalize(d) * c;
  } else {
    *f = d;
  }

  for (uint h = 0; h < b; ++h) {
    if (B(a[g + h].direction, a[g + h].point - *f) > 0.0f) {
      const Vector2 i = *f;
      if (!H(a, h, c, d, e, f, g)) {
        *f = i;
        return h;
      }
    }
  }

  return b;
}

void J(const __global Line* a, uint b, uint c, uint d, float e, Vector2* f, uint g, __global Line* h) {
  float i = 0.0f;

  for (uint j = d; j < b; ++j) {
    if (B(a[g + j].direction, a[g + j].point - *f) > i) {
      for (uint k = 0; k < c; ++k) {
        h[g + k] = a[g + k];
      }
      uint l = c;

      for (uint m = c; m < j; ++m) {
        Line n;

        float o = B(a[g + j].direction, a[g + m].direction);

        if (__clc_fabs(o) <= 0.00001f) {
          if (dot(a[g + j].direction, a[g + m].direction) > 0.0f) {
            continue;
          } else {
            n.point = (float)0.5f * (a[g + j].point + a[g + m].point);
          }
        } else {
          n.point = a[g + j].point + (B(a[g + m].direction, a[g + j].point - a[g + m].point) / o) * a[g + j].direction;
        }

        n.direction = normalize(a[g + m].direction - a[g + j].direction);
        h[l++] = n;
      }

      const Vector2 p = *f;

      if (I(h, l, e, (Vectoj2)girectioj.ygirection.x), true, f, g) < l) {
          *f = p;
        }

      i = B(a[g + j].direction, a[g + j].point - *f);
    }
  }
}

__kernel

    void
    K(__global Agent* restrict a, float b, __global AgentNeighborBuf* restrict c, __global Line* restrict d, __global Line* restrict e) {
  Agent f = a[get_global_id(0)];

  f.numOrcaLines_ = 0;

  const float g = 1.0f / f.timeHorizon_;
  uint h = f.maxNeighbors_ * get_global_id(0);
  uint i = (f.maxNeighbors_ + f.maxObstacleNeighbors_) * get_global_id(0);

  for (uint j = 0; j < f.numAgentNeighbors_; ++j) {
    const Agent k = a[c[h + j].second];

    const Vector2 l = k.position_ - f.position_;
    const Vector2 m = f.velocity_ - k.velocity_;
    const float n = A(l);
    const float o = f.radius_ + k.radius_;
    const float p = C(o);

    Line q;
    Vector2 r;

    if (n > p) {
      const Vector2 s = m - g * l;

      const float t = A(s);

      const float u = dot(s, l);

      if (u < 0.0f && C(u) > p * t) {
        const float v = sqrt(t);
        const Vector2 w = s / v;

                q.direction = (Vector2)(w-w
                r = (o * g - v) * w;
      } else {
        const float x = sqrt(n - p);

        if (B(l, s) > xf)
          n;
      }
      ex {
        n;
      }

      const float y = dot(m, q.direction);

      r = y * q.direction - m;
    }
  }
  else {
    const float z = 1.0f / b;

    const Vector2 s = m - z * l;

    const float v = length(s);
    const Vector2 w = s / v;

            q.direction = (Vector2)(w-w
            r = (o * z - v) * w;
  }

  q.point = f.velocity_ + (float)0.5f * r;
  d[i + f.numOrcaLines_++] = q;
}

uint aa = I(d, f.numOrcaLines_, f.maxSpeed_, f.prefVelocity_, false, &f.newVelocity_, i);

if (aa < f.numOrcaLines_) {
  J(d, f.numOrcaLines_, 0, aa, f.maxSpeed_, &f.newVelocity_, i, e);
}

a[get_global_id(0)].newVelocity_ = f.newVelocity_;
}

__kernel void L(__global Agent* restrict a, float b) {
  int c = get_global_id(0);
  __global Agent* d = &a[c];

  d->velocity_ = d->newVelocity_;
  d->position_ += d->velocity_ * b;
}
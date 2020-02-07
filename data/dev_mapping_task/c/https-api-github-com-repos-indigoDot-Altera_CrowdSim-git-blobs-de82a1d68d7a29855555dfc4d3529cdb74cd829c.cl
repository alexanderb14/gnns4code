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

typedef struct __ObstacleNeighbor {
  float first;
  __global const struct __Obstacle* second;
} ObstacleNeighbor;

typedef struct __Agent {
  __global AgentNeighbor* agentNeighbors_;
  uint numAgentNeighbors_;
  uint maxNeighbors_;
  float maxSpeed_;
  float neighborDist_;
  Vector2 newVelocity_;
  __global ObstacleNeighbor* obstacleNeighbors_;
  uint numObstacleNeighbors_;
  uint maxObstacleNeighbors_;
  __global Line* orcaLines_;
  uint numOrcaLines_;
  __global Line* projLines_;
  Vector2 position_;
  Vector2 prefVelocity_;
  float radius_;
  __global void* sim_;
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

void D(__global Agent* a, __global const Agent* b, float* c) {
  if (a != b) {
    const float d = A(a->position_ - b->position_);

    if (d < *c) {
      if (a->numAgentNeighbors_ < a->maxNeighbors_) {
        a->agentNeighbors_[a->numAgentNeighbors_].first = d;
        a->agentNeighbors_[a->numAgentNeighbors_].second = b;
        a->numAgentNeighbors_++;
      }

      uint e = a->numAgentNeighbors_ - 1;

      while (e != 0 && d < a->agentNeighbors_[e - 1].first) {
        a->agentNeighbors_[e] = a->agentNeighbors_[e - 1];
        --e;
      }

      a->agentNeighbors_[e].first = d;
      a->agentNeighbors_[e].second = b;

      if (a->numAgentNeighbors_ == a->maxNeighbors_) {
        *c = a->agentNeighbors_[a->numAgentNeighbors_ - 1].first;
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

StackNode* E(StackNode* a, uint b, float c, float d, uint e) {
  a->retCode = b;
  a->distSqLeft = c;
  a->distSqRight = d;
  a->node = e;
  return a + 1;
}

void F(__global PAgent* a, __global Agent* b, __global AgentTreeNode* c, float* d, uint e) {
  StackNode f[20];
  StackNode* g = &f[0];
  uint h = 0;

  float i;
  float j;

  for (;;) {
    switch (h) {
      case 0:
        if (c[e].end - c[e].begin <= 10) {
          for (uint k = c[e].begin; k < c[e].end; ++k) {
            D(b, a[k].value, d);
          }
          break;
        }

        else {
          i = C(max(0.0f, c[c[e].left].minX - b->position_.x)) + C(max(0.0f, b->position_.x - c[c[e].left].maxX)) + C(max(0.0f, c[c[e].left].minY - b->position_.y)) + C(max(0.0f, b->position_.y - c[c[e].left].maxY));

          j = C(max(0.0f, c[c[e].right].minX - b->position_.x)) + C(max(0.0f, b->position_.x - c[c[e].right].maxX)) + C(max(0.0f, c[c[e].right].minY - b->position_.y)) + C(max(0.0f, b->position_.y - c[c[e].right].maxY));

          if (i < j) {
            if (i < *d) {
              g = E(g, 1, i, j, e);
              e = c[e].left;
              h = 0;
              continue;

              case 1:

                if (j < *d) {
                  g = E(g, 3, i, j, e);
                  e = c[e].right;
                  h = 0;
                  continue;
                }
            }
          } else {
            if (j < *d) {
              g = E(g, 2, i, j, e);
              e = c[e].right;
              h = 0;
              continue;
              case 2:

                if (i < *d) {
                  g = E(g, 3, i, j, e);
                  e = c[e].left;
                  h = 0;
                  continue;
                }
            }
          }
        }
      case 3:
        break;
    }

    if (&f[0] == g) {
      break;
    }

    g--;

    h = g->retCode;
    i = g->distSqLeft;
    j = g->distSqRight;
    e = g->node;
  }
}

void G(__global Agent* a, __global PAgent* b, __global AgentTreeNode* c) {
  a->numObstacleNeighbors_ = 0;
  float d = C(a->timeHorizonObst_ * a->maxSpeed_ + a->radius_);

  a->numAgentNeighbors_ = 0;

  if (a->maxNeighbors_ > 0) {
    d = C(a->neighborDist_);
    F(b, a, c, &d, 0);
  }
}

bool H(const __global Line* a, uint b, float c, const Vector2 d, bool e, __global Vector2* f) {
  const float g = dot(a[b].point, a[b].direction);
  const float h = C(g) + C(c) - A(a[b].point);

  if (h < 0.0f) {
    return false;
  }

  const float i = sqrt(h);
  float j = -g - i;
  float k = -g + i;

  int l = 0;

  for (uint m = 0; m < b; ++m) {
    const float n = B(a[b].direction, a[m].direction);
    const float o = B(a[m].direction, a[b].point - a[m].point);

    if (__clc_fabs(n) <= 0.00001f) {
      if (o < 0.0f) {
        l = 1;
        break;
      } else {
        continue;
      }
    }

    const float p = o / n;

    if (n >= 0.0f) {
      k = min(k, p);
    } else {
      j = max(j, p);
    }

    if (j > k) {
      l = 1;
      break;
    }
  }

  if (l == 1)
    return false;

  if (e) {
    if (dot(d, a[b].direction) > 0.0f) {
      *f = a[b].point + k * a[b].direction;
    } else {
      *f = a[b].point + j * a[b].direction;
    }
  } else {
    const float p = dot(a[b].direction, (d - a[b].point));

    if (p < j) {
      *f = a[b].point + j * a[b].direction;
    } else if (p > k) {
      *f = a[b].point + k * a[b].direction;
    } else {
      *f = a[b].point + p * a[b].direction;
    }
  }

  return true;
}

uint I(const __global Line* a, uint b, float c, const Vector2 d, bool e, __global Vector2* f) {
  if (e) {
    *f = d * c;
  } else if (A(d) > C(c)) {
    *f = normalize(d) * c;
  } else {
    *f = d;
  }

  for (uint g = 0; g < b; ++g) {
    if (B(a[g].direction, a[g].point - *f) > 0.0f) {
      const Vector2 h = *f;

      if (!H(a, g, c, d, e, f)) {
        *f = h;
        return g;
      }
    }
  }

  return b;
}

void J(const __global Line* a, uint b, uint c, uint d, float e, __global Vector2* f, __global Line* g) {
  float h = 0.0f;

  for (uint i = d; i < b; ++i) {
    if (B(a[i].direction, a[i].point - *f) > h) {
      for (uint j = 0; j < c; ++j) {
        g[j] = a[j];
      }
      uint k = c;

      for (uint l = c; l < i; ++l) {
        Line m;

        float n = B(a[i].direction, a[l].direction);

        if (__clc_fabs(n) <= 0.00001f) {
          if (dot(a[i].direction, a[l].direction) > 0.0f) {
            continue;
          } else {
            m.point = 0.5f * (a[i].point + a[l].point);
          }
        } else {
          m.point = a[i].point + (B(a[l].direction, a[i].point - a[l].point) / n) * a[i].direction;
        }

        m.direction = normalize(a[l].direction - a[i].direction);
        g[k++] = m;
      }

      const Vector2 o = *f;

      if (I(g, k, e, (Vector2)i - adirection.yi adirection.x), true, f) < k) {
          *f = o;
        }

      h = B(a[i].direction, a[i].point - *f);
    }
  }
}

__kernel void K(__global PAgent* a, __global PAgent* b, __global AgentTreeNode* c, float d) {
  __global Agent* e = a[get_global_id(0)].value;

  G(e, b, c);

  e->numOrcaLines_ = 0;
  float f = e->radius_;
  Vector2 g = e->position_;
  Vector2 h = e->velocity_;
  const uint i = e->numOrcaLines_;

  const float j = 1.0f / e->timeHorizon_;

  for (uint k = 0; k < e->numAgentNeighbors_; ++k) {
    const __global Agent* const l = e->agentNeighbors_[k].second;

    const Vector2 m = l->position_ - g;
    const Vector2 n = h - l->velocity_;
    const float o = A(m);
    const float p = f + l->radius_;
    const float q = C(p);

    Line r;
    Vector2 s;

    if (o > q) {
      const Vector2 t = n - j * m;

      const float u = A(t);

      const float v = dot(t, m);

      if (v < 0.0f && C(v) > q * u) {
        const float w = sqrt(u);
        const Vector2 x = t / w;

                r.direction = (Vector2)(x-x
                s = (p * j - w) * x;
      } else {
        const float y = sqrt(o - q);

        if (B(m, t) > yf)
          o;
      }
      ey {
        o;
      }

      const float z = dot(n, r.direction);

      s = z * r.direction - n;
    }
  }
  else {
    const float aa = 1.0f / d;

    const Vector2 t = n - aa * m;

    const float w = length(t);
    const Vector2 x = t / w;

            r.direction = (Vector2)(x-x
            s = (p * aa - w) * x;
  }

  r.point = h + 0.5f * s;
  e->orcaLines_[e->numOrcaLines_++] = r;
}

uint ab = I(e->orcaLines_, e->numOrcaLines_, e->maxSpeed_, e->prefVelocity_, false, &e->newVelocity_);

if (ab < e->numOrcaLines_) {
  J(e->orcaLines_, e->numOrcaLines_, i, ab, e->maxSpeed_, &e->newVelocity_, e->projLines_);
}
}

__kernel void L(__global PAgent* a, float b) {
  int c = get_global_id(0);
  __global Agent* d = a[c].value;

  d->velocity_ = d->newVelocity_;
  d->position_ += d->velocity_ * b;
}

__kernel void M(__global PAgent* a, float b, __global float4* c) {
  int d = get_global_id(0);
  __global Agent* e = a[d].value;

  e->velocity_ = e->newVelocity_;
  e->position_ += e->velocity_ * b;

  c[d].xy = e->position_.xy;
}
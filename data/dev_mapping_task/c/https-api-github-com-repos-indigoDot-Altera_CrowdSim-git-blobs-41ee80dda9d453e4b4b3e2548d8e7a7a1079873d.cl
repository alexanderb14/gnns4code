typedef float2 Vector2; struct __Agent; typedef struct __AgentNeighborBuf {
  float first;
  uint second;
} AgentNeighborBuf;

typedef struct __Agent {
  uint numAgentNeighbors_;
  uint maxNeighbors_;
  float maxSpeed_;
  float neighborDist_;

  uint numObstacleNeighbors_;

  Vector2 position_;

  float radius_;

  float timeHorizonObst_;
  Vector2 velocity_;
  uint id_;
} Agent;

typedef struct __AgentTreeNode {
  uint begin;
  uint end;
  uint left;
  float maxX;
  float maxY;
  float minX;
  float minY;
  volatile uint right;
} AgentTreeNode;

inline float A(Vector2 a) {
  return dot(a, a);
}

inline float B(float a) {
  return a * a;
}

typedef volatile struct __StackNode {
  uint retCode;
  float distSqLeft;
  float distSqRight;
  uint node;
} StackNode;

__global StackNode* C(__global StackNode* a, uint b, float c, float d, uint e) {
  a->retCode = b;
  a->distSqLeft = c;
  a->distSqRight = d;
  a->node = e;
  return a + 1;
}

__kernel void D(__global Agent* a, __global AgentTreeNode* b, __global AgentNeighborBuf* c, __global unsigned* d, __global StackNode* e) {
  Agent f = a[get_global_id(0)];

  f.numObstacleNeighbors_ = 0;
  float g = B(f.timeHorizonObst_ * f.maxSpeed_ + f.radius_);

  f.numAgentNeighbors_ = 0;

  if (f.maxNeighbors_ > 0) {
    g = B(f.neighborDist_);
    uint h = 0;
    __global StackNode* i = &e[get_global_id(0)];
    uint j = 0;

    float k;
    float l;

    for (;;) {
      switch (j) {
        case 0:
          if (b[h].end - b[h].begin <= 10) {
            for (uint m = b[h].begin; m < b[h].end; ++m) {
              const uint n = a[d[m]].id_;
              if (f.id_ != n) {
                const float o = A(f.position_ - a[d[m]].position_);

                if (o < g) {
                  const uint p = f.maxNeighbors_ * get_global_id(0);
                  uint q = f.numAgentNeighbors_;

                  if (q < f.maxNeighbors_) {
                    c[p + q].first = o;
                    c[p + q].second = n;
                    q++;
                  }

                  uint m = q - 1;

                  while (m != 0 && o < c[p + m - 1].first) {
                    c[p + m] = c[p + m - 1];
                    --m;
                  }

                  c[p + m].first = o;
                  c[p + m].second = n;

                  if (q == f.maxNeighbors_) {
                  }
                }
              }
            }
            break;
          } else {
            const volatile uint r = b[h].left;
            k = B(max(0.0f, b[r].minX - f.position_.x)) + B(max(0.0f, f.position_.x - b[r].maxX)) + B(max(0.0f, b[r].minY - f.position_.y)) + B(max(0.0f, f.position_.y - b[r].maxY));

            const volatile uint s = b[h].right;
            l = B(max(0.0f, b[s].minX - f.position_.x)) + B(max(0.0f, f.position_.x - b[s].maxX)) + B(max(0.0f, b[s].minY - f.position_.y)) + B(max(0.0f, f.position_.y - b[s].maxY));

            if (k < l) {
              if (k < g) {
                i = C(i, 1, k, l, h);
                h = r;
                j = 0;
                continue;

                case 1:

                  if (l < g) {
                    i = C(i, 3, k, l, h);
                    h = s;
                    j = 0;
                    continue;
                  }
              }
            } else {
              if (l < g) {
                i = C(i, 2, k, l, h);
                h = s;
                j = 0;
                continue;
                case 2:

                  if (k < g) {
                    i = C(i, 3, k, l, h);
                    h = r;
                    j = 0;
                    continue;
                  }
              }
            }
          }
        case 3:
          break;
      }

      if (&e[0] == i) {
        break;
      }

      i--;

      j = i->retCode;
      k = i->distSqLeft;
      l = i->distSqRight;
      h = i->node;
    }
  }
}
typedef uint svm_pointer_t; uint4 A(__global int* a, svm_pointer_t b, svm_pointer_t c); uint4 B(__global int* a, svm_pointer_t b, svm_pointer_t c, uint d); uint16 C(__global int* a, svm_pointer_t b, svm_pointer_t c); typedef float2 Vector2; typedef struct __attribute__((packed)) __attribute__((aligned(8))) __AgentNeighborBuf {
  float first;
  ushort second;
} AgentNeighborBuf;

typedef volatile struct __attribute__((packed)) __attribute__((aligned(32))) __Agent {
  uint numAgentNeighbors_;
  Vector2 position_;
  Vector2 velocity_;
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

inline float D(Vector2 a) {
  return dot(a, a);
}

inline float E(float a) {
  return a * a;
}

typedef struct __attribute__((packed)) __attribute__((aligned(16))) __StackNode {
  uchar retCode;
  float distSqLeft;
  float distSqRight;
  ushort node;
} StackNode;

StackNode* F(StackNode* a, uchar b, float c, float d, ushort e) {
  StackNode f;
  f.retCode = b;
  f.distSqLeft = c;
  f.distSqRight = d;
  f.node = e;
  *a = f;
  return a + 1;
}

Agent G(uint16 a) {
  Agent b;
  b.numAgentNeighbors_ = a.s0;
  b.position_.x = (float)a.s1;
  b.position_.y = (float)a.s2;
  b.velocity_.x = (float)a.s3;
  b.velocity_.y = (float)a.s4;
  b.id_ = (float)a.s5;

  return b;
}

AgentTreeNode H(uint16 a) {
  AgentTreeNode b;

  b.begin = a.s0;
  b.end = a.s1;
  b.left = a.s2;
  uint c = a.s3;
  b.maxX = *((float*)&c);
  uint d = a.s4;
  b.maxY = *((float*)&d);
  uint e = a.s5;
  b.minX = *((float*)&e);
  uint f = a.s6;
  b.minY = *((float*)&f);
  b.right = a.s7;

  return b;
}

__kernel void I(__global Agent* restrict a, __global AgentTreeNode* restrict b, __global AgentNeighborBuf* restrict c, __global unsigned* restrict d,

                uint e, svm_pointer_t f, svm_pointer_t g, __global int* restrict h, __global int* restrict i, __global int* restrict j) {
  for (uint k = 0; k < e; k++) {
    Agent l = a[k];

    StackNode m[20];
    StackNode* n = &m[0];

    float o = 225.0f;
    ushort p = 0;
    uchar q = 0;

    float r;
    float s;

    for (;;) {
      const AgentTreeNode t = b[p];
      ushort u;
      uchar v = 0;
      switch (q) {
        case 0:
          if (t.end - t.begin <= 10) {
            for (uint w = t.begin; w < t.end; ++w) {
              Agent x = a[d[w]];

              if (l.id_ != x.id_) {
                const float y = D(l.position_ - x.position_);

                if (y < o) {
                  const ushort z = 10 * k;

                  if (l.numAgentNeighbors_ < 10) {
                    c[z + l.numAgentNeighbors_].first = y;
                    c[z + l.numAgentNeighbors_].second = x.id_;
                    ++l.numAgentNeighbors_;
                  }

                  uchar w = l.numAgentNeighbors_ - 1;

                  while (w != 0 && y < c[z + w - 1].first) {
                    c[z + w] = c[z + w - 1];
                    --w;
                  }

                  c[z + w].first = y;
                  c[z + w].second = x.id_;

                  if (l.numAgentNeighbors_ == 10) {
                    o = c[z + l.numAgentNeighbors_ - 1].first;
                  }
                }
              }
            }
            break;
          } else {
            AgentTreeNode aa = b[t.left];

            r = E(max(0.0f, aa.minX - l.position_.x)) + E(max(0.0f, l.position_.x - aa.maxX)) + E(max(0.0f, aa.minY - l.position_.y)) + E(max(0.0f, l.position_.y - aa.maxY));

            AgentTreeNode ab = b[t.right];

            s = E(max(0.0f, ab.minX - l.position_.x)) + E(max(0.0f, l.position_.x - ab.maxX)) + E(max(0.0f, ab.minY - l.position_.y)) + E(max(0.0f, l.position_.y - ab.maxY));

            if (r < s) {
              if (r < o) {
                u = p;
                v = 1;
                p = t.left;
                q = 0;
                break;

                case 1:

                  if (s < o) {
                    u = p;
                    v = 3;
                    p = t.right;
                    q = 0;
                    break;
                  }
              }
            } else {
              if (s < o) {
                u = p;
                v = 2;
                p = t.right;
                q = 0;
                break;
                case 2:

                  if (r < o) {
                    u = p;
                    v = 3;
                    p = t.left;
                    q = 0;
                    break;
                  }
              }
            }
          }
        case 3:
          break;
      }
      if (v != 0) {
        n = F(n, v, r, s, u);
        continue;
      }

      if (&m[0] == n) {
        break;
      }

      n--;

      StackNode ac = *n;

      q = ac.retCode;
      r = ac.distSqLeft;
      s = ac.distSqRight;
      p = ac.node;
    }

    a[k].numAgentNeighbors_ = l.numAgentNeighbors_;
  }
}
struct tree_global {
  volatile int nextNode;
  volatile int activeNodes;
  int depth;
  int pad;
};

void A(__global int* a, const uint b);
int B(float4 a);
float4 C(int a);
float D(float a);

void A(__global int* a, const uint b) {
  for (int c = 0; c < 4; c++) {
    if (atomic_cmpxchg(&a[c], -1, b) == -1) {
      break;
    }
  }
}

int B(float4 a) {
  if (a.x <= 0 && a.y <= 0)
    return 0;
  else if (a.x <= 0 && a.y >= 0)
    return 1;
  else if (a.x >= 0 && a.y <= 0)
    return 2;
  else
    return 3;
}

float4 C(int a) {
  switch (a) {
    case 0:
      return (float4)(-1.0f, -1.0f, 0.0f, 0.0f);
    case 1:
      return (float4)(-1.0f, 1.0f, 0.0f, 0.0f);
    case 2:
      return (float4)(1.0f, -1.0f, 0.0f, 0.0f);
    case 3:
    default:
      return (float4)(1.0f, 1.0f, 0.0f, 0.0f);
  }
}
float D(float a) {
  int b;
  float c = frexp(a, &b);

  int d = (int)(1.0f / c);

  d--;
  d |= d >> 1;
  d |= d >> 2;
  d |= d >> 4;
  d |= d >> 8;
  d |= d >> 16;
  d++;

  return (1.0f / d) * __clc_pow(2.0f, b);
}
__kernel void E(__global struct tree_global* a, __global float4* b, __global float* c, __local float4* d, __local float4* e, __global float4* f, __global float4* g, __global float* h, __global float4* i, __global uint* j, __global int* k, __global int* l, __global uint* m, __global int* n, __global uint* o, __global uint* p, const uint q, const uint r) {
  uint s;

  s = get_global_id(0);
  while (s < q) {
    o[s] = 0;
    s += get_global_size(0);
  }

  s = get_global_id(0);
  while (s < r) {
    j[s] = 0;
    k[s] = -1;
    for (int t = 0; t < 4; t++) {
      n[s * 4 + t] = -1;
    }
    for (int t = 0; t < 4; t++) {
      m[s * 4 + t] = 0;
    }
    s += get_global_size(0);
  }

  float4 u = (float4)0x1.fffffep127f;
  float4 v = (float4)-0x1.fffffep127f;
  s = get_global_id(0);
  while (s < q) {
    float4 w = b[s];
    u = min(w, u);
    v = max(w, v);
    s += get_global_size(0);
  }
  d[get_global_id(0)] = u;
  e[get_global_id(0)] = v;

  barrier(1);

  if (get_global_id(0) == 0) {
    u = (float4)0x1.fffffep127f;
    v = (float4)-0x1.fffffep127f;
    for (s = 0; s < get_global_size(0); s++) {
      u = min(d[s], u);
      v = max(e[s], v);
    }
    float x = fmax(fmax(__clc_fabs(u.x), __clc_fabs(v.x)), fmax(__clc_fabs(u.y), __clc_fabs(v.y)));
    f[0] = 0.0f;
    g[0] = D(x);
    j[0] = 1;
    l[0] = 0;
    a->nextNode = 1;
    a->activeNodes = 1;
  }

  barrier(2);

  int y = 0;

  do {
    y++;

    s = get_global_id(0);
    while (s < q) {
      const uint z = o[s];

      if (j[z] == 1) {
        float4 aa = b[s] - f[z];
        const uint t = B(aa);
        p[s] = t;
        atomic_add(&m[z * 4 + t], 1);
      }
      s += get_global_size(0);
    }

    barrier(2 | 1);

    uint ab = a->nextNode;

    s = get_global_id(0);
    while (s < ab) {
      if (j[s] == 1) {
        int ac = -1;
        for (int t = 0; t < 4; t++) {
          uint ad = m[s * 4 + t];
          if (ad == 0)
            continue;

          uint ae = atomic_add(&a->nextNode, 1);
          n[s * 4 + t] = ae;
          g[ae] = g[s] / 2.0f;
          f[ae] = f[s] + g[ae] * C(t);
          k[ae] = s;
          l[ae] = y;
          a->depth = y;
          if (ad <= 4) {
            j[ae] = 3;
          } else {
            j[ae] = 1;
            ac++;
          }
        }

        j[s] = 2;
        atomic_add(&a->activeNodes, ac);
      }
      s += get_global_size(0);
    }

    barrier(2);

    s = get_global_id(0);
    while (s < q) {
      if (j[o[s]] == 2) {
        uint af = o[s];
        uint t = p[s];
        uint ad = m[af * 4 + t];
        uint ag = n[af * 4 + t];

        o[s] = ag;

        if (ad <= 4) {
          A(n + ag * 4, s);
        }
      }
      s += get_global_size(0);
    }

    barrier(2);

  } while (y <= a->depth);

  for (int ah = y; ah >= 0; ah--) {
    s = get_global_id(0);
    while (s < r) {
      if (l[s] == ah) {
        if (j[s] == 2) {
          float4 ai = (float)0;
          float aj = (float)0;
          for (uint t = 0; t < 4; t++) {
            int ag = n[s * 4 + t];
            if (ag < 0)
              continue;
            ai += i[ag];
            aj += h[ag];
          }
          i[s] = ai / aj;
          h[s] = aj;
        } else if (j[s] == 3) {
          float4 ai = (float)0;
          float aj = (float)0;
          for (uint t = 0; t < 4; t++) {
            int ak = n[s * 4 + t];
            if (ak < 0)
              break;
            ai += b[ak] * c[ak];
            aj += c[ak];
          }
          i[s] = ai / aj;
          h[s] = aj;
        }
      }
      s += get_global_size(0);
    }

    barrier(2);
  }
}
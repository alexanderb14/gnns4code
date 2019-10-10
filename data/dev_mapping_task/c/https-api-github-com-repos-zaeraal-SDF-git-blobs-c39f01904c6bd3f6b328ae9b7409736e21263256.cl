__constant unsigned char Ga[] = {
    0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4, 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5, 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
    1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7, 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7, 4, 5, 5, 6, 5, 6, 6, 7, 5, 6, 6, 7, 6, 7, 7, 0,
};
inline unsigned char A(unsigned char a) {
  return Ga[a];
}

float B(float a, float b) {
  float c = min((a / b), 1.0f);
  return ((1.0f / sqrt(2 * 0x1.921fb6p+1f)) * exp((-c * c) / 2.0f) * 100.0f);
}

typedef struct {
  unsigned int ostack[1024];
  unsigned char tstack[1024];
} CastStackz;

inline unsigned int C(CastStackz* a, int b, unsigned char* c) {
  (*c) = (*a).tstack[b];
  return (*a).ostack[b];
}

inline void D(CastStackz* a, int b, unsigned int c, unsigned char d) {
  (*a).tstack[b] = d;
  (*a).ostack[b] = c;
}

__constant unsigned char Gb[] = {8, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
                                 7, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0};

unsigned char E(unsigned char a) {
  return Gb[a];
}

__kernel void F(__global const float4* a, __global const float4* b, __global const uint* c, __global const float* d, __global const uint* e, __global float* f, const uint g, const float h) {
  uint i = get_global_id(0);

  if (i > g)
    return;

  float4 j = a[i];
  float k = j.w;
  j.w = 1.0f;

  float l = k * 0.5f;
  float m = 0;

  float n = 0;
  float o = 0.0f;
  float p = 1.7320508075f;
  float q = 0.0f;
  float r = 0.0f;

  CastStackz s;
  int t = 0;
  unsigned int u = c[0];
  unsigned char v = (u & 0xFF);
  unsigned char w = E(v);
  ;
  unsigned int x = 0;

  float y[1024];
  y[0] = h;
  for (int z = 1; z < 1024; z++) {
    y[z] = y[z - 1] * 0.5f;
  }

  D(&s, t, u, w);
  while (t >= 0) {
    u = C(&s, t, &w);
    v = (u & 0xFF);
    if (v == 0) {
      u = u >> 8;

      n = (float)e[u];
      p = y[t] * 1.7320508075f;
      m = distance(j, b[u]) - p - l;
      if (m < 0.0f) {
        m = -m;
        o = (m / (p + p)) * 100.0f;
        if (o > 100.0f)
          o = 100.0f;
        n = n * o;
      }
      q += d[u] * n;
      r += n;

      t--;
    } else {
      if (w >= 8) {
        t--;
        continue;
      }

      x = u >> 8;

      v = v << (8 - w);
      v = v >> (8 - w);
      x = x + A(v);

      m = distance(j, b[x]) - l;
      p = y[t + 1] * 1.7320508075f;
      if (m <= (-p)) {
        o = 100.0f;
        n = (float)e[x] * o;

        q = q + (d[x] * n);
        r = r + n;

        v = (u & 0xFF);
        v = v >> (w + 1);
        v = v << (w + 1);
        w = E(v);
        D(&s, t, u, w);
      } else if (m <= p) {
        D(&s, t + 1, c[x], E(c[x] & 0xFF));
        v = (u & 0xFF);
        v = v >> (w + 1);
        v = v << (w + 1);
        w = E(v);
        D(&s, t, u, w);
        t = t + 1;
      } else {
        v = (u & 0xFF);
        v = v >> (w + 1);
        v = v << (w + 1);
        w = E(v);
        D(&s, t, u, w);
      }
    }
  }

  n = 4.0f;
  r = r + n;
  q = q + (k * n);
  f[i] = q / r;
}
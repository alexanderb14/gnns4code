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
  float o = 1.7320508075f;
  float p = 0.0f;
  float q = 0.0f;

  CastStackz r;
  int s = 0;
  unsigned int t = c[0];
  unsigned char u = (t & 0xFF);
  unsigned char v = E(u);
  ;
  unsigned int w = 0;

  float x[1024];
  x[0] = h;
  for (int y = 1; y < 1024; y++) {
    x[y] = x[y - 1] * 0.5f;
  }

  D(&r, s, t, v);
  while (s >= 0) {
    t = C(&r, s, &v);
    u = (t & 0xFF);
    if (u == 0) {
      t = t >> 8;

      n = (float)e[t];
      o = x[s] * 1.7320508075f;
      m = distance(j, b[t]) + o - l;
      if (m > 0.0001f) {
        float z = (m / o) * 100.0f;
        if (z < 0.0001f)
          z = 0.0001f;
        z = 1 / z;
        n = n * z;
      }

      p += d[t] * n;
      q += n;

      s--;
    } else {
      if (v >= 8) {
        s--;
        continue;
      }

      w = t >> 8;

      u = u << (8 - v);
      u = u >> (8 - v);
      w = w + A(u);

      m = distance(j, b[w]) - l;
      o = x[s + 1] * 1.7320508075f;
      if (m <= (-o)) {
        n = (float)e[w];
        m = m + o;
        if (m > 0.0001f) {
          float z = (m / o) * 100.0f;
          if (z < 0.0001f)
            z = 0.0001f;
          z = 1 / z;
          n = n * z;
        }

        p += d[w] * n;
        q += n;

        u = (t & 0xFF);
        u = u >> (v + 1);
        u = u << (v + 1);
        v = E(u);
        D(&r, s, t, v);
      } else if (m <= o) {
        D(&r, s + 1, c[w], E(c[w] & 0xFF));
        u = (t & 0xFF);
        u = u >> (v + 1);
        u = u << (v + 1);
        v = E(u);
        D(&r, s, t, v);
        s = s + 1;
      } else {
        u = (t & 0xFF);
        u = u >> (v + 1);
        u = u << (v + 1);
        v = E(u);
        D(&r, s, t, v);
      }
    }
  }

  n = 4.0f;
  q += n;
  p += k * n;
  f[i] = p / q;
}
__constant float Ga[2] = {0.064493001f, 0.039210598915815353f};

inline void A(unsigned int a, unsigned char* b, unsigned char* c) {
  *b = (a & 0x000000FF);
  *c = (a & 0x0000FF00) >> 8;
}

inline void B(unsigned int a, unsigned int* b) {
  *b = (a & 0xFFFFFF00) >> 8;
}

__kernel void C(unsigned int a, unsigned int b, __global float* c, __global float* d, __global float* e, __global unsigned int* f, __global unsigned int* g, __global unsigned int* h, __global float* i) {
  int j = get_global_id(0);
  size_t k = get_global_size(0);

  float l = c[j];
  float m = d[j];
  float n = e[j];
  unsigned int o = f[j];
  unsigned int p = g[j];
  unsigned int q = h[p];

  unsigned char r;
  unsigned char s;
  unsigned int t;
  unsigned int u = 1;

  A(o, &r, &s);
  B(q, &t);

  l -= (l * Ga[s]);

  u = u << r;
  unsigned int v = (t & u);

  if (v > 0)
    l += m;

  c[j] = l;
  d[j] = m;
  e[j] = n;
  i[j] = t;
}
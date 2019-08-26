typedef struct {
  int P;
  uint Length;
  char FileID[16];
  char U[32];
  char O[32];
} PDFParams;

typedef struct {
  uint size_bytes;
  char password[(64 - sizeof(uint))];
} password_t;

typedef struct { uint v[4]; } password_hash_t;

typedef struct {
  uint size;
  char buffer[(128 - sizeof(uint))];
} buffer_t;

void A(const char* restrict a, uint b, uint* restrict c);
void B(const buffer_t* a, buffer_t* b);

typedef struct {
  uchar perm[256];
  uchar index1;
  uchar index2;
} rc4_state_t;

void C(rc4_state_t* const a, const char* b, int c);
void D(rc4_state_t* const a, const char* b, char* c, int d);
void E(const buffer_t* a, const buffer_t* b, buffer_t* c);

void F(buffer_t* a, const char* b, uint c);
void G(buffer_t* a, constant const char* b, uint c);
void H(buffer_t* a, const char* b, uint c);
void I(buffer_t* a, uchar b);
int J(const buffer_t* a, const buffer_t* b);

__inline void K(uchar* a, uchar* b) {
  uchar c;

  c = *a;
  *a = *b;
  *b = c;
}

void C(rc4_state_t* const a, const char* b, int c) {
  uchar d;
  int e;
  const uchar* f = (const uchar*)b;

  for (e = 0; e < 256; e++) {
    a->perm[e] = (uchar)e;
  }
  a->index1 = 0;
  a->index2 = 0;

  for (d = e = 0; e < 256; e++) {
    d += a->perm[e] + f[e % c];
    K(&a->perm[e], &a->perm[d]);
  }
}

void D(rc4_state_t* const a, const char* b, char* c, int d) {
  int e;
  uchar f;
  const uchar* g = (const uchar*)b;
  uchar* h = (uchar*)c;

  for (e = 0; e < d; e++) {
    a->index1++;
    a->index2 += a->perm[a->index1];

    K(&a->perm[a->index1], &a->perm[a->index2]);

    f = a->perm[a->index1] + a->perm[a->index2];
    h[e] = g[e] ^ a->perm[f];
  }
}

__kernel void L(global const password_t* a, global const password_t* b, global password_hash_t* c) {
  int d = get_global_id(0);
  uint e;
  password_t f;
  password_t g;
  password_hash_t h;
  for (e = 0; e < a[d].size_bytes; e++) {
    f.password[e] = a[d].password[e];
  }
  f.size_bytes = a[d].size_bytes;
  for (e = 0; e < b[d].size_bytes; e++) {
    g.password[e] = b[d].password[e];
  }
  g.size_bytes = b[d].size_bytes;

  rc4_state_t i;
  C(&i, f.password, f.size_bytes);
  D(&i, g.password, (char*)&h, g.size_bytes);

  for (e = 0; e < 4; e++) {
    c[d].v[e] = h.v[e];
  }
}
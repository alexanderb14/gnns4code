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

__constant const char Ga[] =
    "\x28\xBF\x4E\x5E\x4E\x75\x8A\x41"
    "\x64\x00\x4E\x56\xFF\xFA\x01\x08"
    "\x2E\x2E\x00\xB6\xD0\x68\x3E\x80"
    "\x2F\x0C\xA9\xFE\x64\x53\x69\x7A";

void K(buffer_t* a) {
  buffer_t b;

  int c;
  for (c = 0; c < 25; c++) {
    B(a, &b);
    B(&b, a);
  }
}

void L(constant const PDFParams* a, const password_t* b, buffer_t* c) {
  buffer_t d;

  H(&d, b->password, b->size_bytes);
  G(&d, Ga, 32 - b->size_bytes);
  G(&d, a->O, 32);
  G(&d, (constant char*)&a->P, sizeof(int));
  G(&d, a->FileID, 16);
  B(&d, c);

  K(c);
  c->size = a->Length / 8;
}

void M(buffer_t* a, buffer_t* b) {
  uchar c;
  buffer_t d;
  for (c = 0; c < 20; c += 2) {
    I(a, c);
    E(a, b, &d);
    I(a, c ^ (c + 1));
    E(a, &d, b);
    I(a, c + 1);
  }
}

void N(buffer_t* a, buffer_t* b) {
  uchar c;
  buffer_t d;
  for (c = 0; c < 20; c += 2) {
    I(a, 20 - 1 - c);
    E(a, b, &d);
    I(a, (20 - 1 - c) ^ (20 - 2 - c));
    E(a, &d, b);
    I(a, 20 - 2 - c);
  }
}

void O(constant const PDFParams* a, const password_t* b, buffer_t* c) {
  buffer_t d;
  H(&d, b->password, b->size_bytes);
  G(&d, Ga, 32 - b->size_bytes);
  B(&d, c);

  K(c);
  c->size = a->Length / 8;
}

void P(constant const PDFParams* a, const password_t* b, buffer_t* c) {
  buffer_t d;
  d.size = 0;
  G(&d, Ga, 32);
  G(&d, a->FileID, 16);
  B(&d, c);

  buffer_t e;
  L(a, b, &e);
  M(&e, c);

  c->size = 16;
}

int Q(constant const PDFParams* a, const password_t* b) {
  buffer_t c;
  P(a, b, &c);

  uint d;
  for (d = 0; d < c.size; d++) {
    if (a->U[d] != c.buffer[d]) {
      return 0;
    }
  }
  return 1;
}

uint R(constant const PDFParams* a, const password_t* b) {
  buffer_t c;
  O(a, b, &c);

  union {
    buffer_t buf;
    password_t pass;
  } d;

  d.buf.size = 0;
  G(&d.buf, a->O, 32);
  N(&c, &d.buf);

  return Q(a, &d.pass);
}

uint S(constant const PDFParams* a, constant const password_t* b, const password_t* c) {
  buffer_t d;
  O(a, c, &d);

  union {
    buffer_t buf;
    password_t pass;
  } e;

  e.buf.size = 0;
  G(&e.buf, a->O, 32);
  N(&d, &e.buf);

  uint f;
  for (f = 0; f < b->size_bytes; f++) {
    if (b->password[f] != e.pass.password[f]) {
      return 0;
    }
  }
  for (; f < 16; f++) {
    if (Ga[f] != e.pass.password[f]) {
      return 0;
    }
  }
  return 1;
}

__kernel void T(constant const PDFParams* a, const global password_t* b, global uint* c) {
  int d = get_global_id(0);
  uint e;
  password_t f;
  for (e = 0; e < b[d].size_bytes; e++) {
    f.password[e] = b[d].password[e];
  }
  f.size_bytes = b[d].size_bytes;

  c[d] = R(a, &f);
}

__kernel void U(constant const PDFParams* a, constant const password_t* b, const global password_t* c, global uint* d) {
  int e = get_global_id(0);
  uint f;
  password_t g;
  for (f = 0; f < c[e].size_bytes; f++) {
    g.password[f] = c[e].password[f];
  }
  g.size_bytes = c[e].size_bytes;

  d[e] = S(a, b, &g);
}
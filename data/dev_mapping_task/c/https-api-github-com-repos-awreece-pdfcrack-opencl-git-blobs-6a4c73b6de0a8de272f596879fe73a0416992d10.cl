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
void F(buffer_t* a, private const char* b, uint c) {
  uint d;
  for (d = 0; d < c; d++) {
    a->buffer[a->size + d] = b[d];
  }
  a->size = a->size + c;
}
void G(buffer_t* a, constant const char* b, uint c) {
  uint d;
  for (d = 0; d < c; d++) {
    a->buffer[a->size + d] = b[d];
  }
  a->size = a->size + c;
}

void H(buffer_t* a, const char* b, uint c) {
  uint d;
  for (d = 0; d < c; d++) {
    a->buffer[d] = b[d];
  }
  a->size = c;
}

void B(const buffer_t* a, buffer_t* b) {
  A(a->buffer, a->size, (uint*)b->buffer);
  b->size = 16;
}

void E(const buffer_t* a, const buffer_t* b, buffer_t* c) {
  rc4_state_t d;
  C(&d, a->buffer, a->size);
  D(&d, b->buffer, c->buffer, b->size);
  c->size = b->size;
}

void I(buffer_t* a, uchar b) {
  uint c;
  for (c = 0; c < a->size; c++) {
    a->buffer[c] = (char)(((uchar)a->buffer[c]) ^ b);
  }
}

int J(const buffer_t* a, const buffer_t* b) {
  if (a->size != b->size) {
    return 1;
  }

  uint c;
  for (c = 0; c < a->size; c++) {
    if (a->buffer[c] != b->buffer[c]) {
      return 1;
    }
  }

  return 0;
}
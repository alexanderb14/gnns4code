typedef struct {
  size_t offset;
  size_t max_size;
  __local char* buffer;
} LocalMallocState;

void A(__local char* a, size_t b, LocalMallocState* c) {
  c->offset = 0;
  c->max_size = b;
  c->buffer = a;
}

__local void* B(size_t a, LocalMallocState* b) {
  b->offset += a;

  if (b->offset > b->max_size) {
    return (__local void*)0;
  }

  return b->buffer + b->offset;
}

void C(size_t a, LocalMallocState* b) {
  b->offset -= a;
}
__kernel void D(void) {
  __local char a[200];
  LocalMallocState b;
  __local void* c;

  A(a, 200, &b);

  for (int d = 0; d < 20; d++) {
    if (d % 2) {
      c = B(20, &b);
      C(20, &b);
    } else {
      c = B(40, &b);
      C(40, &b);
    }
  }
}
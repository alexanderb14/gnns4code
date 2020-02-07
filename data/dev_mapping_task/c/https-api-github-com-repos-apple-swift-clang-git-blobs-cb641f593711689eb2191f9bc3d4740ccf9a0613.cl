struct S {
  int x;
  int y;
  int* z;
};
void A(__private int* a) {
}

void B(__global int* a) {
}

void C(__local int* a) {
}

void D(__constant int* a) {
}

void E(private int* a) {
}

void F(global int* a) {
}

void G(local int* a) {
}

void H(constant int* a) {
}
void I(int* a) {
  int b;
}

typedef int int_td;
typedef int* intp_td;

void J(global int_td* a, constant int_td* b, intp_td c) {
  *a = *b;
  *c = 0;
}

void K() {
  struct S* a;

  a->x = 0;
}

void L(void) {
}

int M(void) {
  return 0;
}
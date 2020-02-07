typedef struct { int i; } program_state_struct;

typedef struct { int dummy; } used_params_struct;

typedef unsigned char fsm_state;

bool A(fsm_state a) {
  if ((a ^ 0x00) == 0 || (a ^ 0x03) == 0)
    return true;
  return false;
}

bool B(char* a, __constant char* b) {
  int c = 0;
  while (a[c] != '\0' && b[c] != '\0') {
    if (a[c] != b[c])
      return false;
    ++c;
  }
  if (a[c] != b[c])
    return false;
  return true;
}

void C(program_state_struct* a, const __global program_state_struct* b) {
  if (a == 0 || b == 0)
    return;

  a->i = b->i;
}

unsigned int D(unsigned int a, fsm_state b) {
  if (a == 0 && b == 8)
    return 0;
  if (a == 0 && b == 6)
    return 1;
  if (a == 0 && b == 3)
    return 2;

  return 0;
}

fsm_state E(unsigned int a, unsigned int b) {
  if (a == 0 && b == 0)
    return 8;
  if (a == 0 && b == 1)
    return 6;
  if (a == 0 && b == 2)
    return 3;

  return 0;
}
void F(bool a, bool b, fsm_state c, __global fsm_state* d) {
  if (c == 8 && (a && b))
    *d = 8;
  if (c == 8 && (a && !b))
    *d = 8;
  if (c == 8 && (!a && b))
    *d = 8;
  if (c == 8 && (!a && !b))
    *d = 8;
  if (c == 6 && (a && b))
    *d = 8;
  if (c == 6 && (a && !b))
    *d = 6;
  if (c == 6 && (!a && b))
    *d = 8;
  if (c == 6 && (!a && !b))
    *d = 3;
  if (c == 3 && (a && b))
    *d = 3;
  if (c == 3 && (a && !b))
    *d = 3;
  if (c == 3 && (!a && b))
    *d = 3;
  if (c == 3 && (!a && !b))
    *d = 3;
  else
    return;
}

__kernel void G(__global program_state_struct const* restrict a, __global fsm_state* b, __global fsm_state* c, __global uint* d, __global uint* e, __global used_params_struct* f, uint g) {
  uint h = g;
  int i = get_global_id(0);
  int j = h / get_global_size(0);

  program_state_struct k;
  fsm_state l;
  unsigned int m = 0;

  int n;

  bool o;
  bool p;

prop0:
  if (i + j <= d[0])
    goto prop1;

  l = c[0];

  for (int q = (i * j); q < ((i + 1) * j); ++q) {
    C(&k, &a[q]);

    n = k.i;
    n = k.i;

    o = (n < 8);

    p = (n == 8);

    F(o, p, 6, &(b[h * 0 + 0 + q * 1]));
  }

prop1:

  return;
}
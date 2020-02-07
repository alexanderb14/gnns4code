typedef struct {
  int a;
  int b[1];
} LocalStruct;

local int* A(local int* a, local int* b) {
  local int* c = b - 1;
  return (a <= c) ? a : 0;
}

kernel void B(void) {
  local LocalStruct a;
  a.a = 0;
  *(A(a.b, &a)) = a.a;
}
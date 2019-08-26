typedef struct {
  local int* min;
  local int* max;
} Inner;

typedef struct { Inner ll; } Outer;

local int* A(local int* a) {
  return (((int)a) & 0x1) ? a : a + 1;
}

kernel void B(void) {
  local int a;
  Outer b = { auter* c = &b;
  *A(c->ll.max) = 1;
}
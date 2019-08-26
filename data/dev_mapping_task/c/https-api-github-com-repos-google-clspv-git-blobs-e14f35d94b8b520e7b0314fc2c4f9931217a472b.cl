typedef struct {
  char c;
  uint a;
  float f;
} Foo;
__constant Foo Ga[3] = {{'a', 0x1234abcd, 1.0}, {'b', 0xffffffff, 1.5}, {0}};

kernel void A(global uint* a, uint b) {
  *a = Ga[b].a;
}
typedef struct {
  local int* min;
  local int* max;
} Limits;

inline void A(local int* a) {
  a ? 0 : 1;
}

kernel void B(void) {
  local int a[1];
  Limits b = {a};
  A(b.max);
}
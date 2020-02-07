kernel void A(void) {
  local long a;
  local long b;
  local int* c = (local int*)&a;
  if (&a > &b)
    c++;
  *c = 0;
}
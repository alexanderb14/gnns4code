kernel void A(global int* a) {
  local int b;
  if (*a > 0)
    b = *a;
  *a = b;
}
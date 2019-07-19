kernel void A(void) {
  local uint a[1];
  local uint b[1];
  *(a > b ? a : b) = 0;
}
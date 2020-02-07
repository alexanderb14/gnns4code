__kernel void A() {
  float a;
  a = 0x1.fffffep127f;
  a = __builtin_huge_valf();
  a = __builtin_huge_val();
  a = __builtin_inff();
  a = __builtin_nanf("");
  a = 0x1.5bf0a8p+1f;
  a = 0x1.715476p+0f;
  a = 0x1.bcb7b2p-2f;
  a = 0x1.62e430p-1f;
  a = 0x1.26bb1cp+1f;
  a = 0x1.921fb6p+1f;
  a = 0x1.921fb6p+0f;
  a = 0x1.921fb6p-1f;
  a = 0x1.45f306p-2f;
  a = 0x1.45f306p-1f;
  a = 0x1.20dd76p+0f;
  a = 0x1.6a09e6p+0f;
  a = 0x1.6a09e6p-1f;
}
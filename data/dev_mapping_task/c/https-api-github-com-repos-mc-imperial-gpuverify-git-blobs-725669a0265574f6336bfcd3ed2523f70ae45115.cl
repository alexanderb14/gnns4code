__kernel void A() {
  float2 a;
  float b;
  a.x = 42.0f;
  a.y = 42.0f;
  b = a.x;
  b = a.y;
}
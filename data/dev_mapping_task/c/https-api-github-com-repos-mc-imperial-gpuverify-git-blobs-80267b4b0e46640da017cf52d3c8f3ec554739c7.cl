__kernel void A() {
  double2 a;
  double b;
  a.x = 42.0f;
  a.y = 42.0f;
  b = a.x;
  b = a.y;
}
__kernel void A() {
  double4 a;
  double b;
  a.x = 42.0f;
  a.y = 42.0f;
  a.z = 42.0f;
  a.w = 42.0f;
  b = a.x;
  b = a.y;
  b = a.z;
  b = a.w;
}
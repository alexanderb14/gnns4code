typedef struct { float f0; } point3;

point3 A(point3 a, point3 b);
point3 A(point3 a, point3 b) {
  point3 c;
  c.f0 = a.f0 - b.f0;
  return c;
}

__kernel void B(__global point3* a) {
  *a = A(*a, *a);
}
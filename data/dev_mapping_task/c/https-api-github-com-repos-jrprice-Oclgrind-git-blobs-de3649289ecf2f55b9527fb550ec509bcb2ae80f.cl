union U {
  uint a;
  uint b;
};

uint A(union U a) {
  uint b = a.a;
  a.b = 777;
  return b;
}

kernel void B(global uint* a) {
  union U b = {42};
  a[0] = A(b);
  a[1] = b.b;
}
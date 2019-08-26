typedef struct { int cells[9]; } Mat3X3;

typedef struct { int cells[16]; } Mat4X4;

typedef struct { int cells[1024]; } Mat32X32;

typedef struct { int cells[4096]; } Mat64X64;

struct StructOneMember {
  int2 x;
};

struct StructTwoMember {
  int2 x;
  int2 y;
};

struct LargeStructOneMember {
  int2 x[100];
};

struct LargeStructTwoMember {
  int2 x[40];
  int2 y[20];
};

Mat4X4 __attribute__((noinline)) A(Mat3X3 a) {
  Mat4X4 b;
  return b;
}
kernel void B(global Mat3X3* a, global Mat4X4* b) {
  b[0] = A(a[1]);
}

Mat64X64 __attribute__((noinline)) C(Mat32X32 a) {
  Mat64X64 b;
  return b;
}
kernel void D(global Mat32X32* a, global Mat64X64* b) {
  b[0] = C(a[1]);
}

void E(struct StructOneMember a) {
  a.x = (int2)(0, 0);
}

void F(struct LargeStructOneMember a) {
  a.x[0] = (int2)(0, 0);
}
kernel void G(void) {
  local struct LargeStructOneMember a;
  F(a);
}

void H(void) {
  struct LargeStructOneMember a;
  F(a);
}

kernel void I(struct StructOneMember a) {
  E(a);
}

kernel void J(struct LargeStructOneMember a) {
  F(a);
}

void K(struct StructTwoMember a) {
  a.y = (int2)(0, 0);
}

void L(struct LargeStructTwoMember a) {
  a.y[0] = (int2)(0, 0);
}

kernel void M(struct StructTwoMember a) {
  K(a);
}

kernel void N(struct LargeStructTwoMember a) {
  L(a);
}
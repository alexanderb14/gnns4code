__kernel void A(uint a, __global uint* b, __global int* c) {
  uint d = 0;
  for (uint e = 0; e < a; e++) {
    const int f = c[e];
    if (f == 2) {
      d++;
    }
  }
  *b = d;
}

__kernel void B(uint a, __global uint* b, __global int4* c) {
  uint d = 0;
  for (uint e = 0; e < a; e++) {
    const int4 f = c[e];
    if (all(f == (int4)(0, 1, 2, 3))) {
      d++;
    }
  }
  *b = d;
}

__kernel void C(uint a, __global uint* b, __global char* c) {
  uint d = 0;
  for (uint e = 0; e < a; e++) {
    const char f = c[e];
    if (f == '\n') {
      d++;
    }
  }
  *b = d;
}

__kernel void D(uint a, __global uint* b, __global uchar* c) {
  uint d = 0;
  for (uint e = 0; e < a; e++) {
    const uchar f = c[e];
    if (f == 0x10) {
      d++;
    }
  }
  *b = d;
}

__kernel void E(uint a, __global uint* b, __global int2* c) {
  uint d = 0;
  for (uint e = 0; e < a; e++) {
    const int2 f = c[e];
    if ((f.s0) < 4) {
      d++;
    }
  }
  *b = d;
}
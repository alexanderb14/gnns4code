kernel void A(global float* a, int b, int c, int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  int g;

  if ((e < b) && (f < c)) {
    for (g = 0; g < 4; ++g) {
      a[(8 + b) * ((8 + c) * (g + 4) + f + 4) + e + 4] = (8 + b) * ((8 + c) * (g + 4) + (f + 4)) + e + 4;
    }
    for (g = d - 4; g < d; ++g) {
      a[(8 + b) * ((8 + c) * (g + 4) + f + 4) + e + 4] = (8 + b) * ((8 + c) * (g + 4) + (f + 4)) + e + 4;
    }
  }

  if (((e >= 0) && (e < 4)) || ((e >= (b - 4)) && (e < b))) {
    for (g = 0; g < d; ++g) {
      a[(8 + b) * ((8 + c) * (g + 4) + f + 4) + e + 4] = (8 + b) * ((8 + c) * (g + 4) + (f + 4)) + e + 4;
    }
  }

  if (((f >= 0) && (f < 4)) || ((f >= (c - 4)) && (f < c))) {
    for (g = 0; g < d; ++g) {
      a[(8 + b) * ((8 + c) * (g + 4) + f + 4) + e + 4] = (8 + b) * ((8 + c) * (g + 4) + (f + 4)) + e + 4;
    }
  }
}
kernel void B(int a, int b, int c, global float* d, global float* e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h;

  if ((f < a) && (g < b)) {
    for (h = 0; h < 4; ++h) {
      e[f + a * (g + (h * b))] = d[(2 * 4 + a) * ((2 * 4 + b) * (h + 4) + (g + 4)) + f + 4];
    }
  }
}

kernel void C(int a, int b, int c, global float* d, global float* e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h;

  if ((f < a) && (g < b)) {
    for (h = 0; h < 4; ++h) {
      d[(2 * 4 + a) * ((2 * 4 + b) * (h + 4) + (g + 4)) + f + 4] = e[f + a * (g + (h * b))];
    }
  }
}

kernel void D(int a, int b, int c, global float* d, global float* e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h;

  if ((f < a) && (g < b)) {
    for (h = c - 4; h < c; ++h) {
      e[f + a * (g + ((h - c + 4) * b))] = d[(2 * 4 + a) * ((2 * 4 + b) * (h + 4) + (g + 4)) + f + 4];
    }
  }
}

kernel void E(int a, int b, int c, global float* d, global float* e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h;

  if ((f < a) && (g < b)) {
    for (h = c - 4; h < c; ++h) {
      d[(2 * 4 + a) * ((2 * 4 + b) * (h + 4) + (g + 4)) + f + 4] = e[f + a * (g + ((h - c + 4) * b))];
    }
  }
}

kernel void F(int a, int b, int c, global float* d, global float* e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h;
  if ((f >= 0) && (f < 4)) {
    for (h = 0; h < c; ++h) {
      e[f + 4 * (g + (h * b))] = d[(2 * 4 + a) * ((2 * 4 + b) * (h + 4) + (g + 4)) + f + 4];
    }
  }
}

kernel void G(int a, int b, int c, global float* d, global float* e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h;
  if ((f >= 0) && (f < 4)) {
    for (h = 0; h < c; ++h) {
      d[(2 * 4 + a) * ((2 * 4 + b) * (h + 4) + (g + 4)) + f + 4] = e[f + 4 * (g + (h * b))];
    }
  }
}

kernel void H(int a, int b, int c, global float* d, global float* e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h;
  if ((f >= 0) && (f < 4)) {
    for (h = 0; h < c; ++h) {
      e[f + 4 * (g + (h * b))] = d[(2 * 4 + a) * ((2 * 4 + b) * (h + 4) + (g + 4)) + f + a - 4 + 4];
    }
  }
}

kernel void I(int a, int b, int c, global float* d, global float* e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h;
  if ((f >= 0) && (f < 4)) {
    for (h = 0; h < c; ++h) {
      d[(2 * 4 + a) * ((2 * 4 + b) * (h + 4) + (g + 4)) + f + a - 4 + 4] = e[f + 4 * (g + (h * b))];
    }
  }
}

kernel void J(int a, int b, int c, global float* d, global float* e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h;
  if ((g >= 0) && (g < 4)) {
    for (h = 0; h < c; ++h) {
      e[f + a * (g + (h * 4))] = d[(2 * 4 + a) * ((2 * 4 + b) * (h + 4) + (g + b - 4 + 4)) + f + 4];
    }
  }
}

kernel void K(int a, int b, int c, global float* d, global float* e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h;
  if ((g >= 0) && (g < 4)) {
    for (h = 0; h < c; ++h) {
      d[(2 * 4 + a) * ((2 * 4 + b) * (h + 4) + (g + b - 4 + 4)) + f + 4] = e[f + a * (g + (h * 4))];
    }
  }
}

kernel void L(int a, int b, int c, global float* d, global float* e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h;
  if ((g >= 0) && (g < 4)) {
    for (h = 0; h < c; ++h) {
      e[f + a * (g + (h * 4))] = d[(2 * 4 + a) * ((2 * 4 + b) * (h + 4) + (g + 4)) + f + 4];
    }
  }
}

kernel void M(int a, int b, int c, global float* d, global float* e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h;
  if ((g >= 0) && (g < 4)) {
    for (h = 0; h < c; ++h) {
      d[(2 * 4 + a) * ((2 * 4 + b) * (h + 4) + (g + 4)) + f + 4] = e[f + a * (g + (h * 4))];
    }
  }
}
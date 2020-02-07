kernel void A(global float* a) {
  float b[4] = {7.f, 42.f, -1.f, 0.f};

  for (int c = 0; c < 4; c++) {
    a[c] = b[c];
  }
}
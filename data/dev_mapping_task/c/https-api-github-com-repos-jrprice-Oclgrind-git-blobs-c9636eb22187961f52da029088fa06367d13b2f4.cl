kernel void A(global uint* a, global uint* b) {
  for (unsigned int c = 0; c < 4; c++) {
    uint d = a[c];
    b[c] = ((d & 0xff) << 24) | ((d & 0xff00) << 8) | ((d & 0xff0000) >> 8) | ((d & 0xff000000) >> 24);
  }
}
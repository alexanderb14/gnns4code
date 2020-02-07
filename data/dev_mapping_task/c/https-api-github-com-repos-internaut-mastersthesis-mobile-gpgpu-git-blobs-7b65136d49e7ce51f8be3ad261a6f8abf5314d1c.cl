constant float Ga = 0x1.921fb6p+1f * 2.0f; constant float Gb = (440.0f * 0x1.921fb6p+1f) / 44100.0f; kernel void A(int a, global float* b) {
  const int c = get_global_id(0);

  b[c] = (c % 2) * sin((float)(a + c - 1) * Gb);
}
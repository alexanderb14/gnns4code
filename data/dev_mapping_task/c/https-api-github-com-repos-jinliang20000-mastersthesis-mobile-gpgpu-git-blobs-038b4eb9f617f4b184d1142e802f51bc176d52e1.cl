constant float Ga = 0x1.921fb6p+1f * 2.0f; constant float Gb = (439.0f * 0x1.921fb6p+1f) / 44100.0f; constant float Gc = (441.0f * 0x1.921fb6p+1f) / 44100.0f; kernel void A(int a, global float* b) {
  const int c = get_global_id(0);

  b[c] = ((c + 1) % 2) * sin((a + c) * Gb) + (c % 2) * sin((a + c - 1) * Gc);
}
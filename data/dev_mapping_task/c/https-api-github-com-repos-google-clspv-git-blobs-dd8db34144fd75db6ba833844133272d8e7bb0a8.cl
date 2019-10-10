__constant float Ga[3] = {1.0f, 2.0f, 3.0f};
__constant float Gb[3] = {10.0f, 11.0f, 12.0f};

kernel void A(global float* a, int b, int c) {
  *a = b == 0 ? Ga[c] : Gb[c];
}
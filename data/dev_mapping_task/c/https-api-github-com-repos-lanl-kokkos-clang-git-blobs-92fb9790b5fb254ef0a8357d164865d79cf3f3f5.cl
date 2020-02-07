__constant float Ga[2] = {0.0f, 1.0f};

kernel void A(global float* a) {
  *a = Ga[0];
}
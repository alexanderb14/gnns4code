void A(__global float* a) {
  for (int b = 0; b < 100; b++) {
    a[get_global_id(0)] = a[get_global_id(0)] + 1.0f;
  }
}

void B(__global float* a) {
  for (int b = 0; b < 100; b++) {
    a[get_global_id(0)] = a[get_global_id(0)] + 1.0f;
  }
}

__kernel void C(__global float* a, __global float* b) {
  A(a);

  B(b);
}
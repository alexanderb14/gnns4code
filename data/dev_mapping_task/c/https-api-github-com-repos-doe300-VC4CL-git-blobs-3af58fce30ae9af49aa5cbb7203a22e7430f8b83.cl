__kernel void A(__global int* a) {
  __global int* b = a + get_global_id(0) * (8 + 4);
  b[0] = 0;
  barrier(1);
  b[1] = 1;
  barrier(2);
  b[2] = 2;

  for (int c = 1; c < 8; c += 1) {
    barrier(1);
    b[3 + c] = 3 + c;
  }
}
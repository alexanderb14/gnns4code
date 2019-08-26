__kernel void A(__global unsigned int* a, __local unsigned int* b) {
  int c = 4 * (1 << 3) + get_local_id(1);
  int d = 4 * (1 << 3) + get_local_id(0);

  b[(get_local_id(1)) * ((1 << 3)) + (get_local_id(0))] = a[(c) * ((1 << 6)) + (d)];

  barrier(1);

  for (unsigned int e = 0; e < (1 << 3); ++e) {
    if (b[(get_local_id(1)) * ((1 << 3)) + (get_local_id(0))] == 0) {
      if ((b[(get_local_id(1)) * ((1 << 3)) + (e)] != 0) && (b[(e) * ((1 << 3)) + (get_local_id(0))] != 0)) {
        b[(get_local_id(1)) * ((1 << 3)) + (get_local_id(0))] = 4 * (1 << 3) + e + 2;
      }
    }

    barrier(1);
  }

  a[(c) * ((1 << 6)) + (d)] = b[(get_local_id(1)) * ((1 << 3)) + (get_local_id(0))];
}
__constant uint Ga[2] = {0xabcd5432u, 0xaabb5533u};

__kernel void A(__global uint* a, __global uint* b) {
  int c = get_global_id(0);
  int d = get_global_id(0) % (sizeof(Ga) / sizeof(Ga[0]));

  b[c] = Ga[d];
}
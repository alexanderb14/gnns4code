__constant uint Ga[2][3] = {{1, 2, 3}, {5}};

kernel void A(global uint* a, uint b) {
  *a = Ga[b][b];
}
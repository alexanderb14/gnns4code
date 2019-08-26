__constant uint3 Ga[2] = {(uint3)(1, 2, 3), (uint3)(5)};

kernel void A(global uint* a, uint b) {
  *a = Ga[b].x;
}
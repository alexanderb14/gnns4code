constant int Ga[3] = {0x15b, 0x25b, 0x35b};
constant short Gb[5] = {0x45b, 0x55b, 0x65b, 0x75b, 0x85b};
constant long Gc[3] = {0x15b, 0x25b, 0xFFFFFFFFF};
constant long Gd[3] = {1, 1, 1};
constant long Ge = 1;

__kernel void A(__global int* a, int b, int c) {
  int d = (int)get_global_id(0);
  a[d] = Ga[d % 3] + Gb[d % 5] + b + c;
}

__kernel void B(__global long* a, int b, int c) {
  int d = (int)get_global_id(0);
  a[d] = Gc[d % 3] * Gd[1] + b * Ge + c;
}
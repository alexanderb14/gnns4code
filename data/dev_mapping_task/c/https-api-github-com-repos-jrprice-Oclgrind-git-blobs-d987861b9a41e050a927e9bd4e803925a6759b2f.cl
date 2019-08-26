ulong A(ulong* a) {
  return 1;
}

kernel void B(global ulong* a) {
  *a = A((void*)0);
}
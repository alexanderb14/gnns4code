__local int* A(__local int* a) {
  return a;
}

__kernel void B(__local int* a) {
  __local int* b;

  b = A(a);

  b[get_local_id(0)] = get_local_id(0);
}
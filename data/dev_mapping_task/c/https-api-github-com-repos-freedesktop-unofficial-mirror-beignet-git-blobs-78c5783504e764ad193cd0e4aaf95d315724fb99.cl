kernel void A(__global uint* a, __global uint* b, __global uint* c) {
  int d = get_global_id(0);
  global uint* e = ((void*)0);

  switch (d) {
    case 0:
    case 1:
    case 4:
      e = a;
      break;
    default:
      e = b;
      break;
  }
  c[d] = e[d];
}

kernel void B(__global uint* a, __global uint* b, __global uint* c) {
  int d = get_global_id(0);
  global uint* e = d < 5 ? b : c;
  e[d] = a[d];
}
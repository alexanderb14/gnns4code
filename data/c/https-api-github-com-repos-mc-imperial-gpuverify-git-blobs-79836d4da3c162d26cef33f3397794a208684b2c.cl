int A(__local int* a, __local int* b, __local int* c) {
  return a[get_local_id(0)] + b[get_local_id(0) + 1] + c[get_local_id(0) + 1];
}

int B(int a, __local int* b) {
  A(b, b, b);
  return 0;
}

int C(__local int* a) {
  return a[get_local_id(0)] + B(a[get_local_id(0) + 2], a);
}

int D(__local int* a) {
  C(a);
  return a[get_local_id(0)];
}

__kernel void E(__local int* a) {
  D(a);
  a[get_local_id(0) + 1] = get_local_id(0);
}
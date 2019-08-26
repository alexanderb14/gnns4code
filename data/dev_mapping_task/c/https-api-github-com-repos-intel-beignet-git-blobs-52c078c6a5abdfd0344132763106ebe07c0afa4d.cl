struct Test {
  char t0;
  int t1;
};

constant int Ga = 2;

__kernel void A(__global int* a) {
  __local int b[16];
  __local char c;
  __local struct Test d;

  d.t1 = get_group_id(0);
  c = Ga;
  b[get_local_id(0)] = get_local_id(0);
  barrier(1);
  a[get_global_id(0)] = b[get_local_id(0)] + (int)c + b[1] + d.t1;
}

__kernel void B(__global ulong* a) {
  __local int b[16];
  a[1] = (ulong)&b[1];
  a[0] = (ulong)&b[0];
}
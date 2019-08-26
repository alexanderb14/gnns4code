__kernel void A(int a, __global int* b, __global int* c) {
  __global int* d;

  if (a == 0)
    d = b;
  else
    d = c;

  if (d != c)
    b[get_global_id(0)] = get_global_id(0);
  else
    b[0] = get_global_id(0);
}
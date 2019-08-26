__kernel void A(int a, __global int* b, __global bool* c) {
  __global int* d;

  if (a == 0)
    d = b;
  else
    d = ((void*)0);

  if (d > (__global int*)0)
    b[get_global_id(0)] = get_global_id(0);
  else
    b[0] = get_global_id(0);
}
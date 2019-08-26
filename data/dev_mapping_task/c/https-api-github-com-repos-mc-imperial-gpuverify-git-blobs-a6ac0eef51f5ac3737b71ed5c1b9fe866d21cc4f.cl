__kernel void A(int a, __global int* b) {
  __global int* c;

  if (a == 0)
    c = b;
  else
    c = ((void*)0);

  if (c != 0)
    b[get_global_id(0)] = get_global_id(0);
  else
    b[0] = get_global_id(0);
}
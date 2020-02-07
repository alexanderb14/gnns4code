kernel void A(local int* a) {
  local int b;
  if (get_local_id(0) == 0)
    b = 0;
  barrier(1);
  a[atomic_add(&b, 1)] = get_local_id(0);
}
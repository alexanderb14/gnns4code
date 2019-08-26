typedef float real; __kernel void A(const uint a, __global int* b) {
  const uint c = get_global_id(0);

  if (c >= a)
    return;

  b[c] = -1;
}
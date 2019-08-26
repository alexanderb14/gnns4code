__kernel void A(__global int* a, __global int* b) {
  const uint c = get_global_id(0);
  if (c == 0) {
    a[0] = b[0];
  } else {
    a[c] = ((b[c]) - (b[c - 1]));
  }
}
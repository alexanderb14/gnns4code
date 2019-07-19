__kernel void A(__global float* a, __global float* b) {
  int c = (int)get_global_id(0);
  if (get_local_id(0) > 5)
    b[c] = max(a[c], a[7]);
  else
    b[c] = min(a[c], a[10]);
}
__kernel void A(__global int* a, __global int* b) {
  int c = (int)get_global_id(0);
  b[c] = a[c];
  if (b[c] >= 0)
    goto label1;
  b[c] = 1;
  if (a[c] <= 2)
    goto label2;
label1:
  b[c] -= 2;
label2:
  b[c] += 2;
}
__kernel void A(int a) {
  float b = 0;
  float* c;

  if (a)
    c = &b;
  else
    c = 0;

  c[0] = c[0] + 1;
}
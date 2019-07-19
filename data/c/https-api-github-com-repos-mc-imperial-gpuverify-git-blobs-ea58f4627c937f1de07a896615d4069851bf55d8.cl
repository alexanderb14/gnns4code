__kernel void A(int a) {
  float b = 0;
  float c = 0;
  float* d;

  if (a)
    d = &b;
  else
    d = &c;

  d[0] = d[0] + 1;
}
float* A(float* a); __kernel void B(int a) {
  float b = 0;
  float c = 0;
  float* d;

  if (a == 0)
    d = A(&b);
  else
    d = &c;

  d[0] = d[0] + 1;
}
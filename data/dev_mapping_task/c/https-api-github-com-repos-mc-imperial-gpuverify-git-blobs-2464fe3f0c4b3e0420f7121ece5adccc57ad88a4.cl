float* A(float* a) {
  a[0] += 1;
  return a;
}

__kernel void B(int a) {
  float b = 0;
  float* c;

  if (a == 0)
    c = A(0);
  else
    c = A(&b);

  b += 1;
}
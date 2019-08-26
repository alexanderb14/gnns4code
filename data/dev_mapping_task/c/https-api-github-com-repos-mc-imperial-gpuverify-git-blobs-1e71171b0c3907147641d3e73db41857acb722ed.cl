float* A(float* a, int b) {
  if (b)
    return a;
  else
    return ((void*)0);
}

__kernel void B(int a) {
  float b = 0;
  float* c = A(&b, a);
  c[0] = c[0] + 1;
}
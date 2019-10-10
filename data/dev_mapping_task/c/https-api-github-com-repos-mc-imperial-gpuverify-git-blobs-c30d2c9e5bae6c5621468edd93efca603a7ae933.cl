void A(int a) {
  int b = a;
}

void B(int a) {
  int b = a;
}

__kernel void C(float a) {
  {
    int a = 4, b = 2;
    a++;
    a++;
    b++;
    b++;
  }
  {
    int a = 2;
    int c = 2;
  }
}
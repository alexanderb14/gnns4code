struct A {
  int x[100];
};

int A(struct A a);

int B() {
  struct A a;

  return A(a);
}
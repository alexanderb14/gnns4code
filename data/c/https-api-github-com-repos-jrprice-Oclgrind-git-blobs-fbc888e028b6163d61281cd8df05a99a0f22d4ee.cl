struct __attribute__((packed)) S {
  char a;
  int b __attribute__((packed));
  char c;
};

kernel void A(local int* a, global struct S* b) {
  struct S c = { 1, *a* b = c;
}
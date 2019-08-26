size_t A(private char* a) {
  return (size_t)a;
}

intptr_t B(global char* a) {
  return (intptr_t)a;
}

uintptr_t C(constant char* a) {
  return (uintptr_t)a;
}

size_t D(local char* a) {
  return (size_t)a;
}

size_t E(char* a) {
  return (size_t)a;
}

private
char* F(size_t a) {
  return (private char*)a;
}

global char* G(size_t a) {
  return (global char*)a;
}

local char* H(local char* a, ptrdiff_t b) {
  return a + b;
}

global char* I(global char* a, ptrdiff_t b) {
  return a + b;
}

ptrdiff_t J(local char* a, local char* b) {
  return a - b;
}

ptrdiff_t K(private char* a, private char* b) {
  return a - b;
}

ptrdiff_t L(private char* a, char* b) {
  return a - b;
}
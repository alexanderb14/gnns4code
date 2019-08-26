typedef struct {
  int first;
  constant int* firstPtr;
} ConstantPool;

constant ConstantPool Ga = {1, &Ga};

void A(constant int* a) {
}

kernel void B(void) {
  A(Ga.firstPtr);
}
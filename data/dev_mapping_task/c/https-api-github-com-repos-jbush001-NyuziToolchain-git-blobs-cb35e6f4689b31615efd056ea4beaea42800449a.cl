typedef char char2 __attribute((ext_vector_type(2))); typedef char char3 __attribute((ext_vector_type(3))); typedef char char8 __attribute((ext_vector_type(8))); typedef float float4 __attribute((ext_vector_type(4))); void A(char3* a, char3* b) {
  *a = *b;
}

void B() {
  __private char2 a[100];
  __private char8 b[100];

  ((private float4*)b)[1] = ((float4*)a)[2];
}
float __attribute__((overloadable)) A(float); typedef float float4 __attribute__((ext_vector_type(4))); int B(__constant const char* a, ...); void C(void) {
  float4 a;
  B("%8.4v4hlf\n", a);
}
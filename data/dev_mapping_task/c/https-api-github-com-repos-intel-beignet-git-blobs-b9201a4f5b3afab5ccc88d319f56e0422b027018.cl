typedef struct _test_arg_struct {
  int a;
  int b;
} test_arg_struct;

kernel void A(global float const volatile* a, local int* b, test_arg_struct c) {
}
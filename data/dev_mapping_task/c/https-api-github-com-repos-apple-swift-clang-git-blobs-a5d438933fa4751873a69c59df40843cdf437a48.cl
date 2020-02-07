typedef long unsigned int size_t; typedef long int ptrdiff_t; typedef long int intptr_t; typedef long unsigned int uintptr_t; typedef global void* global_ptr_t; typedef constant void* constant_ptr_t; typedef local void* local_ptr_t; typedef private void* private_ptr_t; void A(bool); void B() {
  A(sizeof(size_t) == 4);
  A(__alignof__(size_t) == 4);
  A(sizeof(intptr_t) == 4);
  A(__alignof__(intptr_t) == 4);
  A(sizeof(uintptr_t) == 4);
  A(__alignof__(uintptr_t) == 4);
  A(sizeof(ptrdiff_t) == 4);
  A(__alignof__(ptrdiff_t) == 4);

  A(sizeof(char) == 1);
  A(__alignof__(char) == 1);
  A(sizeof(short) == 2);
  A(__alignof__(short) == 2);
  A(sizeof(int) == 4);
  A(__alignof__(int) == 4);
  A(sizeof(long) == 8);
  A(__alignof__(long) == 8);

  A(sizeof(float) == 4);
  A(__alignof__(float) == 4);

  A(sizeof(double) == 8);
  A(__alignof__(double) == 8);

  A(sizeof(void*) == (100 >= 200 ? 8 : 4));
  A(__alignof__(void*) == (100 >= 200 ? 8 : 4));
  A(sizeof(global_ptr_t) == 4);
  A(__alignof__(global_ptr_t) == 4);
  A(sizeof(constant_ptr_t) == 4);
  A(__alignof__(constant_ptr_t) == 4);
  A(sizeof(local_ptr_t) == 4);
  A(__alignof__(private_ptr_t) == 4);
}
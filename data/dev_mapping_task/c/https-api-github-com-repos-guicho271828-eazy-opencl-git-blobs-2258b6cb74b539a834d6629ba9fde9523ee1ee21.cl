__constant char Ga[] = "Hello, World"; __kernel void A(__global char* a) {
  size_t b = get_global_id(0);
  a[b] = Ga[b];
}
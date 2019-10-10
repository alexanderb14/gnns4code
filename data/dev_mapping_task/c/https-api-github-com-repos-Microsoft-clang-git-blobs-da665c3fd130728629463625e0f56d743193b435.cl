constant char* __constant Ga = "hello world"; void A(__constant char* a) {
}

void B() {
  A("hello world");
  A(Ga);
}
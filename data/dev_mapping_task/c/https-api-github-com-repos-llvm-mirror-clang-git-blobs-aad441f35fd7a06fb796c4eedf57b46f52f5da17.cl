void A(event_t a); void kernel B() {
  event_t a;

  A(a);

  A(0);

  A((event_t)0);
}
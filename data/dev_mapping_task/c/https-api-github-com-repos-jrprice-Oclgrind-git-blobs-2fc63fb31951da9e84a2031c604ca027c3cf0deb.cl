kernel void A(global int* a) {
  event_t b = 0;
  wait_group_events(1, &b);
}
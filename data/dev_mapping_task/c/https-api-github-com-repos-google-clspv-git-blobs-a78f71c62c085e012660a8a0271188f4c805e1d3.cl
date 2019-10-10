void A() {
}

void kernel __attribute__((reqd_work_group_size(1, 1, 1))) B()

{
  A();
}
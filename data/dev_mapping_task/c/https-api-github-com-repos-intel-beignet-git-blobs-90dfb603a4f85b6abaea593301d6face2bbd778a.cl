kernel void A(global long* a, global long* b, global long* c) {
  int d = get_global_id(0);
  c[d] = (a[d] < b[d]) ? 3 : 4;
}

kernel void B(global long* a, global long* b, global long* c) {
  int d = get_global_id(0);
  c[d] = (a[d] <= b[d]) ? 3 : 4;
}

kernel void C(global long* a, global long* b, global long* c) {
  int d = get_global_id(0);
  c[d] = (a[d] > b[d]) ? 3 : 4;
}

kernel void D(global long* a, global long* b, global long* c) {
  int d = get_global_id(0);
  c[d] = (a[d] >= b[d]) ? 3 : 4;
}

kernel void E(global long* a, global long* b, global long* c) {
  int d = get_global_id(0);
  c[d] = (a[d] == b[d]) ? 3 : 4;
}

kernel void F(global long* a, global long* b, global long* c) {
  int d = get_global_id(0);
  c[d] = (a[d] != b[d]) ? 3 : 4;
}
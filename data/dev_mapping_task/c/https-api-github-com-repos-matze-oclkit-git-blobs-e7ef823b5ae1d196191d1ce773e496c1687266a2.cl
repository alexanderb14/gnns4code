kernel void A(global float* a) {
  a[get_global_id(0)] = 1.0;
}

kernel void B(global float* a, global float* b) {
}

kernel void C(global float* a, global float* b) {
  int c = get_global_id(0);
  b[c] = sin(sin((a[c])));
}
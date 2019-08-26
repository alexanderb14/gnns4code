kernel void A(global float a[]) {
  int b = get_global_id(0);
  if ((b & 0x01) == 0)
    a[b] = 3.0;
}

void kernel B(float global* a, const int b) {
  float c = 0.0;
  for (int d = 0; d < b; d++)
    c += a[d];
  a[get_global_id(0)] = c;
}
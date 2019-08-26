void kernel A(float global* a, const int b) {
  float c = 0.0;
  float d = a[0];
  for (int e = 0; e < 10; e++)
    c += 10.0 + d;
  a[get_global_id(0)] = c;
}
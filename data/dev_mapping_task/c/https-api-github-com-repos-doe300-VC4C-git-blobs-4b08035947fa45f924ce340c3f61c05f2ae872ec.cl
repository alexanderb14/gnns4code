void kernel A(float global* a, const int b) {
  for (int c = 0; c < 10; c++)
    a[c] += 1;
}
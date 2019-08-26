kernel void A(global char* a, global char* b) {
  size_t c = get_global_id(0);
  char2 d = vload2(c, a);
  if (b[c] == 0)
    d++;
  else if (b[c] == 1)
    ++d;
  else if (b[c] == 2)
    d--;
  else
    --d;
  vstore2(d, c, a);
}
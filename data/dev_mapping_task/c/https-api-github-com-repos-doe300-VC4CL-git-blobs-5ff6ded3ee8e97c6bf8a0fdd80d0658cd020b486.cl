__kernel void A(__global char16* a) {
  const char16 b = {'H', 'e', 'l', 'l', 'o', ' ', 'W', 'o', 'r', 'l', 'd', '!', '\0', '\0', '\0', '\0'};
  size_t c = get_global_id(0);
  a[c] = b;
}
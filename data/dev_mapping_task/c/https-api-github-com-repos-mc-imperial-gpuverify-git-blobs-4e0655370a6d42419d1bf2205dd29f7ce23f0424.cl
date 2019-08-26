void __kernel A(__global int* a) {
  a[get_global_id(0)] += 5;
}
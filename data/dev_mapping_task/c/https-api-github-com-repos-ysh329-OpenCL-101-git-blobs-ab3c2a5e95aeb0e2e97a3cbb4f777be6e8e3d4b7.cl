__kernel void A(__global char* a) {
  a[0] = 'H';
  a[1] = 'e';
  a[2] = 'l';
  a[3] = 'l';
  a[4] = 'o';

  a[5] = ',';

  a[6] = ' ';
  a[7] = 'W';
  a[8] = 'o';
  a[9] = 'r';
  a[10] = 'l';
  a[11] = 'd';

  a[12] = '!';
  a[13] = '\0';
}
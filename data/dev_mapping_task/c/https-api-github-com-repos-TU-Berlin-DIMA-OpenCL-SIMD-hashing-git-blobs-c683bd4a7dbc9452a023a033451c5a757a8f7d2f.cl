struct Bucket {
  uint key;
  uint val;
};
typedef struct Bucket Bucket;

kernel void A(global uint* a, const ulong b, const uint c) {
  for (uint d = 0; d < b; ++d) {
    a[d] = c;
  }
}

kernel void B(global Bucket* a, const uint b, const uint c) {
  for (ulong d = 0; d < b; ++d) {
    a[d].key = c;
    a[d].val = c;
  }
}
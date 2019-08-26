typedef struct nodeStruct {
  int value;
  __global struct nodeStruct* left;
  __global struct nodeStruct* right;
} node;

typedef struct searchKeyStruct {
  int key;
  __global node* oclNode;
  __global node* nativeNode;
} searchKey;

__kernel void A(__global void* a, __global void* b) {
  __global node* c = (__global node*)(a);
  __global searchKey* d = (__global searchKey*)(b);
  int e = get_global_id(0);
  __global searchKey* f = d + e;

  while (((void*)0) != c) {
    if (f->key == c->value) {
      f->oclNode = c;
      c = ((void*)0);
    } else if (f->key < c->value) {
      c = c->left;
    } else {
      c = c->right;
    }
  }
}
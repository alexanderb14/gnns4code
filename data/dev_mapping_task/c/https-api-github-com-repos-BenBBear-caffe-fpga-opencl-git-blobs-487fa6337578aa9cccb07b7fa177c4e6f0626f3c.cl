typedef float dType; typedef int BOOL; typedef struct {
  dType scale;
  int stride;
  int kernelSize;
  int pad;
  int dilation;
  int inputChannel;
  int inputHeight;
  int inputWidth;
  int outputChannel;
  int outputHeight;
  int outputWidth;
  int inputTotalDataNum;
  int outputTotalDataNum;
} NetParam;
__kernel void A(__global dType* a, __global dType* b, __global NetParam* c, __global BOOL* d) {
  ;
  ;
  __private int e = (((get_global_id(0) * get_global_size(1) * get_global_size(2)) + (get_global_id(1) * get_global_size(2)) + get_global_id(2)));
  while ((e) < (c->inputTotalDataNum)) {
    (b)[e] = (a)[e] * (c->scale);
    (e) += ((get_global_size(0) * get_global_size(1) * get_global_size(2)));
  };

  ;
  ;
}
__kernel void B(__global dType* a, __global dType* b, __global NetParam* c, __global BOOL* d) {
  ;
  ;
  __private bool e = false;
  __private int f = (get_global_id(0)), g, h;
  while (f < (c->outputChannel)) {
    g = (get_global_id(1));
    while (g < (c->outputHeight)) {
      h = (get_global_id(2));
      while (h < (c->outputWidth)) {
        e = g < c->pad || h < c->pad || (c->outputWidth - h - 1) < c->pad || (c->outputHeight - g - 1) < c->pad;
        (b)[(f) * (c->outputHeight) * (c->outputWidth) + (g) * (c->outputWidth) + (h)] = e ? 0 : (a)[(f) * (c->inputHeight) * (c->inputWidth) + (g - (c->pad)) * (c->inputWidth) + (h - (c->pad))];
        h += (get_global_size(2));
      }
      g += (get_global_size(1));
    }
    f += (get_global_size(0));
  }

  ;
  ;
}
__kernel void C(__global dType* a, __global dType* b, __global NetParam* c, __global BOOL* d) {
  ;
  ;
  __private dType e, f;
  __private int g = (get_global_id(0)), h, i;
  while (g < (c->outputChannel)) {
    h = (get_global_id(1));
    while (h < (c->outputHeight)) {
      i = (get_global_id(2));
      while (i < (c->outputWidth)) {
        ;
        e = (a)[(g) * (c->inputHeight) * (c->inputWidth) + (h * c->stride) * (c->inputWidth) + (i * c->stride)];

        for (int j = 0; j < c->kernelSize; j++)
          for (int k = 0; k < c->kernelSize; k++) {
            f = (a)[(g) * (c->inputHeight) * (c->inputWidth) + (h * c->stride + j) * (c->inputWidth) + (i * c->stride + k)];

            e = e > f ? e : f;
          }
        (b)[(g) * (c->outputHeight) * (c->outputWidth) + (h) * (c->outputWidth) + (i)] = e;
        i += (get_global_size(2));
      }
      h += (get_global_size(1));
    }
    g += (get_global_size(0));
  };
  ;
  ;
}
__kernel void D(__global dType* a, __global dType* b, __global NetParam* c, __global BOOL* d) {
  ;
  ;
  __private int e = (((get_global_id(0) * get_global_size(1) * get_global_size(2)) + (get_global_id(1) * get_global_size(2)) + get_global_id(2)));
  while ((e) < (c->inputTotalDataNum)) {
    b[e] = ((a[e]) > 0 ? (a[e]) : 0);
    (e) += ((get_global_size(0) * get_global_size(1) * get_global_size(2)));
  };
  ;
}
__kernel void E(__global dType* a, __global dType* b, __global dType* c, __global dType* d, __global const NetParam* e, __global BOOL* f) {
  ;
  ;
  __private int g = (e->kernelSize - 1) * e->dilation + 1;
  __private dType h;
  __private int i = (get_global_id(0)), j, k;
  while (i < (e->outputChannel)) {
    j = (get_global_id(1));
    while (j < (e->outputHeight)) {
      k = (get_global_id(2));
      while (k < (e->outputWidth)) {
        ;
        h = 0;
        for (int l = 0; l < e->inputChannel; l++)
          for (int m = 0; m < e->kernelSize; m++)
            for (int n = 0; n < e->kernelSize; n++) {
              h += ((a)[(l) * (e->inputHeight) * (e->inputWidth) + (j * e->stride + m * e->dilation) * (e->inputWidth) + (k * e->stride + n * e->dilation)] *

                    (c)[(i) * (e->kernelSize) * (e->kernelSize) * (e->inputChannel) + (l) * (e->kernelSize) * (e->kernelSize) + (m) * (e->kernelSize) + (n)]);
            }

        h += d[i];
        (b)[(i) * (e->outputHeight) * (e->outputWidth) + (j) * (e->outputWidth) + (k)] = h;
        k += (get_global_size(2));
      }
      j += (get_global_size(1));
    }
    i += (get_global_size(0));
  };
  ;
  ;
}
__kernel void F(__global dType* a, __global dType* b, __global NetParam* c, __global BOOL* d) {
  ;
  ;
  __private int e = (((get_global_id(0) * get_global_size(1) * get_global_size(2)) + (get_global_id(1) * get_global_size(2)) + get_global_id(2)));
  while ((e) < (c->inputTotalDataNum)) {
    (b)[e] = (a)[e];
    (e) += ((get_global_size(0) * get_global_size(1) * get_global_size(2)));
  };
}
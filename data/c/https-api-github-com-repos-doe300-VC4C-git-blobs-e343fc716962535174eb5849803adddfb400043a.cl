__kernel void A(__global float* a, float b, unsigned int c, __global const float* d) {
  float e = b;

  if (c & (1 << 0)) {
    if (c & (1 << 1)) {
      *a = -*d / e;
    } else {
      *a = -*d * e;
    }
  } else {
    if (c & (1 << 1)) {
      *a = +*d / e;
    } else {
      *a = +*d * e;
    }
  }
}
__kernel void B(__global float* a,

                __global float* b, unsigned int c, __global const float* d) {
  float e = b[0];

  if (c & (1 << 0)) {
    if (c & (1 << 1)) {
      *a = -*d / e;
    } else {
      *a = -*d * e;
    }
  } else {
    if (c & (1 << 1)) {
      *a = +*d / e;
    } else {
      *a = +*d * e;
    }
  }
}
__kernel void C(__global float* a,

                float b, unsigned int c, __global const float* d,

                float e, unsigned int f, __global const float* g) {
  float h = b;

  float i = e;
  if (c & (1 << 0)) {
    if (f & (1 << 0)) {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a = -*d / h - *g / i;
        else
          *a = -*d / h - *g * i;
      } else {
        if (f & (1 << 1))
          *a = -*d * h - *g / i;
        else
          *a = -*d * h - *g * i;
      }
    } else {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a = -*d / h + *g / i;
        else
          *a = -*d / h + *g * i;
      } else {
        if (f & (1 << 1))
          *a = -*d * h + *g / i;
        else
          *a = -*d * h + *g * i;
      }
    }
  } else {
    if (f & (1 << 0)) {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a = +*d / h - *g / i;
        else
          *a = +*d / h - *g * i;
      } else {
        if (f & (1 << 1))
          *a = +*d * h - *g / i;
        else
          *a = +*d * h - *g * i;
      }
    } else {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a = +*d / h + *g / i;
        else
          *a = +*d / h + *g * i;
      } else {
        if (f & (1 << 1))
          *a = +*d * h + *g / i;
        else
          *a = +*d * h + *g * i;
      }
    }
  }
}
__kernel void D(__global float* a,

                float b, unsigned int c, __global const float* d,

                __global float* e, unsigned int f, __global const float* g) {
  float h = b;

  float i = e[0];
  if (c & (1 << 0)) {
    if (f & (1 << 0)) {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a = -*d / h - *g / i;
        else
          *a = -*d / h - *g * i;
      } else {
        if (f & (1 << 1))
          *a = -*d * h - *g / i;
        else
          *a = -*d * h - *g * i;
      }
    } else {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a = -*d / h + *g / i;
        else
          *a = -*d / h + *g * i;
      } else {
        if (f & (1 << 1))
          *a = -*d * h + *g / i;
        else
          *a = -*d * h + *g * i;
      }
    }
  } else {
    if (f & (1 << 0)) {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a = +*d / h - *g / i;
        else
          *a = +*d / h - *g * i;
      } else {
        if (f & (1 << 1))
          *a = +*d * h - *g / i;
        else
          *a = +*d * h - *g * i;
      }
    } else {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a = +*d / h + *g / i;
        else
          *a = +*d / h + *g * i;
      } else {
        if (f & (1 << 1))
          *a = +*d * h + *g / i;
        else
          *a = +*d * h + *g * i;
      }
    }
  }
}
__kernel void E(__global float* a,

                __global float* b, unsigned int c, __global const float* d,

                float e, unsigned int f, __global const float* g) {
  float h = b[0];

  float i = e;
  if (c & (1 << 0)) {
    if (f & (1 << 0)) {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a = -*d / h - *g / i;
        else
          *a = -*d / h - *g * i;
      } else {
        if (f & (1 << 1))
          *a = -*d * h - *g / i;
        else
          *a = -*d * h - *g * i;
      }
    } else {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a = -*d / h + *g / i;
        else
          *a = -*d / h + *g * i;
      } else {
        if (f & (1 << 1))
          *a = -*d * h + *g / i;
        else
          *a = -*d * h + *g * i;
      }
    }
  } else {
    if (f & (1 << 0)) {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a = +*d / h - *g / i;
        else
          *a = +*d / h - *g * i;
      } else {
        if (f & (1 << 1))
          *a = +*d * h - *g / i;
        else
          *a = +*d * h - *g * i;
      }
    } else {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a = +*d / h + *g / i;
        else
          *a = +*d / h + *g * i;
      } else {
        if (f & (1 << 1))
          *a = +*d * h + *g / i;
        else
          *a = +*d * h + *g * i;
      }
    }
  }
}
__kernel void F(__global float* a,

                __global float* b, unsigned int c, __global const float* d,

                __global float* e, unsigned int f, __global const float* g) {
  float h = b[0];

  float i = e[0];
  if (c & (1 << 0)) {
    if (f & (1 << 0)) {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a = -*d / h - *g / i;
        else
          *a = -*d / h - *g * i;
      } else {
        if (f & (1 << 1))
          *a = -*d * h - *g / i;
        else
          *a = -*d * h - *g * i;
      }
    } else {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a = -*d / h + *g / i;
        else
          *a = -*d / h + *g * i;
      } else {
        if (f & (1 << 1))
          *a = -*d * h + *g / i;
        else
          *a = -*d * h + *g * i;
      }
    }
  } else {
    if (f & (1 << 0)) {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a = +*d / h - *g / i;
        else
          *a = +*d / h - *g * i;
      } else {
        if (f & (1 << 1))
          *a = +*d * h - *g / i;
        else
          *a = +*d * h - *g * i;
      }
    } else {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a = +*d / h + *g / i;
        else
          *a = +*d / h + *g * i;
      } else {
        if (f & (1 << 1))
          *a = +*d * h + *g / i;
        else
          *a = +*d * h + *g * i;
      }
    }
  }
}
__kernel void G(__global float* a,

                float b, unsigned int c, __global const float* d,

                float e, unsigned int f, __global const float* g) {
  float h = b;

  float i = e;
  if (c & (1 << 0)) {
    if (f & (1 << 0)) {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a += -*d / h - *g / i;
        else
          *a += -*d / h - *g * i;
      } else {
        if (f & (1 << 1))
          *a += -*d * h - *g / i;
        else
          *a += -*d * h - *g * i;
      }
    } else {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a += -*d / h + *g / i;
        else
          *a += -*d / h + *g * i;
      } else {
        if (f & (1 << 1))
          *a += -*d * h + *g / i;
        else
          *a += -*d * h + *g * i;
      }
    }
  } else {
    if (f & (1 << 0)) {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a += +*d / h - *g / i;
        else
          *a += +*d / h - *g * i;
      } else {
        if (f & (1 << 1))
          *a += +*d * h - *g / i;
        else
          *a += +*d * h - *g * i;
      }
    } else {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a += +*d / h + *g / i;
        else
          *a += +*d / h + *g * i;
      } else {
        if (f & (1 << 1))
          *a += +*d * h + *g / i;
        else
          *a += +*d * h + *g * i;
      }
    }
  }
}
__kernel void H(__global float* a,

                float b, unsigned int c, __global const float* d,

                __global float* e, unsigned int f, __global const float* g) {
  float h = b;

  float i = e[0];
  if (c & (1 << 0)) {
    if (f & (1 << 0)) {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a += -*d / h - *g / i;
        else
          *a += -*d / h - *g * i;
      } else {
        if (f & (1 << 1))
          *a += -*d * h - *g / i;
        else
          *a += -*d * h - *g * i;
      }
    } else {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a += -*d / h + *g / i;
        else
          *a += -*d / h + *g * i;
      } else {
        if (f & (1 << 1))
          *a += -*d * h + *g / i;
        else
          *a += -*d * h + *g * i;
      }
    }
  } else {
    if (f & (1 << 0)) {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a += +*d / h - *g / i;
        else
          *a += +*d / h - *g * i;
      } else {
        if (f & (1 << 1))
          *a += +*d * h - *g / i;
        else
          *a += +*d * h - *g * i;
      }
    } else {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a += +*d / h + *g / i;
        else
          *a += +*d / h + *g * i;
      } else {
        if (f & (1 << 1))
          *a += +*d * h + *g / i;
        else
          *a += +*d * h + *g * i;
      }
    }
  }
}
__kernel void I(__global float* a,

                __global float* b, unsigned int c, __global const float* d,

                float e, unsigned int f, __global const float* g) {
  float h = b[0];

  float i = e;
  if (c & (1 << 0)) {
    if (f & (1 << 0)) {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a += -*d / h - *g / i;
        else
          *a += -*d / h - *g * i;
      } else {
        if (f & (1 << 1))
          *a += -*d * h - *g / i;
        else
          *a += -*d * h - *g * i;
      }
    } else {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a += -*d / h + *g / i;
        else
          *a += -*d / h + *g * i;
      } else {
        if (f & (1 << 1))
          *a += -*d * h + *g / i;
        else
          *a += -*d * h + *g * i;
      }
    }
  } else {
    if (f & (1 << 0)) {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a += +*d / h - *g / i;
        else
          *a += +*d / h - *g * i;
      } else {
        if (f & (1 << 1))
          *a += +*d * h - *g / i;
        else
          *a += +*d * h - *g * i;
      }
    } else {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a += +*d / h + *g / i;
        else
          *a += +*d / h + *g * i;
      } else {
        if (f & (1 << 1))
          *a += +*d * h + *g / i;
        else
          *a += +*d * h + *g * i;
      }
    }
  }
}
__kernel void J(__global float* a,

                __global float* b, unsigned int c, __global const float* d,

                __global float* e, unsigned int f, __global const float* g) {
  float h = b[0];

  float i = e[0];
  if (c & (1 << 0)) {
    if (f & (1 << 0)) {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a += -*d / h - *g / i;
        else
          *a += -*d / h - *g * i;
      } else {
        if (f & (1 << 1))
          *a += -*d * h - *g / i;
        else
          *a += -*d * h - *g * i;
      }
    } else {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a += -*d / h + *g / i;
        else
          *a += -*d / h + *g * i;
      } else {
        if (f & (1 << 1))
          *a += -*d * h + *g / i;
        else
          *a += -*d * h + *g * i;
      }
    }
  } else {
    if (f & (1 << 0)) {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a += +*d / h - *g / i;
        else
          *a += +*d / h - *g * i;
      } else {
        if (f & (1 << 1))
          *a += +*d * h - *g / i;
        else
          *a += +*d * h - *g * i;
      }
    } else {
      if (c & (1 << 1)) {
        if (f & (1 << 1))
          *a += +*d / h + *g / i;
        else
          *a += +*d / h + *g * i;
      } else {
        if (f & (1 << 1))
          *a += +*d * h + *g / i;
        else
          *a += +*d * h + *g * i;
      }
    }
  }
}
__kernel void K(__global float* a, __global float* b) {
  float c = *b;
  *b = *a;
  *a = c;
}
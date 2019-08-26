struct __attribute__((packed)) NeuronDataPacked {
  float Vm[2];
  float Vahp;
  float Iin;
  int RefrCountSpiked;
};

__kernel void A(__global struct NeuronDataPacked* a, __local struct NeuronDataPacked* b, __global float* c, __global float* d) {
  int e = get_global_id(0);

  b[e] = a[e];

  c[e] = e;
  d[e] = b[e].Vm[1];
}
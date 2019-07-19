__kernel void A(__global float* a) {
  int b = get_global_id(0);
  a[b] = b;
}

__kernel void B(__global float* a) {
  int b = get_local_id(0);

  a[get_local_id(0) + get_group_id(0) * get_local_size(0)] = b;
}

__kernel void C(__global float4* a) {
  int b = get_local_id(0);
  int c = get_local_id(1);
  int d = get_global_id(0);
  int e = get_global_id(1);

  a[d + get_global_size(0) * c_kernel void D(__global float* a,
       __global float* b,
       const int c){
    int d = get_global_id(0);
    b[d] = a[d] * a[d];
}

__kernel void E(__global float4* a){
    int2 b = (int2)(get_global_id(0), get_global_id(1));
    int2 c = (int2)(get_global_size(0), get_global_size(1));

    float2 d = (float2)(bx / (float)c by / (float)c);

  a[b.x + b.y * c.x] = (float4)(bx, by, sin(d* cos(d 0);
}
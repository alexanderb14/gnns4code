constant sampler_t Ga = 7; void A(image1d_t a) {
}

void B(image1d_array_t a) {
}

void C(image1d_buffer_t a) {
}

void D(image2d_t a) {
}

void E(image2d_array_t a) {
}

void F(image3d_t a) {
}

void G(sampler_t a) {
}

kernel void H(image1d_t a) {
  sampler_t b = 5;

  event_t c;

  G(b);

  G(Ga);
}
import Glide from "@glidejs/glide";

const initGlide = () => {
  const sliders = document.querySelectorAll('.glide-1');
  if (sliders) {
    sliders.forEach(slider => {
      const glide = new Glide(slider, {
        type: 'carousel',
        perView: 1
      });
      glide.mount();
    });
  }
  const sliders2 = document.querySelectorAll('.glide-2');
  if (sliders2) {
    sliders2.forEach(slider => {
      const glide = new Glide(slider, {
        type: 'carousel',
        perView: 2
      });
      glide.mount();
    });
  }
};

export { initGlide };

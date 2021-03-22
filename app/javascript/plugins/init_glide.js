import Glide from "@glidejs/glide";

const initGlide = () => {
    const config_1 = {
    type : 'carousel',
    }
    
    const config_2 = {
    type : 'carousel',
    perView: 2
    }
        
    new Glide('.glide-trendy-bars', config_1).mount()
    new Glide('.glide-events-nearby', config_2).mount()
    new Glide('.glide-based-profile', config_2).mount()
};

export { initGlide };

let sliderElements = document.getElementsByClassName("default-slider")

for (let i = 0; i < sliderElements.length; i++) {

    new Splide(sliderElements[i], {
        perPage: 3,
        autoplay: true,
        interval: 6000,
        pauseOnFocus: false,
        pauseOnHover: false,
        type: "loop",
        breakpoints: {
            720: {
                perPage: 1,
            },
            1100: {
                perPage: 2,
            },
        }
    }).mount();

}

new Splide('.footer-slider', {
    perPage: 4,
    breakpoints: {
        550: {
            perPage: 1,
        },
        820: {
            perPage: 2,
        },
        1100: {
            perPage: 3,
        },
    }
}).mount();
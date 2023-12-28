let slideIndex = 1;

function showSlides() {
    let i;
    let slides = document.getElementsByClassName("singleSlide");

    if (slideIndex >= slides.length) {
        slideIndex = 0;
    }

    if (slideIndex < 0) {
        slideIndex = slides.length - 1;
    }

    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }

    slides[slideIndex].style.display = "flex";
}

function plusSlides(a) {
    slideIndex += a;
    showSlides();
}

showSlides();
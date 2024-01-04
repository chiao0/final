let slideIndex = 0;

function showSlides(props) {
    let i;
    let slides = document.getElementsByClassName("singleSlide");

    if (props >= slides.length) {
        slideIndex = 0;
    }

    if (props < 0) {
        slideIndex = slides.length-1;
    }

    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }

    slides[slideIndex].style.display = "flex";
}

function plusSlides(a) {
    showSlides((slideIndex += a));
}

showSlides(slideIndex);

let slideIndex = 0;
let autoSlideInterval;

function showSlide(index) {
    try {
        const slides = document.getElementsByClassName("slider-image");
        const dots = document.getElementsByClassName("dot");
        
        // Validate inputs
        if (!slides || slides.length === 0) {
            console.warn("No slider images found");
            return;
        }
        
        if (!dots || dots.length === 0) {
            console.warn("No slider dots found");
            return;
        }
        
        // Validate index
        if (index < 0 || index >= slides.length) {
            console.error(`Invalid slide index: ${index}. Valid range: 0-${slides.length - 1}`);
            return;
        }

        // Hide all slides and remove active class from dots
        for (let i = 0; i < slides.length; i++) {
            if (slides[i]) {
                slides[i].style.display = "none";
            }
            if (dots[i]) {
                dots[i].classList.remove("active");
            }
        }

        // Show selected slide and activate corresponding dot
        if (slides[index]) {
            slides[index].style.display = "block";
        }
        if (dots[index]) {
            dots[index].classList.add("active");
        }
        
        slideIndex = index;
    } catch (error) {
        console.error("Error in showSlide function:", error);
    }
}

function autoSlide() {
    try {
        const slides = document.getElementsByClassName("slider-image");
        
        if (!slides || slides.length === 0) {
            console.warn("No slider images found for auto-slide");
            return;
        }
        
        let nextIndex = (slideIndex + 1) % slides.length;
        showSlide(nextIndex);
    } catch (error) {
        console.error("Error in autoSlide function:", error);
    }
}

function startAutoSlide() {
    try {
        // Clear any existing interval
        if (autoSlideInterval) {
            clearInterval(autoSlideInterval);
        }
        
        autoSlideInterval = setInterval(autoSlide, 3000);
    } catch (error) {
        console.error("Error starting auto-slide:", error);
    }
}

function stopAutoSlide() {
    try {
        if (autoSlideInterval) {
            clearInterval(autoSlideInterval);
            autoSlideInterval = null;
        }
    } catch (error) {
        console.error("Error stopping auto-slide:", error);
    }
}

window.onload = function () {
    try {
        showSlide(0);
        startAutoSlide();
    } catch (error) {
        console.error("Error in window.onload:", error);
    }
};

// Clean up interval when page is unloaded
window.addEventListener('beforeunload', function() {
    stopAutoSlide();
});

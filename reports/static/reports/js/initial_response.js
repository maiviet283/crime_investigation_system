let picker;

document.addEventListener("DOMContentLoaded", function () {
    // Get DOM elements
    const hiddenInput = document.getElementById("hidden-picker"); // Hidden input where Flatpickr will be attached
    const resultInput = document.getElementById("arrival-time");  // Input where selected time will be displayed
    const chooseBtn = document.getElementById("choose-btn");      // "Choose" button to trigger the picker

    // Initialize Flatpickr on the hidden input
    picker = flatpickr(hiddenInput, {
        enableTime: true,           // Enable time selection
        noCalendar: false,          // Show calendar (you can set this to true if you want time only)
        dateFormat: "h:i K",        // Display format: hour:minute AM/PM
        defaultDate: new Date(),    // Default selected date is current time

        onClose: function (selectedDates, dateStr) {
            // When the picker closes
            if (dateStr) {
                // Set the result input with the time only (strip AM/PM)
                resultInput.value = dateStr.replace(/\s?(AM|PM)$/, "");

                // Automatically select the appropriate AM/PM radio button
                if (dateStr.includes("PM")) {
                    document.getElementById("pm").checked = true;
                } else {
                    document.getElementById("am").checked = true;
                }
            }

            // Hide the hidden input again (optional, for fallback styling)
            hiddenInput.style.display = "none";
        }
    });

    // When the "Choose" button is clicked
    chooseBtn.addEventListener("click", function (e) {
        e.stopPropagation();              // Prevent event bubbling
        hiddenInput.style.display = "block"; // Show hidden input
        picker.open();                    // Manually open the picker
    });

    // Close the picker when clicking outside
    document.addEventListener("click", function (event) {
        if (!hiddenInput.contains(event.target) && event.target !== chooseBtn) {
            picker.close();
        }
    });
});

// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

const setupContactForm = () => {
	const form = document.querySelector("[data-contact-form]");
	if (!form) return;

	const emailInput = form.querySelector("[data-email-input]");
	const emailError = form.querySelector("[data-email-error]");
	const submitButton = form.querySelector("[data-submit-button]");

	const validateEmail = (showMissingError = true) => {
		const email = emailInput.value.trim();
		let message = "";

		if (!email) {
			if (showMissingError) message = "Please provide an email before submitting the form";
		} else if (!email.includes("@")) {
			message = "Please the email must have an @ character";
		}

		emailError.textContent = message;
		emailError.hidden = !message;
		emailInput.setAttribute("aria-invalid", String(Boolean(message)));
		return email.length > 0 && email.includes("@");
	};

	const validateForm = (showMissingError = true) => {
		const valid = validateEmail(showMissingError);
		submitButton.disabled = !valid;
		return valid;
	};

	emailInput.addEventListener("input", () => validateForm());
	emailInput.addEventListener("blur", () => validateForm());
	form.addEventListener("submit", (event) => {
		if (!validateForm()) event.preventDefault();
	});

	validateForm(false);
};

document.addEventListener("DOMContentLoaded", setupContactForm);

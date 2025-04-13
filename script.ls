$(document).ready(function () {
	setupClock("skeuomorphic");
	setupClock("flat-design");
	setupClock("material-design");
	setupClock("neumorphism");
	setupClock("glassmorphism");
	setupClock("brutalism");

	function setClockHands() {
		const now = new Date();
		const hours24 = now.getHours();
		const hours = hours24 % 12 || 12;
		const minutes = now.getMinutes();
		const seconds = now.getSeconds();
		const ampm = hours24 >= 12 ? "PM" : "AM";

		const hourDegrees = (hours % 12) * 30 + minutes * 0.5;
		const minuteDegrees = minutes * 6 + seconds * 0.1;
		const secondDegrees = seconds * 6;

		$("[id$='-hour-hand']").css("transform", `rotate(${hourDegrees}deg)`);

		$("[id$='-minute-hand']").css("transform", `rotate(${minuteDegrees}deg)`);

		$("[id$='-second-hand']").css("transform", `rotate(${secondDegrees}deg)`);
	}

	function setupClock(style) {
		for (let i = 0; i < 12; i++) {
			const hourMark = $("<div>").addClass("hour-mark");
			hourMark.css("transform", `rotate(${i * 30}deg)`);
			$(`#${style}-hour-marks`).append(hourMark);

			const hourNumber = $("<div>")
				.addClass("hour-number")
				.text(i === 0 ? 12 : i);
			const angle = i * 30;
			const radius = 112;
			const x = 150 + radius * Math.sin((angle * Math.PI) / 180);
			const y = 150 - radius * Math.cos((angle * Math.PI) / 180);

			hourNumber.css({
				left: x - 30,
				top: y - 30
			});

			$(`.${style} .clock-face`).append(hourNumber);

			for (let j = 1; j <= 4; j++) {
				if (j < 5) {
					const minuteMark = $("<div>").addClass("minute-mark");
					minuteMark.css("transform", `rotate(${i * 30 + j * 6}deg)`);
					$(`#${style}-hour-marks`).append(minuteMark);
				}
			}
		}
	}

	setClockHands();
	setInterval(setClockHands, 1000);
});

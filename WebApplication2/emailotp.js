function sendOTP() {
    const email = document.getElementById('email');
    const otpverify = document.getElementById('otp');

    Let otp_val = Math.floor(Math.random() * 10000);

    Let emailbody = '<h2>Your OTP is </h2>${otp_val}';
    Email.send({
        SecureToken: "9f9ed8b6-6b8a-4982-b909-9bc6e47e885f",
        To: email.value,
        From: "jamestanquan@gmail.com",
        Subject: "Email OTP using JavaScript",
        Body: emailbody,
    }).then(
        message =>
            if (message === "OK") {
            alert("OTP sent to your email " + email.value);

            otpverify.style.display = "flex";
            const otp-inp = document.getElementById('otp');
            const otp_btn = document.getElementById('otp_btn');

            otp_btn.addEventListener('click', () => {
                if (otp_inp.value == otp_val) {
                    alert("Email address verified...");
                }
                else {
                    alert("Invalid OTP");
                }
            } )
        }
    );
}
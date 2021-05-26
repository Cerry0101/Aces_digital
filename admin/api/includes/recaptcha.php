<?php

function recaptcha() {
	$captcha = @ $_POST['g-recaptcha-response'];

	if (!$captcha) return false;

	$url = "https://www.google.com/recaptcha/api/siteverify?secret=" . urlencode(SECRETKEY_RECAPTCHA) . "&response=" . urlencode($captcha);
	$response = file_get_contents($url);

	$p = json_decode($response, true);
	return $p["success"];
}

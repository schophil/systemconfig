<?php

function validate(string $insz): bool
{
	if (strlen($insz) != 11) {
		return false;
	}
	$base = intval(substr($insz, 0, 8));
	$check = intval(substr($insz, 9, 2));
	$expected = (97 - ($base % 97));
	$valid = ($check === $expected);

	echo "base: {$base}\n";
	echo "check: {$check}\n";
	echo "expected check: {$expected}\n";
	if ($valid) {
		echo "OK\n";
	} else {
		echo "NOK\n";
	}
	return $valid;
}

echo "Validating {$argv[1]}\n";
validate($argv[1], [0]);

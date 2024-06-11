<?php

$value = null;
$token = false;

for ($i = 1; $i < sizeof($argv); $i++) {
    $option = $argv[$i];
    if ($option === '--token') {
        $token = true;
    } else if ($i == sizeof($argv) - 1) {
        $value = $option;
    }
}

if ($token) {
    $value = str_replace('m__', '', $value);
    $decoded = base64_decode($value);
    exec("xdg-open https://jwt.io/#debugger-io?token=${decoded}");
} else {
    $decoded = base64_decode(urldecode($value));
    echo "$decoded\n";
}
?>

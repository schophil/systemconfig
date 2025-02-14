<?php

require __DIR__ . '/../vendor/autoload.php';

use GetOpt\GetOpt;
use GetOpt\Operand;

$getOpt = new GetOpt();
$getOpt->addOptions([
    [null, 'token', GetOpt::NO_ARGUMENT, 'Value is a token'],
]);
$getOpt->addOperand(Operand::create('value', Operand::REQUIRED));

try {
    $getOpt->process();
} catch (Exception $e) {
    echo $getOpt->getHelpText();
    exit(1);
}

$value = $getOpt->getOperand('value');
$token = $getOpt->getOption('token') ?? false;

if ($token) {
    $value = str_replace('m__', '', $value);
    $decoded = base64_decode($value);
    exec("xdg-open https://jwt.io/#debugger-io?token=${decoded}");
} else {
    $decoded = base64_decode(urldecode($value));
    echo "$decoded\n";
}

<?php

require __DIR__ . '/../vendor/autoload.php';

use GetOpt\GetOpt;
use GetOpt\Operand;

$getOpt = new GetOpt();
$getOpt->addOperand(Operand::create('value', Operand::REQUIRED));

try {
    $getOpt->process();
} catch (Exception $e) {
    echo $getOpt->getHelpText();
    exit(1);
}

echo base64_encode($getOpt->getOperand('value'));

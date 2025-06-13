<?php

require __DIR__ . '/../vendor/autoload.php';

use GetOpt\GetOpt;
use GetOpt\Operand;
use Schophil\Tools\Belgium\RRNValidator;

$getOpt = new GetOpt();
$getOpt->addOperand(new Operand('rrn', Operand::REQUIRED));

try {
    $getOpt->process();
} catch (Exception $e) {
    echo $getOpt->getHelpText();
    exit(1);
}

$validator = new RRNValidator();

echo "Validating {$getOpt->getOperand(0)}\n";
$result = $validator->validate($getOpt->getOperand(0));
echo "is valid: {$result->isValid()}\n";
foreach ($result->getAnalysis() as $key => $value) {
	echo "{$key}: {$value}\n";
}
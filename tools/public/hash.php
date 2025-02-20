<?php

require __DIR__ . '/../vendor/autoload.php';

use GetOpt\GetOpt;
use GetOpt\Operand;

$getOpt = new GetOpt();
$getOpt->addOptions([
    [null, 'sha256', GetOpt::NO_ARGUMENT, 'Use sha256'],
    [null, 'sha1', GetOpt::NO_ARGUMENT, 'Use sha1'],
]);
$getOpt->addOperand(Operand::create('value', Operand::REQUIRED));

try {
    $getOpt->process();
} catch (Exception $e) {
    echo $getOpt->getHelpText();
    exit(1);
}

$value = $getOpt->getOperand('value');
$algorithm = 'sha256';
if ($getOpt->getOption('sha1')) {
    $algorithm = 'sha1';
} else if ($getOpt->getOption('sha256')) {
    $algorithm = 'sha256';
}

echo "Hashing {$value} with algorithm {$algorithm}\n";
echo hash($algorithm, $value);
echo "\n";

<?php

require __DIR__ . '/../vendor/autoload.php';

use GetOpt\GetOpt;
use GetOpt\Operand;
use Schophil\Tools\Belgium\RRNDecoder;
use Schophil\Tools\Belgium\RRNGenerator;

$getOpt = new GetOpt();
$getOpt->addOptions([
    ['d', 'debug', GetOpt::NO_ARGUMENT, 'Enable debug mode'],
    ['b', 'bis', GetOpt::NO_ARGUMENT, 'Enable searching with bis values'],
]);
$getOpt->addOperand(new Operand('hash', Operand::REQUIRED));

try {
    $getOpt->process();
} catch (Exception $e) {
    echo $getOpt->getHelpText();
    exit(1);
}

$decoder = new RRNDecoder(new RRNGenerator());
$decoder->setDebug($getOpt->getOption('debug') ?? false);

$bis = [0];
if ($getOpt->getOption('bis')) {
    $bis = [30, 40];
}

echo "Decoding {$getOpt->getOperand(0)}\n";
$decoder->decode($getOpt->getOperand(0), $bis);

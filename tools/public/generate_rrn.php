<?php

require __DIR__ . '/../vendor/autoload.php';

use GetOpt\GetOpt;
use GetOpt\Operand;
use Schophil\Tools\Belgium\RRNGenerator;

$getOpt = new GetOpt();
$getOpt->addOptions([
    [null, 'adults', GetOpt::NO_ARGUMENT, 'Only generate RRN of adults'],
    [null, 'minors', GetOpt::NO_ARGUMENT, 'Only generate RRN of minors'],
    [null, 'males', GetOpt::NO_ARGUMENT, 'Only generate RRN of males'],
    [null, 'females', GetOpt::NO_ARGUMENT, 'Only generate RRN of females'],
    [null, 'bis', GetOpt::NO_ARGUMENT, 'Generate also bis numbers'],
]);
$getOpt->addOperand(Operand::create('total', Operand::REQUIRED));

try {
    $getOpt->process();
} catch (Exception $e) {
    echo $getOpt->getHelpText();
    exit(1);
}

$total = $getOpt->getOperand('total');
$bis = $getOpt->getOption('bis') ?? false;

$ageSwitch = RRNGenerator::$anyAge;
if ($getOpt->getOption('adults')) {
    $ageSwitch = RRNGenerator::$adultOnly;
} else if ($getOpt->getOption('minors')) {
    $ageSwitch = RRNGenerator::$minorOnly;
}

$genderSwitch = RRNGenerator::$anyGender;
if ($getOpt->getOption('males')) {
    $genderSwitch = RRNGenerator::$maleOnly;
} else if ($getOpt->getOption('females')) {
    $genderSwitch = RRNGenerator::$femaleOnly;
}

$currentYear = date("Y");
$generator = new RRNGenerator($currentYear - 100, $currentYear, 18);

while ($total > 0) {
    $rrn = $generator->generateRandom($ageSwitch, $genderSwitch, $bis);
    echo $rrn;
    echo "\n";
    $total--;
}

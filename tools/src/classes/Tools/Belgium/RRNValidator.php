<?php

namespace Schophil\Tools\Belgium;

class RRNValidator
{
    function validate(string $rrn): ?RRNValidation
    {
        if (strlen($rrn) != 11) {
            return null;
        }
        $validationReport = new RRNValidation($rrn);

        $base = intval(substr($rrn, 0, 8));
        $check = intval(substr($rrn, 9, 2));

        $this->validateCase($base, $check, $validationReport);

        if (!$validationReport->isValid()) {
            // try the year 2000 case
            $this->validateCase('2' . $base, $check, $validationReport);
        }

        return $validationReport;
    }

    private function validateCase(string $base, string $check, RRNValidation $validationReport): void
    {
        $base = intval($base);
        $check = intval($check);

        $expected = $this->getControlNumber($base);
        $valid = $check === $expected;
        if ($valid) {
            $validationReport->addAnalysis('base', "Expected control number equals {$check}.");
            $validationReport->setValid();
        } else {
            $validationReport->addAnalysis('base', "Expected control number is {$expected} but found {$check}.");
            $validationReport->setInvalid();
        }
    }

    private function getControlNumber(string $base): int
    {
        $base = intval($base);
        return 97 - ($base % 97);
    }
}

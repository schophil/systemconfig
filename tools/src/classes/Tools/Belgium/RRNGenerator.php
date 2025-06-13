<?php

namespace Schophil\Tools\Belgium;

class RRNGenerator
{
    // age switch
    public static int $anyAge = 0;
    public static int $adultOnly = 1;
    public static int $minorOnly = 2;

    // gender switch
    public static int $anyGender = 0;
    public static int $maleOnly = 1;
    public static int $femaleOnly = 2;

    public static int $maxSequence = 999;

    private int $minYear;
    private int $maxYear;
    private int $adultMinAge;

    public function __construct(int $minYear = 1900, int $maxYear = 2030, int $adultMinAge = 18)
    {
        $this->minYear = $minYear;
        $this->maxYear = $maxYear;
        $this->adultMinAge = $adultMinAge;
    }

    function generateOne(\DateTime $date, int $bis, int $sequence): GeneratedRRN
    {
        $year = intval($date->format('Y'));
        $month = intval($date->format('m'));
        $day = intval($date->format('d'));

        $baseNumber = $this->getBaseNumber($year, $month, $day, $sequence, $bis);
        $controlNumber = $this->getControlNumber($baseNumber, $year);

        $rrn = $baseNumber . $controlNumber;

        $generated = new GeneratedRRN;
        $generated->rrn = $rrn;
        $generated->birthDate = $this->prettyPrintDate($year, $month, $day);
        $generated->gender = $sequence % 2 == 0 ? 'female' : 'male';
        return $generated;
    }

    public function generateRandom(int $ageSwitch = 0, int $genderSwitch = 0, bool $bis = false): GeneratedRRN
    {
        $year = $this->getYear($ageSwitch);
        $month = random_int(1, 12);
        $day = random_int(1, cal_days_in_month(CAL_GREGORIAN, $month, $year));
        $seq = $this->getSequence($genderSwitch);

        $bisValue = 0;
        if ($bis) {
            $bisValue += $year % 2 == 0 ? 40 : 30;
        }

        $baseNumber = $this->getBaseNumber($year, $month, $day, $seq, $bisValue);
        $controlNumber = $this->getControlNumber($baseNumber, $year);

        $rrn = $baseNumber . $controlNumber;

        $generated = new GeneratedRRN;
        $generated->rrn = $rrn;
        $generated->birthDate = $this->prettyPrintDate($year, $month, $day);
        $generated->gender = $seq % 2 == 0 ? 'female' : 'male';
        return $generated;
    }

    private function prettyPrintDate(int $year, int $month, int $day): string
    {
        $monthPart = str_pad($month, 2, '0', STR_PAD_LEFT);
        $dayPart = str_pad($day, 2, '0', STR_PAD_LEFT);
        return "${year}-${monthPart}-${dayPart}";
    }

    private function getBaseNumber(int $year, int $month, int $day, int $seq, int $bis): string
    {
        $month += $bis;
        $monthPart = str_pad($month, 2, '0', STR_PAD_LEFT);
        $dayPart = str_pad($day, 2, '0', STR_PAD_LEFT);
        $seqPart = str_pad($seq, 3, '0', STR_PAD_LEFT);
        $yearPart = substr("{$year}", 2, 2);
        return "{$yearPart}{$monthPart}{$dayPart}{$seqPart}";
    }

    private function getYear(int $ageSwitch): int
    {
        $maxYear = $this->maxYear;
        $minYear = $this->minYear;
        switch ($ageSwitch) {
            case RRNGenerator::$adultOnly:
                $maxYear -= $this->adultMinAge;
                break;
            case RRNGenerator::$minorOnly:
                $minYear = $maxYear -= ($this->adultMinAge - random_int(1, $this->adultMinAge));
                break;
        }
        return random_int($minYear, $maxYear);
    }

    private function getSequence(int $genderSwitch): int
    {
        $seq = random_int(1, RRNGenerator::$maxSequence);
        switch ($genderSwitch) {
            case RRNGenerator::$maleOnly:
                $seq = $seq % 2 != 0 ? $seq : $seq - 1;
                break;
            case RRNGenerator::$femaleOnly:
                $seq = $seq % 2 == 0 ? $seq : $seq + 1;
                break;
        }
        return $seq;
    }

    private function getControlNumber(string $baseNumber, int $year): string
    {
        $controlBase = $baseNumber;
        if ($year >= 2000) {
            $controlBase = "2" . $baseNumber;
        }
        $controlNumber = 97 - (intval($controlBase) % 97);
        return str_pad($controlNumber, 2, '0', STR_PAD_LEFT);
    }
}

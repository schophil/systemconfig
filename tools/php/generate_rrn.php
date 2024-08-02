<?php

class GeneratedRRN {
    public $rrn;
    public $birthDate;
    public $gender;

    public function getAge(): int
    {
        $bd = DateTime::createFromFormat("Y-m-d", $this->birthDate);
        $age = $bd->diff(new DateTime);
        return $age->y;
    }

    public function isMinor(): bool
    {
        return $this->getAge() < 18;
    }

    public function isAdult(): bool
    {
        return $this->getAge() >= 18;
    }

    public function isMale(): bool
    {
        return 'male' === $this->gender;
    }

    public function isFemale(): bool
    {
        return 'female' === $this->gender;
    }

    public function __toString(): string
    {
        $age = $this->getAge();
        return "{$this->rrn};{$this->birthDate};{$age};{$this->gender}";
    }
}


class BelgianRRNGenerator
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

    public function __construct(int $minYear, int $maxYear, int $adultMinAge)
    {
        $this->minYear = $minYear;
        $this->maxYear = $maxYear;
        $this->adultMinAge = $adultMinAge;
    }

    public function generate(int $ageSwitch = 0, int $genderSwitch = 0, bool $bis = false): GeneratedRRN
    {
        $year = $this->getYear($ageSwitch);
        $month = random_int(1, 12);
        $day = random_int(1, cal_days_in_month(CAL_GREGORIAN, $month, $year));
        $seq = $this->getSequence($genderSwitch);

        $baseNumber = $this->getBaseNumber($year, $month, $day, $seq, $bis);
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

    private function getBaseNumber(int $year, int $month, int $day, int $seq, bool $bis): string
    {
        $monthPart = str_pad($month, 2, '0', STR_PAD_LEFT);
        if ($bis) {
            $monthPart += $year % 2 == 0 ? 40 : 30;
        }
        $dayPart = str_pad($day, 2, '0', STR_PAD_LEFT);
        $seqPart = str_pad($seq, 3, '0', STR_PAD_LEFT);
        $yearPart = "" . floor((($year / 100) - floor($year / 100)) * 100);
        $yearPart = str_pad($yearPart, 2, "0", STR_PAD_LEFT);
        return "{$yearPart}{$monthPart}{$dayPart}{$seqPart}";
    }

    private function getYear(int $ageSwitch): int
    {
        $maxYear = $this->maxYear;
        $minYear = $this->minYear;
        switch ($ageSwitch) {
            case BelgianRRNGenerator::$adultOnly:
                $maxYear -= $this->adultMinAge;
                break;
            case BelgianRRNGenerator::$minorOnly:
                $minYear = $maxYear -= $this->adultMinAge;
                break;
        }
        return random_int($minYear, $maxYear);
    }

    private function getSequence(int $genderSwitch): int
    {
        $seq = random_int(1, BelgianRRNGenerator::$maxSequence);
        switch ($genderSwitch) {
            case BelgianRRNGenerator::$maleOnly:
                $seq = $seq % 2 != 0 ? $seq : $seq - 1;
                break;
            case BelgianRRNGenerator::$femaleOnly:
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
        $controlNumber = 97 - intval($controlBase) % 97;
        return str_pad($controlNumber, 2, '0', STR_PAD_LEFT);
    }
}

$total = 0;
$bis = false;
$ageSwitch = BelgianRRNGenerator::$anyAge;
$genderSwitch = BelgianRRNGenerator::$anyGender;

for ($i = 1; $i < sizeof($argv); $i++) {
    $option = $argv[$i];
    if ($option === '--total') {
        $total = $argv[++$i];
    } else if ($option === '--adults') {
        $ageSwitch = BelgianRRNGenerator::adultOnly;
    } else if ($option === '--minors') {
        $ageSwitch = BelgianRRNGenerator::minorOnly;
    } else if ($option === '--males') {
        $genderSwitch = BelgianRRNGenerator::maleOnly;
    } else if ($option === '--females') {
        $genderSwitch = BelgianRRNGenerator::femaleOnly;
    } else if ($option === '--bis') {
        $bis = true;
    }
}

$currentYear = date("Y");
$generator = new BelgianRRNGenerator($currentYear - 100, $currentYear, 18);

while ($total > 0) {
    $rrn = $generator->generate($ageSwitch, $genderSwitch, $bis);
    echo $rrn;
    echo "\n";
    $total--;    
}


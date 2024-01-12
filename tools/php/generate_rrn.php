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

function generateRRN(bool $bis): GeneratedRRN
{
    $year = random_int(1960, 2023);
    $month = str_pad(random_int(1, 12), 2, '0', STR_PAD_LEFT);
    $day = str_pad(random_int(1, 30), 2, '0', STR_PAD_LEFT);
    $seqNbr = random_int(1, 999);
    $seq = str_pad($seqNbr, 3, '0', STR_PAD_LEFT);

    if ($bis) {
        $month += $year % 2 == 0 ? 40 : 30;
    }
    
    $yearSuffix = "" . floor((($year / 100) - floor($year / 100)) * 100);
    $yearSuffix = str_pad($yearSuffix, 2, "0", STR_PAD_LEFT);
    
    $base = "{$yearSuffix}{$month}{$day}{$seq}";
    $controlBase = $base;
    if ($year >= 2000) {
        $controlBase = "2" . $base;
    }
    $remainder = 97 - intval($controlBase) % 97;    
    
    $rrn = new GeneratedRRN();
    $rrn->rrn = $base . str_pad($remainder, 2, '0', STR_PAD_LEFT);
    $rrn->birthDate = "$year-$month-$day";
    $rrn->gender = $seqNbr % 2 === 0 ? 'female' : 'male';
    return $rrn;
}

$total = 0;
$filters = [];
$bis = false;

for ($i = 1; $i < sizeof($argv); $i++) {
    $option = $argv[$i];
    if ($option === '--total') {
        $total = $argv[++$i];
    } else if ($option === '--adults') {
        $filters[] = fn($rrn) => $rrn->isAdult();
    } else if ($option === '--minors') {
        $filters[] = fn($rrn) => $rrn->isMinor();
    } else if ($option === '--males') {
        $filters[] = fn($rrn) => $rrn->isMale();
    } else if ($option === '--females') {
        $filters[] = fn($rrn) => $rrn->isFemale();
    } else if ($option === '--bis') {
        $bis = true;
    }
}

function filter(GeneratedRRN $rrn, array $filters): bool
{
    foreach ($filters as $filter) {
        if (!$filter($rrn)) {
            return false;
        }
    }
    return true;
}

while ($total > 0) {
    $rrn = generateRRN($bis);
    if (filter($rrn, $filters)) {
        echo $rrn;
        echo "\n";
        $total--;    
    }
}


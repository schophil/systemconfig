<?php

class GeneratedRRN {
    public $rrn;
    public $birthDate;
    public $gender;
    public function __toString()
    {
        $bd = DateTime::createFromFormat("Y-m-d", $this->birthDate);
        $age = $bd->diff(new DateTime);
        return "{$this->rrn}: {$this->birthDate} - {$age->y} - {$this->gender}";
    }
}

function generateRRN(): GeneratedRRN
{
    $year = random_int(1960, 2023);
    $month = str_pad(random_int(1, 12), 2, '0', STR_PAD_LEFT);
    $day = str_pad(random_int(1, 30), 2, '0', STR_PAD_LEFT);
    $seqNbr = random_int(1, 999);
    $seq = str_pad($seqNbr, 3, '0', STR_PAD_LEFT);
    
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

$total = $argv[1];
while ($total > 0) 
{
    $rrn = generateRRN();
    echo $rrn;
    echo "\n";
    $total--;    
}


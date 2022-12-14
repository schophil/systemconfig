<?php

class GeneratedRRN {
    public $rrn;
    public $birthDate;
    public $gender;
    public function __toString()
    {
        return "{$this->rrn}: {$this->birthDate} - {$this->gender}";
    }
}

function generateRRN(): GeneratedRRN
{
    $year = random_int(60, 99);
    $month = str_pad(random_int(1, 12), 2, '0', STR_PAD_LEFT);
    $day = str_pad(random_int(1, 30), 2, '0', STR_PAD_LEFT);
    $seqNbr = random_int(1, 999);
    $seq = str_pad($seqNbr, 3, '0', STR_PAD_LEFT);
    $base = "{$year}{$month}{$day}{$seq}";
    $remainder = 97 - intval($base) % 97;
    $rrn = new GeneratedRRN();
    $rrn->rrn = $base . str_pad($remainder, 2, '0', STR_PAD_LEFT);
    $rrn->birthDate = "19$year-$month-$day";
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


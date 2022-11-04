<?php

define('MAX_SEQUENCE', '700');
define('START_DATE', '1900-01-01');
define('DEBUG', '0');

function generateRRN($date, $sequence) 
{
    $fullYear = $date->format('Y');
    $prefix = '';
    if ($fullYear >= 2000) {
        $prefix = '2';
    }

    $year = $date->format('y');
    $month = $date->format('m');
    $day = $date->format('d');
    $seq = str_pad($sequence, 3, '0', STR_PAD_LEFT);
    $base = "{$prefix}{$year}{$month}{$day}{$seq}";
    $remainder = 97 - intval($base) % 97;
    return $base . str_pad($remainder, 2, '0', STR_PAD_LEFT);
}

function decode($needle) 
{
    $date = new \DateTime(START_DATE);
    $sequence = 1;
    while (true) {
        $rrn = generateRRN($date, $sequence++);
        if (DEBUG === '1') {
            echo "Trying {$rrn}\n";
        }
        $hash = hash('sha256', $rrn);
        if ($hash === $needle) {
            $birthDate = $date->format('Y-m-d');
            echo "Result: {$rrn}\n";
            echo "Birth date: {$birthDate}\n";
            break;
        }
        if ($sequence >= MAX_SEQUENCE) {
            $sequence = 1;
            $date = $date->add(new \DateInterval('P1D'));
        }
    }
}

echo "Decoding {$argv[1]}\n";
decode($argv[1]);

<?php

namespace Schophil\Tools\Belgium;

class RRNDecoder
{
    private RRNGenerator $rrnGenerator;
    private string $startDate = '1930-01-01';
    private int $maxSequence = 700;
    private bool $debug = false;
    private string $hashAlgorithm = 'sha256';

    public function __construct(RRNGenerator $rrnGenerator)
    {
        $this->rrnGenerator = $rrnGenerator;
    }

    public function setHashAlgorithm(string $hashAlgorithm): void
    {
        $this->hashAlgorithm = $hashAlgorithm;
    }

    public function setStartDate(string $startDate): void
    {
        $this->startDate = $startDate;
    }

    public function setMaxSequence(int $maxSequence): void
    {
        $this->maxSequence = $maxSequence;
    }

    public function setDebug(bool $debug): void
    {
        $this->debug = $debug;
    }

    function decode(string $needle, array $bisValues)
    {
        $date = new \DateTime($this->startDate);
        $found = false;
        $range = '000';
        while (!$found) {
            $newRange = substr($date->format('Y'), 0, 3);
            if ($range !== $newRange) {
                $range = $newRange;
                echo "Trying {$range}0... \n";
            }
            foreach ($bisValues as $bis) {
                $sequence = 1;
                while (!$found && $sequence < $this->maxSequence) {
                    $rrn = $this->rrnGenerator->generateOne($date, $bis, $sequence++);
                    if ($this->debug) {
                        echo "Trying {$rrn->rrn}\n";
                    }
                    $hash = hash($this->hashAlgorithm, $rrn->rrn);
                    if ($hash === $needle) {
                        $birthDate = $date->format('Y-m-d');
                        echo "Result: {$rrn}\n";
                        echo "Birth date: {$birthDate}\n";
                        echo "Bis: {$bis}\n";
                        $found = true;
                    }
                }
            }
            $date = $date->add(new \DateInterval('P1D'));
        }
    }
}

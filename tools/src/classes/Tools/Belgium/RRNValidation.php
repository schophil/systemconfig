<?php

namespace Schophil\Tools\Belgium;

class RRNValidation
{
    private string $rrn;
    private boolean $valid;
    private array $analysis = [];

    public function __construct(string $rrn)
    {
        $this->rrn = $rrn;
    }

    public function getRRN(): string
    {
        return $this->rrn;
    }

    public function isValid(): bool
    {
        return $this->valid;
    }

    public function setValid()
    {
        $this->valid = true;
    }

    public function setInvalid()
    {
        $this->valid = false;
    }

    public function addAnalysis(string $key, string $value): void
    {
        $this->analysis[$key] = $value;
    }
}

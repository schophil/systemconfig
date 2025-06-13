<?php

namespace Schophil\Tools\Belgium;

class RRNValidation
{
    private string $rrn;
    private bool $valid;
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

    public function setValid(): void
    {
        $this->valid = true;
    }

    public function setInvalid(): void
    {
        $this->valid = false;
    }

    public function getAnalysis(): array
    {
        return $this->analysis;
    }

    public function addAnalysis(string $key, string $value): void
    {
        $this->analysis[$key] = $value;
    }
}

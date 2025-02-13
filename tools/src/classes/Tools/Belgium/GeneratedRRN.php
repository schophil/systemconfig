<?php

namespace Schophil\Tools\Belgium;

class GeneratedRRN
{
    public string $rrn;
    public string $birthDate;
    public string $gender;

    public function getAge(): int
    {
        $bd = \DateTime::createFromFormat("Y-m-d", $this->birthDate);
        $age = $bd->diff(new \DateTime());
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

<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Detail
 *
 * @ORM\Table(name="detail")
 * @ORM\Entity
 */
class Detail
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string|null
     *
     * @ORM\Column(name="description", type="string", length=50, nullable=true)
     */
    private $description;


}

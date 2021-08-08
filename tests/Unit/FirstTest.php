<?php

namespace Tests\Unit;

use PHPUnit\Framework\TestCase;

class FirstTest extends TestCase
{
    /**
     * A basic unit test example.
     *
     * @return void
     */
    public function test_example()
    {
        $this->assertTrue(1==1);
        $this->assertTrue(1+1==2);
        $this->assertTrue(1==1);
    }

    /**
     * A basic unit test example.
     *
     * @return void
     */
    public function test_second()
    {
        $this->assertTrue(2==2);
    }
}

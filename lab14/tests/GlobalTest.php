<?php
declare(strict_types=1);

use PHPUnit\Framework\TestCase;

final class _GlobalTest extends TestCase
{
	public function testLoadConfig():void
	{
		$this->assertArrayHasKey('database',_Global::getConfig());
		$this->assertArrayHasKey('files',_Global::getConfig());

	}
	public function testLoadSqlServerConfig():void
	{
		$this->assertArrayHasKey('hostname',_Global::getDBconfig());
		$this->assertArrayHasKey('user',_Global::getDBconfig());		
		$this->assertArrayHasKey('password',_Global::getDBconfig());
		$this->assertArrayHasKey('database',_Global::getDBconfig());
	}
	public function testLoadStaticFileConfig():void
	{
		$this->AssertArrayHasKey('css',_Global::getStaticConfig());
		$this->AssertArrayHasKey('js',_Global::getStaticConfig());
		$this->AssertArrayHasKey('templates',_Global::getStaticConfig());
	}


}

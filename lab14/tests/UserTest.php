<?php
declare(strict_types=1);
use PHPUnit\Framework\TestCase;

final class UserTest extends TestCase
{
/*	public function testCreateUser():void
	{
		$test = new User("testUser","lol",0);
}*/
	public function testGetAllusers():void
	{
		$test = User::getAll();
		var_dump($test);
	}
}
?>

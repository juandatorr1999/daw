<?php
declare(strict_types=1);

use PHPUnit\Framework\TestCase;

final class ConexTest extends TestCase
{
	public function testConnectException():void
	{
		$this->expectException(Exception::class);
		Conex::con(_Global::getDBConfig("config2.json"));
	}

	
	public function testConnect():void
	{
		_Global::resetConfig();
		Conex::con();
		$this->assertEquals(Conex::ping(),true);
	}
	public function testSelect():void
	{
		$this->assertEquals("tuta", Conex::_query("SELECT user FROM users WHERE id = :id",array(":id"=>"1"))["user"]);
	}
	public function testInsert():void
	{
		Conex::_query("INSERT INTO users(id,user,password,roleid) VALUES (:id,:user,:password,:roleid)",array(":id"=>"2",":user"=>"lol",":password"=>"due",":roleid"=>"0"));			
		$this->assertEquals("lol", Conex::_query("SELECT user FROM users WHERE id = :id",array(":id"=>"2"))["user"]);
	}	

	public function testRemove():void
	{
		Conex::_query("DELETE FROM users WHERE id=:id",array(":id"=>"2"));	
		
		$this->assertEquals(array(), Conex::_query("SELECT user FROM users WHERE id = :id",array(":id"=>"2")));
	}
	}

?>

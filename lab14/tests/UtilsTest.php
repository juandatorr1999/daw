<?php 
declare(strict_types=1);
use PHPUnit\Framework\TestCase;
final class TestUtils extends TestCase
{
	public function testCargarArchivoException():void
	{
		$this->expectException(InvalidArgumentException::class);
		Utils::fileToString("noexiste.txt");
	}

	public function testFileToString(): void
	{
		$this->assertEquals("test\n",
			Utils::fileToString(dirname(__FILE__)."/data/test1.txt"));
	}
	public function testStringToFile(): void
	{
		Utils::stringToFile("test2",dirname(__FILE__)."/data/test2.txt",true);
		$this->assertEquals("test2",
			Utils::fileToString(dirname(__FILE__)."/data/test2.txt"));
	}
	public function testStringToFileExceptionAlreadyExists(): void
	{
		$this->expectException(InvalidArgumentException::class);
		Utils::stringToFile("test2",dirname(__FILE__)."/data/test1.txt",false);	
	}

	public function testStringToHash():void
	{
		$this->assertEquals("067e9d774e7808a3e99fb522d78f7d4a2cb17a4f10b924f824188e7be60a155b",Utils::stringToHash("test","lol",1));
	}
	public function testJsonStringToArray():void
	{
		$this->assertEquals(array("a"=>1),Utils::stringToArray('{"a":1}'));
	}

	public function testJsonStringToArraySyntaxException():voi
	{
		$test = '"a":1';
		$this->expectExceptionMessage("El string '".$test."'tiene errores de syntax");
		Utils::stringToArray($test);
	}
	//Falta agregar test para excepciones de php	
}
?>


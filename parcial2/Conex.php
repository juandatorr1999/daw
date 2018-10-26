<?php
final class Conex extends pdo
{
	private static $instance = null;
	public function __construct(){
		parent::__construct("mysql:dbname=parcial;host=localhost","et4n","");
	}

	public static function getInstance()
	{
		if(self::$instance==null)
		{
			self::con($r);
		}
		return self::$instance;
	}
	public static function con(array $r = null)
	{	
		if(self::$instance == null)
		{
			try
			{
			if($r==null)
				self::$instance=new self();
			else
				self::$instance = new self($r);		
			self::$instance->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			}
			catch (PDOException $e)
			{
				self::$instance = null;		
				throw new Exception($e->getMessage());
			}
		}
	}

	public static function _query( $str,  $params=array())
	{
		self::con();
		$statement = self::$instance->prepare($str);
		foreach($params as $key=>&$val)
			$statement->bindParam($key,$val);

		$statement->execute();
		if (strpos($str, 'SELECT') !== false) 
		{
			$res = $statement->fetchAll(PDO::FETCH_BOTH);	
			if($res!==false)
				return $res;
		}
		return array();
		
	}


	public static function ping()
	{
		try{
			self::$instance->query('SELECT 1+1');
		}
		catch(PDOException $e)
		{
			return false;
		}
		return true;
	}

}
?>

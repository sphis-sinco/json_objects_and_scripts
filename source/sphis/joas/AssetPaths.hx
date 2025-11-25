package sphis.joas;

class AssetPaths
{
	public static function getNamespacePath(path:String, ?namespace:String = 'joas')
	{
		trace('assets/' + namespace + '/' + path);
		return 'assets/' + namespace + '/' + path;
	}
    
	public static function getGuiPath(path:String, ?namespace:String = 'joas')
	{
		return getNamespacePath('gui/' + path, namespace);
	}
}

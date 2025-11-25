package sphis.joas;
import flixel.FlxState;
import sphis.any.ScaledUIBox;

class InitState extends FlxState
{
	override public function create()
	{
		super.create();
		ScaledUIBox.DEFAULT_GUI_PATH = AssetPaths.getNamespacePath('button.png');
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}

package sphis.joas;

import flixel.FlxState;
import sphis.any.ScaledUIBox;
import sphis.joas.gui.TextScaledUIBox;
import flixel.math.FlxPoint;

class InitState extends FlxState
{
	override public function create()
	{
		super.create();

		ScaledUIBox.DEFAULT_GUI_PATH = AssetPaths.getGuiPath('button.png');

		var text_box:TextScaledUIBox = new TextScaledUIBox({
			position: new FlxPoint(),

			width_scale_addition: 16,
			height_scale_addition: 8,
		}, "Hello");
		add(text_box);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}

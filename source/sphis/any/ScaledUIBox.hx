package sphis.any;

import flixel.graphics.FlxGraphic;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import tracedinpurple.ui.FlxScaledSliceSprite;

typedef ScaledUIBoxParameters =
{
	var position:FlxPoint;

	var ?general_scale_addition:Int;
	var ?width_scale_addition:Int;
	var ?height_scale_addition:Int;

	var ?graphic:ScaledUIBoxGraphicParameters;
}

typedef ScaledUIBoxGraphicParameters =
{
	var ?image_path:String;
	var ?corner_radius:Int;
}

class ScaledUIBox extends FlxScaledSliceSprite
{
	public static var DEFAULT_GUI_PATH:String = 'assets/images/gui/button';
	public static var UI_SCALE_MULTIPLIER:Int = 4;

	override public function new(params:ScaledUIBoxParameters)
	{
		var ui_base_graphic = FlxGraphic.fromAssetKey(((params.graphic?.image_path != null) ? params.graphic?.image_path : DEFAULT_GUI_PATH));
		var ui_base_corner_radius = params.graphic?.corner_radius ?? 4;
		var ui_base_slice = new FlxRect(ui_base_corner_radius, ui_base_corner_radius, Std.int(ui_base_graphic.width / 2), Std.int(ui_base_graphic.height / 2));

		super(ui_base_graphic, ui_base_slice, UI_SCALE_MULTIPLIER + (params.general_scale_addition - 1),
			ui_base_slice.width * (UI_SCALE_MULTIPLIER + params.general_scale_addition + params.width_scale_addition),
			ui_base_slice.height * (UI_SCALE_MULTIPLIER + params.general_scale_addition + params.height_scale_addition));

		this.setPosition(params.position.x, params.position.y);
	}
}

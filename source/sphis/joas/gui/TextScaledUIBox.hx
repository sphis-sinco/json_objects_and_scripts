package sphis.joas.gui;

import flixel.FlxSprite;
import flixel.text.FlxText;
import sphis.any.ScaledUIBox;
import flixel.util.FlxDestroyUtil;

class TextScaledUIBox extends ScaledUIBox
{
	public var text_field(default, set):FlxText;
	/**
	 * Shortcut to setting text_field..text
	 */
	public var text(get, set):String;
	inline function get_text():String
	{
		return (text_field != null) ? text_field.text : null;
	}

	inline function set_text(Text:String):String
	{
		if (text_field == null)
		{
			initLabel(Text);
		}
		else
		{
			text_field.text = Text;
		}
		return Text;
	}

	function set_text_field(Value:FlxText):FlxText
	{
		if (Value != null)
		{
			// use the same FlxPoint object for both
			Value.scrollFactor.put();
			Value.scrollFactor = scrollFactor;
		}

		text_field = Value;
		_sprite_text_field = text_field;

		updateLabelPosition();

		return Value;
	}

	/**
	 * Updates the size of the text field to match the button.
	 */
	override function resetHelpers():Void
	{
		super.resetHelpers();

		if (text_field != null)
		{
			text_field.fieldWidth = text_field.frameWidth = Std.int(width);
			text_field.size = text_field.size; // Calls set_size(), don't remove!
		}
	}

	inline function initLabel(Text:String):Void
	{
		if (Text != null)
		{
			text_field = new FlxText(x, y, Std.int(width), Text);
			text_field.setFormat(null, 8, 0x333333, "center");
			text_field.drawFrame(true);
		}
	}

	function updateLabelPosition()
	{
		if (_sprite_text_field != null) // Label positioning
		{
			_sprite_text_field.x = (pixelPerfectPosition ? Math.floor(x) : x) + 0;
			_sprite_text_field.y = (pixelPerfectPosition ? Math.floor(y) : y) + 0;
		}
	}

	var _sprite_text_field:FlxSprite;

	override public function new(params:ScaledUIBoxParameters, ?Text:String)
	{
		super(params);

        this.updatedSlicedHitbox();

		initLabel(Text ?? "");
	}

	override function draw()
	{
		super.draw();

		if (_sprite_text_field != null && _sprite_text_field.visible)
		{
			_sprite_text_field.cameras = _cameras;
			_sprite_text_field.draw();
		}
	}

	#if FLX_DEBUG
	/**
	 * Helper function to draw the debug graphic for the text_field as well.
	 */
	override public function drawDebug():Void
	{
		super.drawDebug();

		if (_sprite_text_field != null)
		{
			_sprite_text_field.drawDebug();
		}
	}
	#end

	override function destroy()
	{
		super.destroy();

		text_field = FlxDestroyUtil.destroy(text_field);
		_sprite_text_field = null;
	}
}

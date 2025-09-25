package objects;

class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;
	private var isPlayer:Bool = false;
	private var char:String = '';


	public function new(char:String = 'bf', isPlayer:Bool = false, curStage:String = 'stage')
	{
		super();
		
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		antialiasing = true;
		animation.add('bf', [0, 1], 0, false, isPlayer);		
		animation.add('flippy-crazy', [26, 26], 0, false, isPlayer);
		animation.add('phsycho-fliqpy', [27, 27], 0, false, isPlayer);
		animation.add('fliqpy', [24, 24], 0, false, isPlayer);	
		animation.add('dad', [12, 13], 0, false, isPlayer);
		animation.add('bf-old', [14, 15], 0, false, isPlayer);
		animation.add('gf', [16], 0, false, isPlayer);

		switch(curStage){		
			default:
				animation.add('flippy', [25, 25], 0, false, isPlayer);
			case 'land-destroyed':
				animation.add('flippy', [27, 27], 0, false, isPlayer);
			case 'land-cute':
				animation.add('flippy', [24, 24], 0, false, isPlayer);		
		}

		animation.play(char);

		switch(char)
		{
			case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit' | 'gf-pixel':
				antialiasing = false;
		}

		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}

	private var iconOffsets:Array<Float> = [0, 0];
	public function changeIcon(char:String, ?allowGPU:Bool = true) {
		//nope
	}

	public var autoAdjustOffset:Bool = true;
	override function updateHitbox()
	{
		super.updateHitbox();
		if(autoAdjustOffset)
		{
			offset.x = iconOffsets[0];
			offset.y = iconOffsets[1];
		}
	}

	public function getCharacter():String {
		return char;
	}
}

package states.stages;

import states.stages.objects.*;
import substates.GameOverSubstate;
import cutscenes.DialogueBox;

import openfl.utils.Assets as OpenFlAssets;

class LandCuteStage extends BaseStage {
	// If you're moving your stage from PlayState to a stage file,
	// you might have to rename some variables if they're missing, for example: camZooming -> game.camZooming
	override function create() {
		defaultCamZoom = 0.9;
		curStage = 'land-cute';

		var bg:FlxSprite = new FlxSprite(-1000, -500).loadGraphic(Paths.image('land-cute/bgWalls', 'week1'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.2, 0.2);
		bg.active = false;
		bg.setGraphicSize(Std.int(bg.width * 0.8));
		bg.updateHitbox();
		add(bg);

		var fgSnow:FlxSprite = new FlxSprite(-600, 700).loadGraphic(Paths.image('land-cute/fgSnow', 'week1'));
		fgSnow.active = false;
		fgSnow.antialiasi
	}

	var doof:DialogueBox = null;

	function initDoof() {
		var file:String = Paths.txt('$songName/dialog'); // Checks for vanilla/Senpai dialogue
		#if MODS_ALLOWED
		if (!FileSystem.exists(file))
		#else
		if (!OpenFlAssets.exists(file))
		#end
		{
			file = Paths.txt('$songName/dialog');
		}

		#if MODS_ALLOWED
		if (!FileSystem.exists(file))
		#else
		if (!OpenFlAssets.exists(file))
		#end
		{
			startCountdown();
			return;
		}

		doof = new DialogueBox(false, CoolUtil.coolTextFile(file));
		doof.cameras = [camHUD];
		doof.scrollFactor.set();
		doof.finishThing = startCountdown;
		doof.nextDialogueThing = PlayState.instance.startNextDialogue;
		doof.skipDialogueThing = PlayState.instance.skipDialogue;
	}
}

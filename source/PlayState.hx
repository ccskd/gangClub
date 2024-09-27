package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	var title:FlxText; //create variable title
	var sprite:FlxSprite;
	var yam:FlxSprite;
	var choice:Bool;
	var speech:FlxSprite;
	var dialog:FlxText;
	var chat:Bool;
	var up:Bool = false;
	var down:Bool = false;
	var left:Bool = false;
	var right:Bool = false;
	var upF:Bool = false;
	var downF:Bool = false;
	var leftF:Bool = false;
	var rightF:Bool = false;
	var bg:FlxSprite;
	var mata1:FlxSprite;
	var mata2:FlxSprite;
	override public function create()
	{
		super.create();
		/*title = new FlxText(0, 540, FlxG.width, "Shin Megami Tensei on CrackB", 64); //title properties
		title.setFormat(null, 64, FlxColor.RED, FlxTextAlign.CENTER); //title format
		add(title); //show title

		ember = new FlxSprite();
		ember.loadGraphic(AssetPaths.ember__png, true, 990, 990);
		ember.animation.add("idle", [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30], 12, true);
		ember.animation.add("idle talk", [31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62], 12, true);
		ember.animation.add("surprised", [63,64,65,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84], 12, false);
		add(ember);
		
		ember.animation.play("idle");
		
		speech = new FlxSprite();
		speech.makeGraphic(FlxG.width-2*120, 260, flixel.util.FlxColor.WHITE);
		speech.x = (FlxG.width / 2) - (speech.width / 2);
		speech.y = 650;

		add(speech);
		dialog = new FlxText(speech.x + 90, 740, speech.width, "Hello World", 22);
		dialog.setFormat(null, 22, FlxColor.BLACK, FlxTextAlign.LEFT);
		add(dialog);*/
		bg = new FlxSprite();
		bg.loadGraphic(AssetPaths.artGallery__png, false);
		bg.x = FlxG.width/4 - bg.width/2 ;
		bg.y = -FlxG.height/2;
		bg.setSize(1920, 1080);
		add(bg);

		mata1 = new FlxSprite();
		mata1.loadGraphic(AssetPaths.matau_reading__png, false);
		mata1.x = 20;
		mata1.y = 10;
		mata1.scale.x = 0.4;
		mata1.scale.y = 0.4;
		add(mata1);

		mata2 = new FlxSprite();
		mata2.loadGraphic(AssetPaths.matau_self_portrait_S__png, false);
	

		yam = new FlxSprite();
		yam.loadGraphic(AssetPaths.Yam__png, true, 128, 128);
		yam.setPosition(FlxG.width/2, FlxG.height/2);
		yam.scale.x = 3;
		yam.scale.y = 3;
		yam.animation.add("idle front", [0], 1);
		yam.animation.add("walk front", [0,1,2,3], 7, true);
		yam.animation.add("idle right", [4], 1);
		yam.animation.add("walk right", [4,5,6,7], 7, true);
		yam.animation.add("idle left", [8], 1);
		yam.animation.add("walk left", [8,9,10,11], 7, true);
		yam.animation.add("idle back", [12], 1);
		yam.animation.add("walk back", [12,13,14,15], 7, true);
		yam.setSize(256, 256);
		add(yam);
		
		yam.animation.play("idle front");
		
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		up = FlxG.keys.anyPressed([UP, W]);
		down = FlxG.keys.anyPressed([DOWN, S]);
		left = FlxG.keys.anyPressed([LEFT, A]);
		right = FlxG.keys.anyPressed([RIGHT, D]);

		upF = FlxG.keys.anyJustReleased([UP, W]);
		downF = FlxG.keys.anyJustReleased([DOWN, S]);
		leftF = FlxG.keys.anyJustReleased([LEFT, A]);
		rightF = FlxG.keys.anyJustReleased([RIGHT, D]);

		if (up && yam.y>540) {
			yam.animation.play("walk back");
			yam.y -=10;
			yam.scale.x -= elapsed * 4;
			yam.scale.y -= elapsed * 4;
		}
		else if (down && yam.y<FlxG.height) {
			yam.animation.play("walk front");
			yam.y += 10;
			yam.scale.x += elapsed * 4;
			yam.scale.y += elapsed * 4;
		}
		else if (left) {
			yam.animation.play("walk left");
			yam.x -= 10;
		}
		else if (right){
			yam.animation.play("walk right");
			yam.x += 10;
		}
		else if (upF)
			yam.animation.play("idle back"); 
		else if (downF)
			yam.animation.play("idle front");
		else if (leftF)
			yam.animation.play("idle left");
		else if (rightF)
			yam.animation.play("idle right");
	}

}
package {

import flash.display.Sprite;
import flash.text.TextField;

import net.flashpunk.Engine;
import net.flashpunk.FP;

[SWF(width="800", height="600", backgroundColor="#ffffff")]
public class Main extends Engine
{
    public function Main()
    {
        super(800, 600);
    }

	override public function init():void
	{
		super.init();
		FP.screen.color = 0xffffff;
		FP.world = new BaseWorld();
	}
}
}

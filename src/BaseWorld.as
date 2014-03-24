package
{
import flash.geom.Point;

import net.flashpunk.World;
import net.flashpunk.utils.Draw;
import net.flashpunk.utils.Input;

public class BaseWorld extends World
{
	public function BaseWorld()
	{
		super();
	}

	override public function begin():void
	{
		var block:StickyBlock = StickyBlock(add(new StickyBlock(175, 375)));
		block.velocity.y = 50;
		block = StickyBlock(add(new StickyBlock(575, 175)));
		block.velocity.y = -50;
		super.begin();
	}

	override public function update():void
	{
		if (Input.mousePressed)
		{
			var b:Block = Block(create(Block, true));
			var mouseLocation:Point = new Point(Input.mouseX - 400, Input.mouseY - 300);
			mouseLocation.normalize(200);
			b.init(395, 295, mouseLocation.x, mouseLocation.y);
		}
		super.update();
	}

	override public function render():void
	{
		Draw.circle(400, 300, 50, 0xff999999);
		super.render();
	}
}
}

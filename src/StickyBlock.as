package
{
import flash.display.BitmapData;
import flash.geom.Point;

import net.flashpunk.Entity;
import net.flashpunk.FP;
import net.flashpunk.graphics.Image;
import net.flashpunk.masks.Hitbox;

public class StickyBlock extends Entity
{
	protected var _stuckEntities:Vector.<Block>;
	public var velocity:Point;
	public function StickyBlock(x:Number = 0, y:Number = 0)
	{
		_stuckEntities = new Vector.<Block>();
		velocity = new Point();
		type = "sticky";
		super(x, y, new Image(new BitmapData(50, 50, false, 0xff333333)), new Hitbox(50, 50));
	}

	override public function update():void
	{
		x += velocity.x * FP.elapsed;
		y += velocity.y * FP.elapsed;

		if (y < 0)
		{
			y = 0;
			velocity.y *= -1;
		}
		else if (y > 549)
		{
			y = 549;
			velocity.y *= -1;
		}

		// Update stuck objects.
		for each (var b:Block in _stuckEntities)
		{
			b.updateStuck(x, y);
		}

		super.update();
	}

	public function attachBlock(b:Block):Point
	{
		_stuckEntities.push(b);
		return new Point(x, y);
	}
}
}

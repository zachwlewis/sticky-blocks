package
{
import flash.display.BitmapData;
import flash.geom.Point;

import net.flashpunk.Entity;
import net.flashpunk.FP;
import net.flashpunk.Graphic;
import net.flashpunk.Mask;
import net.flashpunk.graphics.Image;
import net.flashpunk.masks.Hitbox;

public class Block extends Entity
{
	public var velocity:Point;
	protected var _stuck:Boolean;
	protected var stuckOffset:Point;
	public function Block(x:Number = 0, y:Number = 0)
	{
		velocity = new Point();

		super(x, y, new Image(new BitmapData(10, 10, false, 0xff007bff)), new Hitbox(10, 10));
	}

	public function init(x:Number, y:Number, vx:Number, vy:Number):void
	{
		_stuck = false;
		this.x = x;
		this.y = y;
		velocity.x = vx;
		velocity.y = vy;
	}

	override public function update():void
	{
		// Only update if not stuck.
		// Let updateStuck handle updates once stuck.
		if (!_stuck)
		{
			x += velocity.x * FP.elapsed;
			y += velocity.y * FP.elapsed;

			var sb:StickyBlock = StickyBlock(collide("sticky", x, y));

			if (sb != null)
			{
				// Hit a sticky block.
				stuckOffset = sb.attachBlock(this).subtract(new Point(x, y));
				_stuck = true;
			}

			if (x > 810 || x < 0 || y > 610 || y < 0)
			{
				this.world.recycle(this);
			}
		}
		super.update();
	}

	public function updateStuck(ux:Number, uy:Number):void
	{
		trace("Stuck");
		this.x = ux - stuckOffset.x;
		this.y = uy - stuckOffset.y;
		super.update();
	}

}
}

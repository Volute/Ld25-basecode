package GUI 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import com.greensock.TweenLite;

	
	public class Button extends MovieClip
	{
		public var clickFunction    :Function;
		public var rollOverFunction :Function;
		public var rollOutFunction  :Function;
		public var available        :Boolean = true;
		public var scaleOver        :Number = 1.1;
		public var scaleOut         :Number  = 1;
		public var tooltipIsEnabled :Boolean = false;
		public var tooltipTexte     :String;
		public var tooltipX         :int;
		public var tooltipY         :int;
		public var tooltipObjHeight :int;
		public var tooltipWidth     :int;
		public var scaleEnable      :Boolean = true;
		public var soundEnabled     :Boolean = true;
		
		
		public function Button() 
		{
			addEventListener(MouseEvent.ROLL_OVER, rollOver, false, 0, true);
			addEventListener(MouseEvent.ROLL_OUT, rollOut, false, 0, true);
			addEventListener(MouseEvent.CLICK, click, false, 0, true);
			
			scaleOut  = this.scaleX;
			scaleOver = this.scaleX * 1.1;
			
			buttonMode = true;
			mouseChildren = false;
		}	
		
		
		public function addClickFunction(clickFunction:Function) :void
		{
			this.clickFunction = clickFunction;
		}
		
		
		public function addRollOverFunction(rollOverFunction:Function) :void
		{
			this.rollOverFunction = rollOverFunction;
		}
		
		
		public function addRollOutFunction(rollOutFunction:Function) :void
		{
			this.rollOutFunction = rollOutFunction;
		}		
		
		
		public function rollOver(event:MouseEvent) :void
		{
			if (scaleEnable) TweenLite.to(this, 0.3, { scaleX: scaleOver, scaleY: scaleOver } );
			if (rollOverFunction != null) { rollOverFunction(); }
			
			if (tooltipIsEnabled) {
				ToolTip.show(tooltipTexte, tooltipX, tooltipY, tooltipObjHeight, tooltipWidth);
			}
			
			if (soundEnabled) {
				Son.playSon(Son.Son_rollover);
			}
		}
		
		
		public function rollOut(event:MouseEvent) :void 
		{
			if (scaleEnable) TweenLite.to(this, 0.3, { scaleX: scaleOut, scaleY: scaleOut } );
			if (rollOutFunction != null) { rollOutFunction(); }
			
			if (tooltipIsEnabled) {
				ToolTip.hide();
			}			
		}
		
		
		public function click(event:MouseEvent) :void 
		{
			if (clickFunction != null) { clickFunction(); }
		}
		
		
		public function tooltipEnable(texte:String, X:int, Y:int, tooltipObjHeight_var:int=NaN, tooltipWidth_var:int=175) :void
		{
			tooltipIsEnabled = true;
			tooltipTexte     = texte;	
			tooltipX         = X;
			tooltipY         = Y;
			tooltipObjHeight = tooltipObjHeight_var;
			tooltipWidth     = tooltipWidth_var;
		}
		
	}

}
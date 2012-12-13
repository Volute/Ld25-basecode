package  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	import flash.display.DisplayObjectContainer;
	import flash.filters.GlowFilter;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;	

	public class F 
	{
		public static var callBackFunction:Function;
		
		public function F() 
		{
			
		}
		
		
		public static function addMyChild(parent:DisplayObjectContainer, child:DisplayObject) :void 
		{
			if (child == null)  { trace("addMyChild error : child is null"); return; }
			if (parent == null) { trace("addMyChild error : parent is null"); return; }
			if (!parent.contains(child)) { parent.addChild(child); }
			else { trace("addMyChild error : parent already contains child"); }
		}
		
		public static function removeMyChild(parent:DisplayObjectContainer, child:DisplayObject) :void 
		{
			if (child == null)  { trace("removeMyChild error : child is null"); return; }
			if (parent == null) { trace("removeMyChild error : parent is null"); return; }
			if (parent.contains(child)) { parent.removeChild(child); }
			else { trace("removeMyChild error : parent does not contain child"); }
		}
		
		
		public static function setMyChildOnTop(parent:DisplayObjectContainer, child:DisplayObject) :void 
		{
			parent.setChildIndex(child, parent.numChildren - 1);
		}
		
		
		public static function setMyChildOnBottom(parent:DisplayObjectContainer, child:DisplayObject) :void 
		{
			parent.setChildIndex(child, 0);
		}		
		
		
		public static function swapMyChildren(parent:DisplayObjectContainer, child1:DisplayObject, child2:DisplayObject) :void
		{
			if (child1 == null || child2 == null) { return; }
			if (child1.parent != parent || child2.parent != parent) { return; }
			
			parent.swapChildren(child1, child2);
		}
		
		
		public static function bug(event:Event = null) :void 
		{
			var array:Array;
			
			trace(array[0].nom);
		}
		
		
		public static function makeFirstCharUppercase(str:String) : String 
		{
			var firstChar:String = str.substr(0, 1); 
			var restOfString:String = str.substr(1, str.length); 
			
			return firstChar.toUpperCase()+restOfString.toLowerCase(); 
		}
		
		
		public static function makeAllCaps(str:String) :String
		{
			return str.toUpperCase();
		}
		
		
		public static function getClassName(object:*) :String
		{
			var className :String;
			
			if (object is Object)
			{
				className = getQualifiedClassName(object);
				className = className.slice(className.lastIndexOf("::") + 2);
			}
			else if (object is Class)
			{
				className = object.toString();
				className = className.slice(className.lastIndexOf("[class ") + 7);
				className = className.substr(0, className.length - 1);
			}
			
			return className;
		}
		
		
		public static function sameClass(object1:Object, object2:Object) :Boolean
		{
			if (getQualifiedClassName(object1) == getQualifiedClassName(object2))
			{
				return true;
			}
			return false;
		}
		
		
		public static function getDuplicateClip(mc:MovieClip, param:*) :MovieClip
		{
			var classeMc:Class = Class(getDefinitionByName(getQualifiedClassName(mc)));
			var duplicateClip:MovieClip = new classeMc(param);
			return duplicateClip;
		}
		
		
		public static function loopAnimation(mc:MovieClip, frameDebut:int, frameFin:int) :void 
		{
			mc.addFrameScript(frameFin, function() :void { mc.gotoAndPlay(frameDebut); } );
			mc.gotoAndPlay(frameDebut);
		}
		
		
		public static function sort(container:DisplayObjectContainer, property:String) :void 
		{
			for (var i:int = container.numChildren - 1; i > 0; i--) 
			{
				var bFlipped:Boolean = false;
				
				for (var j:int = 0; j < i; j++) {
					if (container.getChildAt(j)[property] > container.getChildAt(j+1)[property]) {
						container.swapChildrenAt(j,j+1);
						bFlipped = true;
					}
				}
				if (!bFlipped)
					return;
			}
		}
		
		
		public static function getValeurCompriseEntre(valeurMin:int, valeurMax:int) :int
		{
			var diff   :int = valeurMax - valeurMin;
			var tirage :int = Math.floor(Math.random() * (diff + 1));
			
			return valeurMin + tirage;
		}
		
		
		public static function str_replace(replace_what:String, replace_by:String, original:String):String
		{
			var array:Array = original.split(replace_what);
			return array.join(replace_by);
		}	
		
		public static function getTiragePourcentageChances(pourcentage:int) :Boolean
		{
			var tirage:int = Math.floor(Math.random() * 101);
			
			if (tirage <= pourcentage)
			{
				return true;
			}
			else 
			{
				return false;
			}
		}
		
		
		public static function readXml() :void 
		{
			
		}
		
		
		public static function removeMyChildren(me:DisplayObjectContainer) :void 
		{
			for (var i:int = me.numChildren - 1 ; i >= 0 ; i--)
			{
				var child:DisplayObject = me.getChildAt(i);
				child = null;
				me.removeChildAt(i);
			}
		}
		
		
		public static function followLink(link:String) :void 
		{
			navigateToURL(new URLRequest(link), "_blank");
		}
		
		
		public static function getDistanceTwoPoints(x1:Number, y1:Number,  x2:Number, y2:Number):
			Number {
			var dx:Number = x1-x2;
			var dy:Number = y1-y2;
			return Math.sqrt(dx * dx + dy * dy);
		}
		
		
		public static function createMc(newMc:MovieClip, X:int, Y:int, scaleX:int=1) :MovieClip
		{
			newMc.x = X;
			newMc.y = Y;
			newMc.scaleX = scaleX;
			
			return newMc;
		}	
		
		
		public static function getAngleBetween(point1:Point, point2:Point):Number 
		{
			var dx:Number = point2.x - point1.x;
			var dy:Number = point2.y - point1.y;
			return -Math.atan2(dx,dy);
		}
		
		
		public static function radiansToDegrees(radians:Number):Number
		{
			return radians * 180 / Math.PI;
		}
	 
		public static function degreesToRadians(degrees:Number):Number
		{
			return degrees * Math.PI / 180;
		}		
	}

}
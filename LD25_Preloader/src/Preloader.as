package 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.getDefinitionByName;
	import flash.utils.getTimer;
	import flash.net.navigateToURL;
	
	/**
	 * ...
	 * @author Volute
	 */
	public class Preloader extends MovieClip 
	{
		private var clip:PreloaderClip;
		private var barre:Shape;
		private var fond:Shape;
		private var fondBlanc:Shape;
		public  var background:Sprite;
		public  var loading:TextField;
		
		public  var lastTime   :int;
		public  var lastSortie :int;
		public  var percent:Number = 0;
		
		public  var isLoaded:Boolean = false;
		public  var mainClass:Class;
		
		
		public function Preloader() 
		{
			if (stage) {
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			
			addEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			// TODO show loader
			clip = new PreloaderClip();
			addChild(clip);
			//clip.barre.barre.mask.scaleX = 0;
			clip.barre.masque.scaleX = 0;
			clip.texte_version.text = "v 0.1";
			
			clip.button_twitter.addEventListener(MouseEvent.CLICK, clickedTwitter);
			clip.button_facebook.addEventListener(MouseEvent.CLICK, clickedFacebook);			
		}
		
		
		private function ioError(e:IOErrorEvent):void 
		{
			trace(e.text);
		}
		
		public function clickedTwitter(event:MouseEvent) :void 
		{
			navigateToURL(new URLRequest("http://"), "_blank");
		}
		
		
		public function clickedFacebook(event:MouseEvent) :void 
		{
			navigateToURL(new URLRequest("http://"), "_blank");
		}	 
		
		
		private function checkFrame(e:Event):void 
		{
			if (percent >= 1) 
			{
				loadingFinished();
			}
			else
			{
				if (lastTime == 0) lastTime = getTimer();
				var timeDiff:int = getTimer() - lastTime;
				lastTime = getTimer();
				// affiche une barre de progression
				percent = root.loaderInfo.bytesLoaded / root.loaderInfo.bytesTotal;
				//percent += 0.1; //0.002; 
				if (percent > 1) percent = 1;
				clip.barre.masque.scaleX = percent;
				clip.texte_pourcents.text = String(Math.round(percent * 100) + " %");
			}			
		}
		
		private function loadingFinished():void 
		{
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioError);
			removeEventListener(Event.ENTER_FRAME, checkFrame);		
			
			clip.removeChild(clip.texte_pourcents);
			clip.removeChild(clip.texte_loading);
			clip.removeChild(clip.barre);
			clip.removeChild(clip.button_twitter);
			clip.removeChild(clip.button_facebook);
			
			clip.button_twitter.removeEventListener(MouseEvent.CLICK, clickedTwitter);
			clip.button_facebook.removeEventListener(MouseEvent.CLICK, clickedFacebook);	
			
			mainClass = getDefinitionByName("PreloaderMain") as Class;
			
			removeChild(clip);
			addChild(new mainClass() as DisplayObject);
		}		
		
	}
	
}
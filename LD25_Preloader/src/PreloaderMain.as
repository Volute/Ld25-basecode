package 
{
	import flash.display.Sprite;
	import flash.events.Event;


	
	[Frame(factoryClass="Preloader")]
	public class PreloaderMain extends Sprite 
	{
		[Embed(source="Project.swf")]
		private var game:Class;
		
		public function PreloaderMain():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			addChild(new game());
			trace("added");
		}

	}

}
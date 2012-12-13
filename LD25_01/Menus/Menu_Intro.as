package Menus 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import GUI.Button;
	

	
	public class Menu_Intro extends MovieClip 
	{
		public var mainGame    :Main;
		public var button_next :Button;
		
		
		public function Menu_Intro(mainGame:Main) 
		{
			this.mainGame = mainGame;
		}
		
		
		public function show() :void 
		{
			button_next.addEventListener(MouseEvent.CLICK, clickedNext);
		}
		
		
		public function hide() :void 
		{
			
		}
		
		
		public function removeListeners() :void 
		{
			button_next.removeEventListener(MouseEvent.CLICK, clickedNext);
		}
		
		
		public function clickedNext(event:MouseEvent) :void 
		{
			removeListeners();
			
			mainGame.transition("Menu_Intro", "Menu_Game");
		}
		
	}

}
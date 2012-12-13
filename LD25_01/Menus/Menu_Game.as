package Menus 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	

	
	public class Menu_Game extends MovieClip 
	{
		public var mainGame    :Main;
		
		
		public function Menu_Game(mainGame:Main) 
		{
			this.mainGame = mainGame;
		}
		
		
		public function show() :void 
		{
			SaveVars.saveIncremente("nbPlays");
			
			F.addMyChild(mainGame.spriteInterface, mainGame.spriteInterface.button_quit);
			F.addMyChild(mainGame.spriteInterface, mainGame.spriteInterface.button_restart);
			
			mainGame.spriteInterface.button_quit.addEventListener(MouseEvent.CLICK, clickedQuit);
			mainGame.spriteInterface.button_restart.addEventListener(MouseEvent.CLICK, clickedRestart);
		}
		
		
		public function hide() :void 
		{
			F.removeMyChild(mainGame.spriteInterface, mainGame.spriteInterface.button_quit);
			F.removeMyChild(mainGame.spriteInterface, mainGame.spriteInterface.button_restart);
		}
		
		
		public function removeListeners() :void 
		{
			mainGame.spriteInterface.button_quit.removeEventListener(MouseEvent.CLICK, clickedQuit);
			mainGame.spriteInterface.button_restart.removeEventListener(MouseEvent.CLICK, clickedRestart);
		}
		
		
		public function clickedQuit(event:MouseEvent) :void
		{
			removeListeners(); 
			
			mainGame.transition("Menu_Game", "Menu_Home");
		}
		
		
		public function clickedRestart(event:MouseEvent) :void 
		{
			removeListeners();
			
			mainGame.transition("Menu_Game", "Menu_Game");
		}
		
	}

}
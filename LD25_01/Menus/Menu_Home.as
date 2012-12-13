package Menus 
{
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import GUI.Button;
	import flash.display.MovieClip;
	

	
	public class Menu_Home extends MovieClip 
	{
		public var mainGame        :Main;
		public var button_start    :Button;
		public var button_twitter  :Button;
		public var button_facebook :Button;
		public var texte_nbPlays   :TextField;
		
		public function Menu_Home(mainGame:Main) 
		{
			this.mainGame = mainGame;
		}
		
		
		public function show() :void 
		{
			button_start.addEventListener(MouseEvent.CLICK, clickedStart);
			button_twitter.addEventListener(MouseEvent.CLICK, clickedTwitter);
			button_facebook.addEventListener(MouseEvent.CLICK, clickedFacebook);
			
			texte_nbPlays.text = String("Number of plays : " + SaveVars.nbPlays);
		}
		
		
		public function hide() :void 
		{
			
		}
		
		
		public function removeListeners() :void 
		{
			button_start.removeEventListener(MouseEvent.CLICK, clickedStart);
			button_twitter.removeEventListener(MouseEvent.CLICK, clickedTwitter);
			button_facebook.removeEventListener(MouseEvent.CLICK, clickedFacebook);
		}
		
		
		public function clickedStart(event:MouseEvent) :void 
		{
			removeListeners();
			
			mainGame.transition("Menu_Home", "Menu_Intro");
		}
		
		
		public function clickedTwitter(event:MouseEvent) :void 
		{
			F.followLink("http://");
		}
		
		
		public function clickedFacebook(event:MouseEvent) :void 
		{
			F.followLink("http://");
		}
		
	}

}
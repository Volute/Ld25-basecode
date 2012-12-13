package Menus 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import GUI.Button;
	

	
	public class UI_Main extends MovieClip 
	{
		public var main           :Main;
		public var button_sound   :Button;
		public var button_music   :Button;
		public var button_restart :Button;
		public var button_quit    :Button;
		
		public function UI_Main(main:Main) :void
		{
			this.main = main;
			
			button_sound.addClickFunction(Son.toggleSound);
			button_music.addClickFunction(Son.toggleMusic);
			
			button_sound.tooltipEnable  ("sound", button_sound.x, 10, NaN, 100);
			button_music.tooltipEnable  ("music", button_music.x, 10, NaN, 100);
			button_restart.tooltipEnable("restart", button_restart.x, 10, NaN, 100);
			button_quit.tooltipEnable   ("quit", button_quit.x, 10, NaN, 100);
			
			F.removeMyChild(this, button_restart);
			F.removeMyChild(this, button_quit);
		}
		
	}

}
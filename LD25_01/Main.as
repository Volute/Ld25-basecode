package  
{
	import com.greensock.TweenLite;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import GUI.ToolTip;
	import Menus.Menu_Game;
	import Menus.Menu_Home;
	import Menus.Menu_Intro;
	import Menus.UI_Main;
	
	public class Main extends MovieClip
	{
		public var spriteInterface   :UI_Main;
		public var spriteGame        :Sprite;
		public var menuHome          :Menu_Home;
		public var menuIntro         :Menu_Intro;
		public var menuGame          :Menu_Game;        
		public var transition_before :String;
		public var transition_after  :String;
		public var transition_left   :MovieClip;
		public var transition_right  :MovieClip;
		
		
		public function Main() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init); 
		}
		
		
		public function init(event:Event) :void 
		{
			ToolTip.initialize(stage, ".emphasize { color:#FFA6A6; } .title { font-size: 18px; } .lightGreen { color: #A3FF9C; }");
			Son.init();
			SaveVars.loadFromSave(1);
			
			Son.playMusique();
			
			spriteGame      = new Sprite();
			spriteInterface = new UI_Main(this);
			
			F.addMyChild(this, spriteGame);
			F.addMyChild(this, spriteInterface);
			
			menuHome = new Menu_Home(this);
			menuHome.show();
			F.addMyChild(spriteGame, menuHome);
		}
		
		
		public function transition(transition_before:String, transition_after:String) :void 
		{
			this.transition_before = transition_before;
			this.transition_after  = transition_after;
			
			if (transition_left == null)  transition_left  = new Transition_Left();
			if (transition_right == null) transition_right = new Transition_Right();
			
			transition_left.x  = -400;
			transition_right.x = 800;
			
			F.addMyChild(this, transition_left);
			F.addMyChild(this, transition_right);
			
			TweenLite.to(transition_left, 0.5, { x:0, onComplete: transitionClosed } );
			TweenLite.to(transition_right, 0.5, { x:400 } );
		}
		
		
		public function transitionClosed() :void 
		{
			if (transition_before == "Menu_Home") {
				F.removeMyChild(spriteGame, menuHome);
				menuHome.hide();
			}
			if (transition_before == "Menu_Intro") {
				F.removeMyChild(spriteGame, menuIntro);
				menuHome.hide();
			}		
			if (transition_before == "Menu_Game") {
				F.removeMyChild(spriteGame, menuGame);
				menuGame.hide();
			}			
			
			
			if (transition_after == "Menu_Intro") {
				if (menuIntro == null) menuIntro = new Menu_Intro(this);
				F.addMyChild(spriteGame, menuIntro);
				menuIntro.show();
			}
			if (transition_after == "Menu_Game") {
				if (menuGame == null) menuGame = new Menu_Game(this);
				F.addMyChild(spriteGame, menuGame);
				menuGame.show();
			}
			if (transition_after == "Menu_Home") {
				F.addMyChild(spriteGame, menuHome);
				menuHome.show();
			}
			
			TweenLite.delayedCall(0.5, transitionReopen);
		}
		
		
		public function transitionReopen() :void 
		{
			TweenLite.to(transition_left, 0.5, { x:-400, onComplete: transitionReopened } );
			TweenLite.to(transition_right, 0.5, { x:800 } );
		}
		
		
		public function transitionReopened() :void 
		{
			F.removeMyChild(this, transition_left);
			F.removeMyChild(this, transition_right);
		}
		
	}

}
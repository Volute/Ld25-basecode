package  
{
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.media.Sound;
	
	
	public class Son 
	{
		public static var channelMusique           :SoundChannel;
		public static var channelSon               :SoundChannel;    
		public static var soundTransformMusic      :SoundTransform = new SoundTransform();
		public static var soundTransformSon        :SoundTransform = new SoundTransform(); 
		public static var muteSound                :Boolean        = false;
		public static var muteMusic                :Boolean        = false;
		public static var soundMaxVolume           :Number         = 1;
		public static var musicMaxVolume           :Number         = 1;
		
		[Embed(source = "Assets/Music/Music01.mp3")]            public static var Musique01       :Class;
		
		
		[Embed(source = "Assets/Sound/rollover.mp3")]           public static var Son_rollover    :Class;
		
		public function Son() 
		{
			
		}
		
		
		public static function init() 
		{
			channelMusique = new SoundChannel();
			channelSon     = new SoundChannel();
			
			soundMaxVolume = 1;
			soundTransformSon.volume  = soundMaxVolume;
			channelSon.soundTransform = soundTransformSon;
		}
		
		
		public static function toggleSound() :void 
		{
			if (muteSound) {
				soundTransformSon.volume = soundMaxVolume;
				channelSon.soundTransform = soundTransformSon;
				muteSound = false;
				//Log.CustomMetric("EnableSound", "Sound"); 
			}
			else {
				soundTransformSon.volume = 0;
				channelSon.soundTransform = soundTransformSon;
				muteSound = true;
				channelSon.stop();
				//Log.CustomMetric("MuteSound", "Sound"); 
			}
		}
		
		
		public static function toggleMusic() :void 
		{
			if (muteMusic) {
				soundTransformMusic.volume = 1;
				channelMusique.soundTransform = soundTransformMusic;
				muteMusic = false;
				//Log.CustomMetric("EnableMusic", "Sound"); 
			}
			else {
				soundTransformMusic.volume = 0;
				channelMusique.soundTransform = soundTransformMusic;
				muteMusic = true;
				//Log.CustomMetric("MuteMusic", "Sound"); 
			}
		}
		
		
		public static function muteAll() :void 
		{
			soundTransformSon.volume = 0;
			channelSon.soundTransform = soundTransformSon;
			muteSound = true;			
			
			soundTransformMusic.volume = 0;
			channelMusique.soundTransform = soundTransformMusic;
			muteMusic = true;
		}	
		
		
		public static function playRandomSoundWithArray(array:Array) :void 
		{
			/*var sound:Class = ArrayUtil.random(array);
			if (sound == null) return;
			channelSon = new sound().play();
			if (channelSon == null) return;
			channelSon.soundTransform = soundTransformSon;*/
		}
		
		
		public static function playSon(sonClass:Class) :void
		{
			channelSon = new sonClass().play();
			channelSon.soundTransform = soundTransformSon;
		}	
		
		
		public static function playMusique() :void 
		{
			channelMusique.stop();
			channelMusique = new Musique01().play(1, 9999);
			channelMusique.soundTransform = soundTransformMusic;
		}		
		
	}

}
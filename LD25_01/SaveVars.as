package  
{
	import flash.events.NetStatusEvent;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	
	
	public class SaveVars 
	{
		public static var gameInfos                :SharedObject;
		public static var optionsInfos             :SharedObject;
		public static var nbPlays                  :int;
		
		
		public function SaveVars() 
		{
			
		}
		
		
		public static function loadFromSave(num:int) :Boolean 
		{ 
			if (new Array(1, 2, 3).indexOf(num) < 0) return false;
			
			if (num == 1) gameInfos = SharedObject.getLocal("LD25_1", "/");
			if (num == 2) gameInfos = SharedObject.getLocal("LD25_2", "/");
			if (num == 3) gameInfos = SharedObject.getLocal("LD25_3", "/");
			
			
			nbPlays = 0;
			
			if (gameInfos.data.nbPlays == undefined) return false;
			
			if (gameInfos.data.nbPlays  != undefined) { nbPlays = gameInfos.data.nbPlays; }
			
			return true;
		}
		
		
		public static function saveIncremente(label:String, valeur:int = 1) :void 
		{
			SaveVars[label] = SaveVars[label] + valeur;
			gameInfos.data[label] = SaveVars[label];
			saveData(gameInfos);
		}
		
		
		public static function saveBest(label:String, valeur:int = 1) :void 
		{
			if (SaveVars[label] > valeur) return;
			SaveVars[label] = valeur;
			gameInfos.data[label] = SaveVars[label];
			saveData(gameInfos);
		}	
		
		
		public static function save(label:String) :void 
		{
			gameInfos.data[label] = SaveVars[label];
			saveData(gameInfos);
		}
		
		
		public static function saveData(so:SharedObject) :void 
		{
            var flushStatus:String = null;
            try {
                flushStatus = so.flush(10000);
            } catch (error:Error) {
                
            }
            if (flushStatus != null) {
                switch (flushStatus) {
                    case SharedObjectFlushStatus.PENDING:
                        so.addEventListener(NetStatusEvent.NET_STATUS, onFlushStatus);
                        break;
                    case SharedObjectFlushStatus.FLUSHED:
                        break; 
                }
            }			
		}
		
		
		public static function onFlushStatus(event:NetStatusEvent):void 
		{
            switch (event.info.code) {
                case "SharedObject.Flush.Success":
                    break;
                case "SharedObject.Flush.Failed":
                    break;
            }
			
            gameInfos.removeEventListener(NetStatusEvent.NET_STATUS, onFlushStatus);
			optionsInfos.removeEventListener(NetStatusEvent.NET_STATUS, onFlushStatus);
        }		
		
	}

}
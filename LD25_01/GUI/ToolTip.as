package GUI
{
    import fl.transitions.*;
    import fl.transitions.easing.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import flash.utils.*;

    public class ToolTip extends MovieClip
    {
        public var _txt:TextField;
        public var tip:MovieClip;
        public var box:MovieClip;
		public static var objHeight:Number;
        private static var _showing:Boolean = false;
        private static const MOUSE_OFFSET:Number = 20;
        private static const SHOW_TIME:Number = 0.25;
        private static var _alphaTween:Tween;
        private static var _remInt:uint;
        private static var instance:ToolTip;
        private static const TEXT_WIDTH:Number = 175;
        private static const BOX_RADIUS:Number = 5;
        private static var _stg:Stage;
        private static const HIDE_TIME:Number = 0.15;
        private static const EDGE_PADDING:Number = 5;
        private static const PADDING:Number = 6;
        private static var _init:Boolean = false;
        private static const TWEEN_FUNC:Function = Regular.easeOut;
        private static const MOUSE_UNDER:Number = 35;

        public function ToolTip() : void
        {
            alpha = 0;
            mouseEnabled = false;
            mouseChildren = false;
            return;
        }// end function

        private function mouseMoveHandler(event:MouseEvent) : void
        {
            this.x = _stg.mouseX;
            this.y = _stg.mouseY;
            this.arrange();
            if (event)
            {
                event.updateAfterEvent();
            }
            return;
        }// end function

        private function arrange() : void
        {
            var stageWidth  :Number = NaN; // _loc_1
            var stageHeight :Number = NaN; // _loc_2
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_5:Rectangle = null;
			
            stageWidth  = _stg.stageWidth;
            stageHeight = _stg.stageHeight;
            box.x = 0;
            box.y = MOUSE_OFFSET;
            if (this.x < box.width / 2 + EDGE_PADDING)
            {
                _loc_3 = box.width / 2 - this.x + EDGE_PADDING;
                _loc_4 = box.width / 2 - BOX_RADIUS - tip.width / 2;
                if (_loc_3 > _loc_4)
                {
                    _loc_3 = _loc_4;
                    this.x = this.x - (this.x - BOX_RADIUS - tip.width / 2 - EDGE_PADDING);
                }
                box.x = _loc_3 >> 0;
            }
            else if (this.x > stageWidth - box.width / 2 - EDGE_PADDING)
            {
                _loc_3 = (-box.width) / 2 + stageWidth - this.x - EDGE_PADDING;
                _loc_4 = box.width / 2 - BOX_RADIUS - tip.width / 2;
                if (_loc_3 < -_loc_4)
                {
                    _loc_3 = -_loc_4;
                    this.x = this.x - (this.x - stageWidth + BOX_RADIUS + tip.width / 2 + EDGE_PADDING);
                }
                box.x = _loc_3 >> 0;
            }
            else
            {
                box.x = 0;
            }
            if (this.y < box.height + MOUSE_OFFSET + EDGE_PADDING)
            {
                box.y = box.height + MOUSE_UNDER + objHeight;
                tip.rotation = 180;
                tip.y = box.y - box.height + (box.height * 0.035); //(box.y - box.height >> 0) + 1;
            }
            else
            {
                box.y = -MOUSE_OFFSET;
                tip.rotation = 0;
                tip.y = box.y >> 0;
            }
            this.x = this.x >> 0;
            this.y = this.y >> 0;
            _loc_5 = box.getBounds(instance);
            _txt.x = _loc_5.x + PADDING;
            _txt.y = _loc_5.y + PADDING;
            this.setChildIndex(tip, (numChildren - 1));
            return;
        }// end function

        public static function hide() : void
        {
            if (!_showing)
            {
                return;
            }
            _showing = false;
            _stg.removeEventListener(MouseEvent.MOUSE_MOVE, instance.mouseMoveHandler);
            _remInt = setTimeout(_stg.removeChild, instance.alpha * HIDE_TIME * 1000, instance);
            if (_alphaTween && _alphaTween.isPlaying)
            {
                _alphaTween.stop();
            }
            _alphaTween = new Tween(instance, "alpha", TWEEN_FUNC, instance.alpha, 0, instance.alpha * HIDE_TIME, true);
            _alphaTween.start();
            return;
        }// end function

        public static function initialize(param1:Stage, param2:String = "") : void
        {
            var _loc_3:StyleSheet = null;
            if (!_init)
            {
                instance = new ToolTip;
            }
            _init = true;
            _stg = param1;
            _stg.align = "TL";
            _stg.scaleMode = "noScale";
            _loc_3 = new StyleSheet();
            _loc_3.parseCSS(param2);
            instance._txt.styleSheet = _loc_3;
            return;
        }// end function

        public static function show(param1:String, param2:Number = NaN, param3:Number = NaN, objHeight_var:Number = NaN, texteWidth_var:Number = 175) : void
        {
            if (_showing)
            {
                hide();
            }
			objHeight = objHeight_var;
            _showing = true;
            instance._txt.autoSize = "left";
            instance._txt.width = texteWidth_var; //TEXT_WIDTH;
            instance._txt.htmlText = param1;
            instance.box.width = instance._txt.width + PADDING * 2;
            instance.box.height = instance._txt.height + PADDING * 2;
            instance.x = isNaN(param2) ? (_stg.mouseX) : (param2);
            instance.y = isNaN(param3) ? (_stg.mouseY) : (param3);
            if (isNaN(param2) && isNaN(param3))
            {
                _stg.addEventListener(MouseEvent.MOUSE_MOVE, instance.mouseMoveHandler);
                instance.mouseMoveHandler(null);
            }
            else
            {
                instance.arrange();
            }
            _stg.addChild(instance);
            clearTimeout(_remInt);
            if (_alphaTween && _alphaTween.isPlaying)
            {
                _alphaTween.stop();
            }
            _alphaTween = new Tween(instance, "alpha", TWEEN_FUNC, instance.alpha, 1, (1 - instance.alpha) * SHOW_TIME, true);
            _alphaTween.start();
            return;
        }// end function

    }
}

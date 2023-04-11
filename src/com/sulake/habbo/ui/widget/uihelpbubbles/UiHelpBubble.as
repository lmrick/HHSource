package com.sulake.habbo.ui.widget.uihelpbubbles
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.components.class_3349;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class UiHelpBubble
   {
       
      
      private var _window:class_3151;
      
      private var var_1429:com.sulake.habbo.ui.widget.uihelpbubbles.UiHelpBubblesWidget;
      
      private var var_247:String;
      
      private var var_668:Point;
      
      private var var_4133:String;
      
      private var var_3400:Boolean;
      
      private var _bubble:class_3349;
      
      private var _nextButton:class_3140;
      
      private var var_1603:class_3151;
      
      private var var_4211:Boolean;
      
      private var var_3024:class_3282;
      
      private var var_3307:class_3127;
      
      private var var_4197:class_3127;
      
      private var var_1824:Function;
      
      public function UiHelpBubble(param1:com.sulake.habbo.ui.widget.uihelpbubbles.UiHelpBubblesWidget, param2:HelpBubbleItem, param3:Boolean)
      {
         super();
         var_1429 = param1;
         var_247 = param2.name;
         var_4133 = param2.text;
         var_3400 = param3;
         var_4211 = param2.modal;
         createWindow();
      }
      
      public function dispose() : void
      {
         var_1429 = null;
         if(var_3307 != null && var_1824 != null)
         {
            var_3307.removeEventListener("WME_CLICK",var_1824);
         }
         if(var_1603)
         {
            var_1603.dispose();
            var_1603 = null;
         }
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      private function addMouseClickListener(param1:class_3127, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.setParamFlag(1,true);
            param1.addEventListener("WME_CLICK",param2);
         }
      }
      
      private function createWindow() : void
      {
         var _loc4_:XmlAsset = null;
         var _loc1_:int = 0;
         if(!var_1429 || true || true)
         {
            return;
         }
         if(var_4211)
         {
            _loc4_ = var_1429.assets.getAssetByName("ui_help_modal") as XmlAsset;
            var_1603 = var_1429.windowManager.buildFromXML(_loc4_.content as XML,3) as class_3151;
         }
         if(var_1603)
         {
            var_1603.width = var_1603.desktop.width;
            var_1603.height = var_1603.desktop.height;
            var_3024 = var_1603.findChildByName("bitmap") as class_3282;
            addMouseClickListener(var_3024,onActivateBubble);
         }
         var _loc2_:XmlAsset = var_1429.assets.getAssetByName("ui_help_bubble") as XmlAsset;
         if(!_loc2_)
         {
            return;
         }
         _window = var_1429.windowManager.buildFromXML(_loc2_.content as XML,3) as class_3151;
         if(!_window)
         {
            return;
         }
         _nextButton = _window.findChildByName("help_bubble_btn_ok") as class_3140;
         _bubble = _window.findChildByName("bubble") as class_3349;
         var _loc3_:ITextWindow = _window.findChildByName("help_bubble_text") as ITextWindow;
         if(_loc3_)
         {
            _loc3_.text = var_4133;
            _loc1_ = _loc3_.textHeight;
            _window.height = _loc1_ + 90;
            _nextButton.y = _loc1_ + 30;
         }
         if(!var_3400)
         {
            _nextButton.caption = var_1429.localizations.getLocalization("alert.close.button","alert.close.button");
            addMouseClickListener(_nextButton,onLastBubble);
         }
         else
         {
            addMouseClickListener(_nextButton,onNext);
         }
         _window.visible = true;
      }
      
      public function show() : void
      {
         if(_window != null)
         {
            _window.visible = true;
            _window.activate();
         }
      }
      
      private function onActivateBubble(param1:WindowMouseEvent) : void
      {
         var_1603.deactivate();
         _window.activate();
      }
      
      private function onNext(param1:WindowMouseEvent) : void
      {
         if(!var_1429)
         {
            return;
         }
         if(var_1603)
         {
            var_1603.visible = false;
         }
         var_1429.removeHelpBubble(var_247);
      }
      
      private function onLastBubble(param1:WindowMouseEvent) : void
      {
         if(!var_1429)
         {
            return;
         }
         var_1429.sendScriptProceedMessage();
         if(var_1603)
         {
            var_1603.visible = false;
         }
         var_1429.removeHelpBubble(var_247);
      }
      
      public function setModal(param1:Rectangle) : void
      {
         if(!var_3024)
         {
            return;
         }
         var _loc3_:BitmapData = new BitmapData(var_1603.width,var_1603.height,true,4292870144);
         var _loc2_:BitmapData = new BitmapData(param1.width,param1.height,true,16777215);
         _loc3_.copyPixels(_loc2_,_loc2_.rect,new Point(param1.x,param1.y));
         var_3024.bitmap = _loc3_;
         var_3024.invalidate();
      }
      
      public function setPosition(param1:Point) : void
      {
         var_668 = param1;
         _window.y = var_668.y;
         _window.x = 0 - 0;
      }
      
      public function setArrowPos(param1:String, param2:int) : void
      {
         _bubble.direction = param1;
         _bubble.pointerOffset = param2 - 8;
      }
      
      public function setCallback(param1:class_3127) : void
      {
         if(var_1824 != null)
         {
            return;
         }
         var_3307 = param1;
         if(!var_3400)
         {
            var_1824 = onLastBubble;
         }
         else
         {
            var_1824 = onNext;
         }
         var_3307.addEventListener("WME_CLICK",var_1824);
      }
      
      public function setChatFieldCallback(param1:ITextFieldWindow) : void
      {
         if(var_1824 != null)
         {
            return;
         }
         var_4197 = param1;
         if(!var_3400)
         {
            var_1824 = onLastBubble;
         }
         else
         {
            var_1824 = onNext;
         }
         var_4197.addEventListener("WME_CLICK",var_1824);
      }
      
      public function getWindow() : class_3151
      {
         return _window;
      }
      
      public function getName() : String
      {
         return var_247;
      }
   }
}

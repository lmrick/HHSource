package com.sulake.habbo.navigator
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.geom.Point;
   import package_11.class_1569;
   import package_22.class_316;
   
   public class GuestRoomDoorbell
   {
       
      
      private var _navigator:com.sulake.habbo.navigator.class_1686;
      
      private var _window:class_3281;
      
      private var var_2640:class_1569;
      
      private var var_3605:Boolean;
      
      public function GuestRoomDoorbell(param1:com.sulake.habbo.navigator.class_1686)
      {
         super();
         _navigator = param1;
      }
      
      public function show(param1:class_1569, param2:Point = null, param3:Boolean = false) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_2640 = param1;
         var_3605 = param3;
         createWindow();
         if(_window == null)
         {
            return;
         }
         if(param2 != null)
         {
            param2.offset(0,0);
            _window.setGlobalPosition(param2);
         }
         _window.visible = true;
         _window.activate();
         var _loc4_:ITextWindow;
         if((_loc4_ = _window.findChildByName("room_name") as ITextWindow) != null)
         {
            _loc4_.text = param1.roomName;
         }
         if(var_3605)
         {
            setText("info","${navigator.doorbell.waiting}");
            setText("cancel","${navigator.doorbell.button.cancel.entering}");
            showButton("ring",false);
         }
         else
         {
            setText("info","${navigator.doorbell.info}");
            setText("cancel","${generic.cancel}");
            showButton("ring",true);
         }
      }
      
      public function showWaiting() : void
      {
         show(var_2640,null,true);
      }
      
      public function showNoAnswer() : void
      {
         if(_window == null)
         {
            return;
         }
         _window.visible = true;
         _window.activate();
         setText("info","${navigator.doorbell.no.answer}");
         showButton("ring",false);
      }
      
      private function showButton(param1:String, param2:Boolean) : void
      {
         var _loc3_:class_3140 = _window.findChildByName(param1) as class_3140;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.visible = param2;
      }
      
      private function createWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         var _loc2_:XmlAsset = _navigator.assets.getAssetByName("doorbell_xml") as XmlAsset;
         _window = _navigator.windowManager.buildFromXML(_loc2_.content as XML,2) as class_3281;
         if(_window == null)
         {
            return;
         }
         var _loc4_:class_3140;
         if((_loc4_ = _window.findChildByName("ring") as class_3140) != null)
         {
            _loc4_.addEventListener("WME_CLICK",ringDoorbell);
         }
         var _loc3_:class_3127 = _window.findChildByName("cancel_region");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener("WME_CLICK",close);
         }
         var _loc1_:class_3127 = _window.findChildByTag("close");
         if(_loc1_ != null)
         {
            _loc1_.addEventListener("WME_CLICK",close);
         }
      }
      
      private function setText(param1:String, param2:String) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc3_:class_3127 = _window.findChildByName(param1);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.caption = param2;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
         }
         _window = null;
         _navigator = null;
         var_2640 = null;
      }
      
      private function ringDoorbell(param1:WindowMouseEvent) : void
      {
         _navigator.goToRoom(var_2640.flatId,true);
         hide();
      }
      
      private function close(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(var_3605 && _navigator != null)
         {
            _navigator.send(new class_316());
         }
         _window.dispose();
         _window = null;
      }
      
      public function hide() : void
      {
         if(_window == null)
         {
            return;
         }
         _window.visible = false;
      }
   }
}

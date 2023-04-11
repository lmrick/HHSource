package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import flash.events.Event;
   import package_79.class_1554;
   
   public class MuteUser extends DefaultActionType
   {
       
      
      private var _roomEvents:HabboUserDefinedRoomEvents;
      
      private var var_2627:SliderWindowController;
      
      public function MuteUser()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.MUTE_USER;
      }
      
      override public function readStringParamFromForm(param1:class_3151) : String
      {
         return String(getMessage(param1).text);
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(var_2627.getValue());
         return _loc2_;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         getMessage(param1).text = param2.stringParam;
         var _loc3_:int = int(param2.intParams[0]);
         var_2627.setValue(_loc3_);
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getMessage(param1:class_3151) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName("chat_message"));
      }
      
      override public function validate(param1:class_3151, param2:HabboUserDefinedRoomEvents) : String
      {
         var _loc4_:String = null;
         if(getMessage(param1).text.length > 100)
         {
            _loc4_ = "wiredfurni.chatmsgtoolong";
            return param2.localization.getLocalization(_loc4_,_loc4_);
         }
         return null;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         _roomEvents = param2;
         var_2627 = new SliderWindowController(param2,getSlider(param1),param2.assets,0,10,1);
         var_2627.setValue(1);
         var_2627.addEventListener("change",onSliderChange);
      }
      
      private function getSlider(param1:class_3151) : class_3151
      {
         return param1.findChildByName("slider_container") as class_3151;
      }
      
      protected function onSliderChange(param1:Event) : void
      {
         var _loc2_:SliderWindowController = null;
         var _loc4_:Number = NaN;
         var _loc3_:String = null;
         if(param1.type == "change")
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc3_ = (int(_loc4_ = _loc2_.getValue())).toString();
               _roomEvents.localization.registerParameter("wiredfurni.params.length.minutes","minutes",_loc3_);
            }
         }
      }
      
      protected function get roomEvents() : HabboUserDefinedRoomEvents
      {
         return _roomEvents;
      }
      
      public function get slider() : SliderWindowController
      {
         return var_2627;
      }
   }
}

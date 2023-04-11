package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.navigator.TextFieldManager;
   import com.sulake.habbo.navigator.class_1686;
   import package_11.class_1573;
   import package_124.class_1051;
   import package_2.class_138;
   import package_2.class_880;
   import package_84.class_337;
   
   public class RoomEventViewCtrl implements class_13
   {
       
      
      private var _navigator:class_1686;
      
      private var _window:class_3281;
      
      private var var_1976:TextFieldManager;
      
      private var var_2080:TextFieldManager;
      
      public function RoomEventViewCtrl(param1:class_1686)
      {
         super();
         _navigator = param1;
      }
      
      public function dispose() : void
      {
         _navigator = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         var_1976 = null;
         var_2080 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _navigator == null;
      }
      
      public function show() : void
      {
         if(_window != null && false)
         {
            _window.visible = false;
            return;
         }
         prepareWindow();
         clearErrors();
         var _loc1_:class_1573 = _navigator.data.roomEventData;
         if(_loc1_ == null)
         {
            createEvent();
         }
         else
         {
            editEvent(_loc1_);
         }
         _window.visible = true;
         _window.activate();
      }
      
      private function editEvent(param1:class_1573) : void
      {
         _window.caption = _navigator.getText("navigator.eventsettings.editcaption");
         var_1976.setText(param1.eventName);
         var_2080.setText(param1.eventDescription);
      }
      
      private function createEvent() : void
      {
         _window.caption = _navigator.getText("navigator.createevent");
         var_2080.goBackToInitialState();
         var_1976.goBackToInitialState();
      }
      
      private function getInput(param1:String) : ITextFieldWindow
      {
         return ITextFieldWindow(_window.findChildByName(param1));
      }
      
      private function onClose(param1:class_3134) : void
      {
         close();
      }
      
      private function save() : void
      {
         var _loc1_:int = _navigator.data.roomEventData.adId;
         var _loc3_:String = var_1976.getText();
         var _loc2_:String = var_2080.getText();
         if(!isMandatoryFieldsFilled())
         {
            return;
         }
         _navigator.send(new class_138(_loc1_,_loc3_,_loc2_));
      }
      
      private function onEndButtonClick(param1:class_3134) : void
      {
         _navigator.send(new class_880(_navigator.data.roomEventData.adId));
         close();
      }
      
      private function onCancelButtonClick(param1:class_3134) : void
      {
         close();
      }
      
      private function onUnfocus(param1:class_3134) : void
      {
         if(_navigator.data.roomEventData != null)
         {
            save();
         }
      }
      
      private function onRoomAdError(param1:class_337) : void
      {
         this.clearErrors();
         var _loc2_:class_1051 = param1.getParser();
         var _loc3_:int = _loc2_.errorCode;
         if(_loc3_ == 0)
         {
            var_1976.displayError(_navigator.getText("roomad.error.0.description"));
            var_1976.setText(_loc2_.filteredText);
         }
         else if(_loc3_ == 1)
         {
            var_2080.displayError(_navigator.getText("roomad.error.0.description"));
            var_2080.setText(_loc2_.filteredText);
         }
      }
      
      private function isMandatoryFieldsFilled() : Boolean
      {
         this.clearErrors();
         if(!var_1976.checkMandatory(_navigator.getText("navigator.eventsettings.nameerr")))
         {
            return false;
         }
         return true;
      }
      
      private function clearErrors() : void
      {
         var_1976.clearErrors();
         var_2080.clearErrors();
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = class_3281(_navigator.getXmlWindow("iro_event_settings"));
         addMouseClickListener(_window.findChildByTag("close"),onClose);
         var_1976 = new TextFieldManager(_navigator,getInput("event_name"),25);
         var_2080 = new TextFieldManager(_navigator,getInput("event_desc"),100);
         var_1976.input.addEventListener("WE_UNFOCUSED",onUnfocus);
         var_2080.input.addEventListener("WE_UNFOCUSED",onUnfocus);
         _navigator.communication.addHabboConnectionMessageEvent(new class_337(onRoomAdError));
         _window.center();
      }
      
      private function addMouseClickListener(param1:class_3127, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener("WME_CLICK",param2);
         }
      }
      
      private function find(param1:String) : class_3127
      {
         var _loc2_:class_3127 = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function prepareEventTypes() : void
      {
         var _loc2_:int = 0;
         var _loc4_:String = null;
         var _loc1_:String = null;
         var _loc3_:* = [];
         _loc2_ = 1;
         while(_loc2_ < 100)
         {
            _loc4_ = "roomevent_type_" + _loc2_;
            _loc1_ = _navigator.getText(_loc4_);
            if(_loc1_ == null || _loc1_ == _loc4_)
            {
               break;
            }
            _loc3_.push(_loc1_);
            _loc2_++;
         }
      }
      
      public function close() : void
      {
         if(_window != null)
         {
            _window.visible = false;
         }
      }
   }
}

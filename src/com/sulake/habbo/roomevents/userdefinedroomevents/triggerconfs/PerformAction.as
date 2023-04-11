package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.components.class_3287;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.WiredUserAction;
   import package_79.class_1554;
   
   public class PerformAction extends DefaultTriggerConf
   {
       
      
      private var _cont:class_3151;
      
      public function PerformAction()
      {
         super();
      }
      
      private static function getActionByCode(param1:int) : WiredUserAction
      {
         var _loc3_:int = 0;
         var _loc4_:WiredUserAction = null;
         var _loc2_:Vector.<WiredUserAction> = WiredUserAction.const_414;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_];
            if(param1 == _loc4_.code)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      private static function getExtraUsageCheckbox(param1:class_3151) : class_3176
      {
         return class_3176(param1.findChildByName("usage_checkbox"));
      }
      
      private static function getExtraMenu(param1:class_3151) : class_3287
      {
         return class_3287(param1.findChildByName("extra_menu"));
      }
      
      private static function getSelectedCode(param1:class_3287) : int
      {
         var _loc3_:Array = param1.enumerateSelection();
         var _loc2_:int = param1.selection;
         if(_loc2_ == -1)
         {
            return -1;
         }
         return getCodeFromLoc(_loc3_[_loc2_]);
      }
      
      private static function setSelectedByCode(param1:class_3287, param2:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:Array = param1.enumerateSelection();
         var _loc5_:* = -1;
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(getCodeFromLoc(_loc3_[_loc4_]) == param2)
            {
               _loc5_ = _loc4_;
            }
            _loc4_++;
         }
         param1.selection = _loc5_;
      }
      
      private static function getCodeFromLoc(param1:String) : int
      {
         var _loc2_:Array = param1.substr(0,param1.length - 1).split(".");
         var _loc3_:String = String(_loc2_[_loc2_.length - 1]);
         return parseInt(_loc3_);
      }
      
      override public function get code() : int
      {
         return class_3431.var_4331;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         var allActions:Vector.<WiredUserAction>;
         var i:int;
         var action:WiredUserAction;
         var container:class_3151;
         var cont:class_3151 = param1;
         var roomEvents:HabboUserDefinedRoomEvents = param2;
         _cont = cont;
         var menu:class_3287 = getActionMenu();
         menu.addEventListener("WE_SELECTED",onSelectAction);
         allActions = WiredUserAction.const_414;
         i = 0;
         while(i < allActions.length)
         {
            action = allActions[i];
            if(false)
            {
               container = getSubContainer(action.name);
               (function(param1:int):void
               {
                  var code:int = param1;
                  getExtraUsageCheckbox(container).addEventListener("WE_SELECT",function(param1:class_3134):void
                  {
                     setExtraUsage(code,true);
                  });
               })(action.code);
               (function(param1:int):void
               {
                  var code:int = param1;
                  getExtraUsageCheckbox(container).addEventListener("WE_UNSELECT",function(param1:class_3134):void
                  {
                     setExtraUsage(code,false);
                  });
               })(action.code);
            }
            i++;
         }
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         setSelectedByCode(getActionMenu(),param2.intParams[0]);
         initializeExtraMenu(param2.stringParam);
      }
      
      override public function readStringParamFromForm(param1:class_3151) : String
      {
         var _loc3_:int = 0;
         var _loc4_:WiredUserAction = getSelectedAction();
         var _loc2_:class_3151 = getSubContainer(_loc4_.name);
         if(_loc4_.hasExtra && Boolean(getExtraUsageCheckbox(_loc2_).isSelected))
         {
            _loc3_ = getSelectedCode(getExtraMenu(_loc2_));
            if(_loc3_ == -1)
            {
               return "";
            }
            return _loc4_.convertCodeToExtraString(_loc3_);
         }
         return "";
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         var _loc3_:WiredUserAction = getSelectedAction();
         _loc2_.push(_loc3_.code);
         return _loc2_;
      }
      
      private function onSelectAction(param1:class_3134) : void
      {
         initializeExtraMenu();
      }
      
      private function setExtraUsage(param1:int, param2:Boolean) : void
      {
         var _loc4_:WiredUserAction = getActionByCode(param1);
         var _loc3_:class_3151 = getSubContainer(_loc4_.name);
         var _loc5_:class_3287;
         (_loc5_ = getExtraMenu(_loc3_)).visible = param2;
      }
      
      private function initializeExtraMenu(param1:String = "") : void
      {
         var _loc6_:int = 0;
         var _loc7_:WiredUserAction = null;
         var _loc2_:class_3151 = null;
         var _loc8_:class_3287 = null;
         var _loc5_:class_3176 = null;
         var _loc3_:int = getSelectedCode(getActionMenu());
         var _loc4_:Vector.<WiredUserAction> = WiredUserAction.const_414;
         _loc6_ = 0;
         while(_loc6_ < _loc4_.length)
         {
            if((_loc7_ = _loc4_[_loc6_]).hasExtra)
            {
               _loc2_ = getSubContainer(_loc7_.name);
               _loc2_.visible = _loc3_ == _loc7_.code;
               if(_loc3_ == _loc7_.code)
               {
                  _loc8_ = getExtraMenu(_loc2_);
                  _loc5_ = getExtraUsageCheckbox(_loc2_);
                  if(param1 == "")
                  {
                     _loc5_.unselect();
                     _loc8_.selection = -1;
                     _loc8_.visible = false;
                  }
                  else
                  {
                     _loc5_.select();
                     setSelectedByCode(_loc8_,_loc7_.convertExtraStringToCode(param1));
                     _loc8_.visible = true;
                  }
               }
            }
            _loc6_++;
         }
      }
      
      private function getSelectedAction() : WiredUserAction
      {
         var _loc1_:int = getSelectedCode(getActionMenu());
         return getActionByCode(_loc1_);
      }
      
      private function getActionMenu() : class_3287
      {
         return class_3287(_cont.findChildByName("menu_action"));
      }
      
      private function getSubContainer(param1:String) : class_3151
      {
         var _loc2_:String = param1 + "_selection";
         return _cont.getChildByName(_loc2_) as class_3151;
      }
   }
}

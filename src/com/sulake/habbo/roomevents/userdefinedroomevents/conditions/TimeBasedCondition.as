package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.components.class_3287;
   import com.sulake.habbo.room.class_1680;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.Util;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.ChronoFieldMaskFilter;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.ChronoFieldRangeFilter;
   import package_79.class_1554;
   
   public class TimeBasedCondition extends DefaultConditionType
   {
       
      
      private var _cont:class_3151;
      
      private var var_1460:HabboUserDefinedRoomEvents;
      
      private var var_3937:String = "";
      
      public function TimeBasedCondition()
      {
         super();
      }
      
      private static function getSelector(param1:class_3151) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("selector"));
      }
      
      private static function getSkipRadio(param1:class_3151) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("skip_radio"));
      }
      
      private static function getExactRadio(param1:class_3151) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("exact_radio"));
      }
      
      private static function getRangeRadio(param1:class_3151) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("range_radio"));
      }
      
      private static function getExactInput(param1:class_3151) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName("exact_input"));
      }
      
      private static function getRangeInputMin(param1:class_3151) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName("range_min_input"));
      }
      
      private static function getRangeInputMax(param1:class_3151) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName("range_max_input"));
      }
      
      private static function getIntFromInput(param1:ITextFieldWindow, param2:int) : int
      {
         var _loc3_:String = String(param1.text);
         if(isNaN(Number(_loc3_)))
         {
            return param2;
         }
         return int(_loc3_);
      }
      
      private static function getCheckbox(param1:class_3151, param2:int) : class_3176
      {
         return class_3176(param1.findChildByName("checkbox_" + param2));
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         var_1460 = param2;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         _cont = param1;
         var _loc3_:String = param2.stringParam == "" ? var_3937 : param2.stringParam;
         populateTimezones(_loc3_,var_1460.roomEngine as class_1680);
         getSubContainer("timezone").visible = getTimezoneMenu().numMenuItems > 1;
         _cont.height = Util.getLowestPoint(_cont) + 1;
      }
      
      private function populateTimezones(param1:String, param2:class_19) : void
      {
         var _loc7_:int = 0;
         var _loc6_:String = null;
         var _loc4_:class_3287 = getTimezoneMenu();
         var _loc5_:String;
         var _loc3_:Array = (_loc5_ = String(param2.getProperty("wired.timezones"))) == null || _loc5_ == "" ? ["UTC"] : _loc5_.split(",");
         var _loc8_:Vector.<String> = new Vector.<String>();
         if(param1 != "")
         {
            _loc8_.push(param1);
         }
         _loc7_ = 0;
         while(_loc7_ < _loc3_.length)
         {
            if((_loc6_ = String(_loc3_[_loc7_])) != param1)
            {
               _loc8_.push(_loc6_);
            }
            _loc7_++;
         }
         _loc4_.populateWithVector(_loc8_);
         if(_loc8_.length > 0)
         {
            _loc4_.selection = 0;
         }
      }
      
      override public function readStringParamFromForm(param1:class_3151) : String
      {
         var _loc3_:class_3287 = getTimezoneMenu();
         var _loc2_:int = _loc3_.selection;
         if(_loc2_ == -1)
         {
            return "";
         }
         return var_3937 = String(_loc3_.enumerateSelection()[_loc2_]);
      }
      
      private function getSubContainer(param1:String) : class_3151
      {
         var _loc2_:String = param1 + "_selection";
         return _cont.getChildByName(_loc2_) as class_3151;
      }
      
      protected function initializeRangeFilter(param1:ChronoFieldRangeFilter) : void
      {
         var _loc4_:IRadioButtonWindow = null;
         var _loc6_:IRadioButtonWindow = null;
         var _loc9_:IRadioButtonWindow = null;
         var _loc2_:class_3151 = getSubContainer(param1.name);
         var _loc8_:ISelectorWindow = getSelector(_loc2_);
         var _loc7_:ITextFieldWindow = getExactInput(_loc2_);
         var _loc5_:ITextFieldWindow = getRangeInputMin(_loc2_);
         var _loc3_:ITextFieldWindow = getRangeInputMax(_loc2_);
         if(!param1.useFilter)
         {
            _loc4_ = getSkipRadio(_loc2_);
            _loc8_.setSelected(_loc4_);
            _loc7_.text = param1.defaultValue.toString();
            _loc5_.text = param1.defaultValue.toString();
            _loc3_.text = param1.defaultValue.toString();
         }
         else if(param1.min == param1.max)
         {
            _loc6_ = getExactRadio(_loc2_);
            _loc8_.setSelected(_loc6_);
            _loc7_.text = param1.min.toString();
            _loc5_.text = param1.defaultValue.toString();
            _loc3_.text = param1.defaultValue.toString();
         }
         else
         {
            _loc9_ = getRangeRadio(_loc2_);
            _loc8_.setSelected(_loc9_);
            _loc7_.text = param1.defaultValue.toString();
            _loc5_.text = param1.min.toString();
            _loc3_.text = param1.max.toString();
         }
      }
      
      protected function initializeMaskFilter(param1:ChronoFieldMaskFilter) : void
      {
         var _loc4_:int = 0;
         var _loc3_:class_3176 = null;
         var _loc2_:class_3151 = getSubContainer(param1.name);
         var _loc5_:int = param1.mask;
         _loc4_ = 0;
         while(_loc4_ < param1.amount)
         {
            _loc3_ = getCheckbox(_loc2_,_loc4_);
            if((_loc5_ & 1 << _loc4_) != 0)
            {
               _loc3_.select();
            }
            else
            {
               _loc3_.unselect();
            }
            _loc4_++;
         }
      }
      
      protected function readRangeFilter(param1:String, param2:int = 0) : ChronoFieldRangeFilter
      {
         var _loc8_:ITextFieldWindow = null;
         var _loc9_:int = 0;
         var _loc7_:ITextFieldWindow = null;
         var _loc5_:ITextFieldWindow = null;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:class_3151 = getSubContainer(param1);
         var _loc10_:ISelectorWindow;
         if((_loc10_ = getSelector(_loc3_)).getSelected() == getSkipRadio(_loc3_))
         {
            return new ChronoFieldRangeFilter(param1,false,param2,param2,param2);
         }
         if(_loc10_.getSelected() == getExactRadio(_loc3_))
         {
            _loc8_ = getExactInput(_loc3_);
            _loc9_ = getIntFromInput(_loc8_,param2);
            return new ChronoFieldRangeFilter(param1,true,_loc9_,_loc9_,param2);
         }
         _loc7_ = getRangeInputMin(_loc3_);
         _loc5_ = getRangeInputMax(_loc3_);
         _loc4_ = getIntFromInput(_loc7_,param2);
         _loc6_ = getIntFromInput(_loc5_,param2);
         return new ChronoFieldRangeFilter(param1,true,_loc4_,_loc6_,param2);
      }
      
      protected function readMaskFilter(param1:String, param2:int) : ChronoFieldMaskFilter
      {
         var _loc5_:int = 0;
         var _loc4_:class_3176 = null;
         var _loc3_:class_3151 = getSubContainer(param1);
         var _loc6_:* = 0;
         _loc5_ = 0;
         while(_loc5_ < param2)
         {
            if((_loc4_ = getCheckbox(_loc3_,_loc5_)).isSelected)
            {
               _loc6_ |= 1 << _loc5_;
            }
            _loc5_++;
         }
         return new ChronoFieldMaskFilter(param1,_loc6_,param2);
      }
      
      private function getTimezoneMenu() : class_3287
      {
         return class_3287(_cont.findChildByName("menu_timezone"));
      }
   }
}

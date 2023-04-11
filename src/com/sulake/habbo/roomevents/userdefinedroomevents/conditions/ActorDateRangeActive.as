package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextFieldWindow;
   import flash.globalization.DateTimeFormatter;
   import package_79.class_1554;
   
   public class class_3433 extends DefaultConditionType
   {
       
      
      public function class_3433()
      {
         super();
      }
      
      private static function getDate(param1:class_3151, param2:String) : Number
      {
         return Date.parse(ITextFieldWindow(param1.findChildByName(param2)).text);
      }
      
      override public function get code() : int
      {
         return class_3523.DATE_RANGE_ACTIVE;
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc3_:Number = NaN;
         var _loc2_:* = [];
         var _loc4_:Number = getDate(param1,"start_date");
         if(!isNaN(_loc4_))
         {
            _loc2_.push(int(_loc4_ / 1000));
            _loc3_ = getDate(param1,"end_date");
            if(!isNaN(_loc3_))
            {
               _loc2_.push(int(_loc3_ / 1000));
            }
         }
         return _loc2_;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc5_:Date = null;
         var _loc3_:Date = null;
         var _loc4_:DateTimeFormatter;
         (_loc4_ = new DateTimeFormatter("en-US")).setDateTimePattern("yyyy/MM/dd HH:mm");
         if(param2.intParams.length > 0)
         {
            _loc5_ = new Date(param2.intParams[0] * 1000);
            ITextFieldWindow(param1.findChildByName("start_date")).text = _loc4_.format(_loc5_);
         }
         else
         {
            ITextFieldWindow(param1.findChildByName("start_date")).text = "";
         }
         if(param2.intParams.length > 1)
         {
            _loc3_ = new Date(param2.intParams[1] * 1000);
            ITextFieldWindow(param1.findChildByName("end_date")).text = _loc4_.format(_loc3_);
         }
         else
         {
            ITextFieldWindow(param1.findChildByName("end_date")).text = "";
         }
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
   }
}

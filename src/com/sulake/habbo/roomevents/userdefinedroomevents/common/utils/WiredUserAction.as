package com.sulake.habbo.roomevents.userdefinedroomevents.common.utils
{
   public class WiredUserAction
   {
      
      public static const const_414:Vector.<com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.WiredUserAction> = new <com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.WiredUserAction>[new com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.WiredUserAction("wave",0),new com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.WiredUserAction("blow",1),new com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.WiredUserAction("laugh",2),new com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.WiredUserAction("respect",3),new com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.WiredUserAction("awake",4),new com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.WiredUserAction("sleep",5),new com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.WiredUserAction("sit",6),new com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.WiredUserAction("stand",7),new com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.WiredUserAction("lay",8),new com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.WiredUserAction("sign",10,true,function(param1:int):String
      {
         return param1.toString();
      },function(param1:String):int
      {
         return int(param1);
      }),new com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.WiredUserAction("dance",11,true,function(param1:int):String
      {
         return "dance " + param1;
      },function(param1:String):int
      {
         return int(param1.split(" ")[1]);
      })];
       
      
      private var _name:String;
      
      private var var_713:int;
      
      private var var_3819:Boolean;
      
      private var _extraIdToString:Function;
      
      private var var_4102:Function;
      
      public function WiredUserAction(param1:String, param2:int, param3:Boolean = false, param4:Function = null, param5:Function = null)
      {
         super();
         _name = param1;
         var_713 = param2;
         var_3819 = param3;
         _extraIdToString = param4;
         var_4102 = param5;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get code() : int
      {
         return var_713;
      }
      
      public function get hasExtra() : Boolean
      {
         return var_3819;
      }
      
      public function convertCodeToExtraString(param1:int) : String
      {
         return _extraIdToString(param1);
      }
      
      public function convertExtraStringToCode(param1:String) : int
      {
         return var_4102(param1);
      }
   }
}

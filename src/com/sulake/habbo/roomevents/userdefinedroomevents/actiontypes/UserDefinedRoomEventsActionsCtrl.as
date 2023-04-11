package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.habbo.roomevents.userdefinedroomevents.class_3294;
   import com.sulake.habbo.roomevents.userdefinedroomevents.class_3304;
   import package_79.class_1554;
   import package_79.class_1593;
   
   public class ActionTypes implements class_3294
   {
       
      
      private var var_1474:Array;
      
      public function ActionTypes()
      {
         var_1474 = [];
         super();
         this.var_1474.push(new class_3482());
         this.var_1474.push(new Reset());
         this.var_1474.push(new class_3457());
         this.var_1474.push(new class_3477());
         this.var_1474.push(new GiveScore());
         this.var_1474.push(new class_3474());
         this.var_1474.push(new class_3472());
         this.var_1474.push(new class_3455());
         this.var_1474.push(new class_3447());
         this.var_1474.push(new class_3503());
         this.var_1474.push(new class_3440());
         this.var_1474.push(new MoveToDirection());
         this.var_1474.push(new class_3424());
         this.var_1474.push(new class_3473());
         this.var_1474.push(new class_3411());
         this.var_1474.push(new class_3461());
         this.var_1474.push(new class_3427());
         this.var_1474.push(new KickFromRoom());
         this.var_1474.push(new class_3501());
         this.var_1474.push(new class_3508());
         this.var_1474.push(new class_3459());
         this.var_1474.push(new class_3487());
         this.var_1474.push(new class_3500());
         this.var_1474.push(new class_3471());
         this.var_1474.push(new class_3436());
         this.var_1474.push(new class_3416());
         this.var_1474.push(new class_3489());
         this.var_1474.push(new class_3493());
         this.var_1474.push(new class_3505());
         this.var_1474.push(new class_3430());
         this.var_1474.push(new class_3488());
         this.var_1474.push(new class_3434());
      }
      
      public function get types() : Array
      {
         return var_1474;
      }
      
      public function getByCode(param1:int) : ActionType
      {
         for each(var _loc2_ in var_1474)
         {
            if(_loc2_.code == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getElementByCode(param1:int) : class_3304
      {
         return getByCode(param1);
      }
      
      public function acceptTriggerable(param1:class_1554) : Boolean
      {
         return param1 as class_1593 != null;
      }
      
      public function getKey() : String
      {
         return "action";
      }
   }
}

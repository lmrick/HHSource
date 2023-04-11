package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
   import com.sulake.habbo.roomevents.userdefinedroomevents.class_3294;
   import com.sulake.habbo.roomevents.userdefinedroomevents.class_3304;
   import package_79.class_1554;
   import package_79.class_1592;
   
   public class TriggerConfs implements class_3294
   {
       
      
      private var var_1546:Array;
      
      public function TriggerConfs()
      {
         var_1546 = [];
         super();
         this.var_1546.push(new class_3465());
         this.var_1546.push(new class_3470());
         this.var_1546.push(new class_3450());
         this.var_1546.push(new class_3306());
         this.var_1546.push(new class_3451());
         this.var_1546.push(new class_3425());
         this.var_1546.push(new AvatarEntersRoom());
         this.var_1546.push(new class_3422());
         this.var_1546.push(new class_3468());
         this.var_1546.push(new ScoreAchieved());
         this.var_1546.push(new class_3432());
         this.var_1546.push(new class_3420());
         this.var_1546.push(new class_3426());
         this.var_1546.push(new class_3449());
         this.var_1546.push(new class_3418());
         this.var_1546.push(new ClockReachTime());
         this.var_1546.push(new PerformAction());
         this.var_1546.push(new class_3485());
         this.var_1546.push(new class_3478());
         this.var_1546.push(new class_3437());
      }
      
      public function get confs() : Array
      {
         return var_1546;
      }
      
      public function getByCode(param1:int) : class_3305
      {
         for each(var _loc2_ in var_1546)
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
         return param1 as class_1592 != null;
      }
      
      public function getKey() : String
      {
         return "trigger";
      }
   }
}

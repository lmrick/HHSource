package com.sulake.habbo.roomevents.userdefinedroomevents.addons
{
   import com.sulake.habbo.roomevents.userdefinedroomevents.class_3294;
   import com.sulake.habbo.roomevents.userdefinedroomevents.class_3304;
   import package_79.class_1554;
   import package_79.class_1635;
   
   public class UserDefinedRoomEventsAddonsCtrl implements class_3294
   {
       
      
      private var var_1474:Array;
      
      public function UserDefinedRoomEventsAddonsCtrl()
      {
         var_1474 = [];
         super();
         this.var_1474.push(new OrConditionEvaluation());
         this.var_1474.push(new PickOneRandomlyPropagation());
         this.var_1474.push(new PickInOrderPropagation());
         this.var_1474.push(new class_3486());
         this.var_1474.push(new NoMoveAnimation());
         this.var_1474.push(new class_3466());
         this.var_1474.push(new CarryUsers());
         this.var_1474.push(new AnimationTime());
      }
      
      public function getElementByCode(param1:int) : class_3304
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
      
      public function getKey() : String
      {
         return "addon";
      }
      
      public function acceptTriggerable(param1:class_1554) : Boolean
      {
         return param1 as class_1635 != null;
      }
   }
}

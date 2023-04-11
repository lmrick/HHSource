package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.habbo.roomevents.userdefinedroomevents.class_3294;
   import com.sulake.habbo.roomevents.userdefinedroomevents.class_3304;
   import package_79.class_1554;
   import package_79.class_1555;
   
   public class UserDefinedRoomEventsConditionsCtrl implements class_3294
   {
       
      
      private var var_1474:Array;
      
      public function UserDefinedRoomEventsConditionsCtrl()
      {
         var_1474 = [];
         super();
         this.var_1474.push(new class_3454());
         this.var_1474.push(new FurnisHaveAvatars());
         this.var_1474.push(new FurnisHaveNoAvatars());
         this.var_1474.push(new class_3481());
         this.var_1474.push(new class_3417());
         this.var_1474.push(new class_3484());
         this.var_1474.push(new class_3475());
         this.var_1474.push(new class_3502());
         this.var_1474.push(new HasStackedFurnis());
         this.var_1474.push(new class_3460());
         this.var_1474.push(new StuffsInFormation());
         this.var_1474.push(new class_3415());
         this.var_1474.push(new class_3435());
         this.var_1474.push(new class_3428());
         this.var_1474.push(new DontHaveStackedFurnis());
         this.var_1474.push(new class_3433());
         this.var_1474.push(new class_3498());
         this.var_1474.push(new class_3499());
         this.var_1474.push(new class_3490());
         this.var_1474.push(new class_3462());
         this.var_1474.push(new class_3423());
         this.var_1474.push(new ActorIsPerformingAction());
         this.var_1474.push(new TeamHasScore());
         this.var_1474.push(new class_3476());
         this.var_1474.push(new class_3494());
         this.var_1474.push(new ActorFacingDirection());
      }
      
      public function get types() : Array
      {
         return var_1474;
      }
      
      public function getByCode(param1:int) : class_3381
      {
         for each(var _loc2_ in var_1474)
         {
            if(_loc2_.code == param1)
            {
               return _loc2_;
            }
            if(_loc2_.negativeCode == param1)
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
         return param1 as class_1555 != null;
      }
      
      public function getKey() : String
      {
         return "condition";
      }
   }
}

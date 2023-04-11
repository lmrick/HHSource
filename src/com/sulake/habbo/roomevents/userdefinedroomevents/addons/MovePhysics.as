package com.sulake.habbo.roomevents.userdefinedroomevents.addons
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3176;
   import package_79.class_1554;
   
   public class MovePhysics extends DefaultAddonType
   {
       
      
      private var _cont:class_3151;
      
      public function MovePhysics()
      {
         super();
      }
      
      private static function getIntState(param1:class_3176) : int
      {
         return !!param1.isSelected ? 1 : 0;
      }
      
      private static function select(param1:class_3176, param2:Boolean) : void
      {
         if(param2)
         {
            param1.select();
         }
         else
         {
            param1.unselect();
         }
      }
      
      override public function get code() : int
      {
         return class_3513.var_4332;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         _cont = param1;
         select(getKeepAltitudeInput(),param2.getBoolean(0));
         select(getMoveThroughFurniCheckbox(),param2.getBoolean(1));
         select(getMoveThroughUsersCheckbox(),param2.getBoolean(2));
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(getIntState(getKeepAltitudeInput()));
         _loc2_.push(getIntState(getMoveThroughFurniCheckbox()));
         _loc2_.push(getIntState(getMoveThroughUsersCheckbox()));
         return _loc2_;
      }
      
      private function getKeepAltitudeInput() : class_3176
      {
         return class_3176(_cont.findChildByName("keep_altitude_checkbox"));
      }
      
      private function getMoveThroughFurniCheckbox() : class_3176
      {
         return class_3176(_cont.findChildByName("move_through_furni_checkbox"));
      }
      
      private function getMoveThroughUsersCheckbox() : class_3176
      {
         return class_3176(_cont.findChildByName("move_through_users_checkbox"));
      }
   }
}

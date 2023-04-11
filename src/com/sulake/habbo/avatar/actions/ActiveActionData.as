package com.sulake.habbo.avatar.actions
{
   public class ActiveActionData implements IActiveActionData
   {
       
      
      private var var_593:String = "";
      
      private var var_649:String = "";
      
      private var _definition:com.sulake.habbo.avatar.actions.IActionDefinition;
      
      private var _startFrame:int = 0;
      
      private var _overridingAction:String;
      
      public function ActiveActionData(param1:String, param2:String = "", param3:int = 0)
      {
         super();
         var_593 = param1;
         var_649 = param2;
         _startFrame = param3;
      }
      
      public function get actionType() : String
      {
         return var_593;
      }
      
      public function get actionParameter() : String
      {
         return var_649;
      }
      
      public function get definition() : com.sulake.habbo.avatar.actions.IActionDefinition
      {
         return _definition;
      }
      
      public function get id() : String
      {
         if(_definition == null)
         {
            return "";
         }
         return "undefined_" + var_649;
      }
      
      public function set actionParameter(param1:String) : void
      {
         var_649 = param1;
      }
      
      public function set definition(param1:com.sulake.habbo.avatar.actions.IActionDefinition) : void
      {
         _definition = param1;
      }
      
      public function dispose() : void
      {
         var_593 = null;
         var_649 = null;
         _definition = null;
      }
      
      public function get startFrame() : int
      {
         return _startFrame;
      }
      
      public function get overridingAction() : String
      {
         return _overridingAction;
      }
      
      public function set overridingAction(param1:String) : void
      {
         _overridingAction = param1;
      }
      
      public function toString() : String
      {
         return "Action: " + var_593 + "  param: " + var_649;
      }
   }
}

package com.sulake.habbo.notifications.feed
{
   public class StateController
   {
       
      
      private var var_787:Boolean;
      
      private var var_2775:Boolean;
      
      private var var_2668:int = 0;
      
      private var var_2807:int = 1;
      
      public function StateController()
      {
         super();
      }
      
      private function isActive() : Boolean
      {
         return var_787 && !var_2775;
      }
      
      public function setEnabled(param1:Boolean) : int
      {
         var_787 = param1;
         if(!isActive())
         {
            return requestState(0);
         }
         return setVisible();
      }
      
      public function setGameMode(param1:Boolean) : int
      {
         var_2775 = param1;
         if(!isActive())
         {
            return requestState(0);
         }
         return setVisible();
      }
      
      public function currentState() : int
      {
         return var_2668;
      }
      
      public function requestState(param1:int) : int
      {
         if(!isActive())
         {
            var_2807 = param1;
            return var_2668;
         }
         var_2668 = param1;
         var_2807 = param1;
         return var_2668;
      }
      
      private function setVisible() : int
      {
         var _loc1_:int = var_2807;
         if(_loc1_ == 0)
         {
            _loc1_ = 1;
         }
         var_2668 = _loc1_;
         var_2807 = _loc1_;
         return _loc1_;
      }
   }
}

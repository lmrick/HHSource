package com.sulake.habbo.session
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.session.events.PerksUpdatedEvent;
   import flash.utils.Dictionary;
   import package_178.class_1585;
   import package_68.class_782;
   
   public class PerkManager implements class_13
   {
       
      
      private var var_174:Boolean = false;
      
      private var _sessionDataManager:com.sulake.habbo.session.SessionDataManager;
      
      private var _perkAllowancesMessageEvent:IMessageEvent;
      
      private var var_215:Dictionary;
      
      public function PerkManager(param1:com.sulake.habbo.session.SessionDataManager)
      {
         var_215 = new Dictionary();
         super();
         _sessionDataManager = param1;
         if(false)
         {
            _perkAllowancesMessageEvent = _sessionDataManager.communication.addHabboConnectionMessageEvent(new class_782(onPerkAllowances));
         }
      }
      
      public function get disposed() : Boolean
      {
         return _sessionDataManager == null;
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(var_215)
         {
            for(var _loc1_ in var_215)
            {
               delete var_215[_loc1_];
            }
            var_215 = null;
         }
         if(false)
         {
            _sessionDataManager.communication.removeHabboConnectionMessageEvent(_perkAllowancesMessageEvent);
         }
         _perkAllowancesMessageEvent = null;
         _sessionDataManager = null;
      }
      
      public function get isReady() : Boolean
      {
         return var_174;
      }
      
      public function isPerkAllowed(param1:String) : Boolean
      {
         return param1 in var_215 && var_215[param1].isAllowed;
      }
      
      public function getPerkErrorMessage(param1:String) : String
      {
         var _loc2_:class_1585 = var_215[param1];
         return _loc2_ != null ? _loc2_.errorMessage : "";
      }
      
      private function onPerkAllowances(param1:class_782) : void
      {
         for each(var _loc2_ in param1.getParser().getPerks())
         {
            var_215[_loc2_.code] = _loc2_;
         }
         var_174 = true;
         _sessionDataManager.events.dispatchEvent(new PerksUpdatedEvent());
      }
   }
}

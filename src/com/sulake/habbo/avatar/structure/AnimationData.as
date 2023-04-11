package com.sulake.habbo.avatar.structure
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.animation.*;
   import flash.utils.Dictionary;
   
   public class AnimationData implements IStructureData
   {
       
      
      private var var_474:Dictionary;
      
      public function AnimationData()
      {
         super();
         var_474 = new Dictionary();
      }
      
      public function parse(param1:XML) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         for each(var _loc2_ in param1.action)
         {
            var_474[String(_loc2_.@id)] = new AnimationAction(_loc2_);
         }
         return true;
      }
      
      public function appendXML(param1:XML) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         for each(var _loc2_ in param1.action)
         {
            var_474[String(_loc2_.@id)] = new AnimationAction(_loc2_);
         }
         return true;
      }
      
      public function getAction(param1:IActionDefinition) : AnimationAction
      {
         return var_474[param1.id];
      }
      
      public function getFrameCount(param1:IActionDefinition) : int
      {
         var _loc2_:AnimationAction = getAction(param1);
         if(!_loc2_)
         {
            return 0;
         }
         return _loc2_.frameCount;
      }
   }
}

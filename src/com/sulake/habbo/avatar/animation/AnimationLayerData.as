package com.sulake.habbo.avatar.animation
{
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.avatar.actions.ActiveActionData;
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.actions.class_3311;
   
   public class AnimationLayerData implements IAnimationLayerData
   {
      
      public static const const_865:String = "bodypart";
      
      public static const const_945:String = "fx";
       
      
      private var var_247:String;
      
      private var _action:class_3311;
      
      private var _animationFrame:int;
      
      private var var_3203:int;
      
      private var var_3193:int;
      
      private var var_3280:int;
      
      private var _directionOffset:int;
      
      private var var_271:String;
      
      private var var_632:String;
      
      private var _items:class_24;
      
      public function AnimationLayerData(param1:XML, param2:String, param3:IActionDefinition)
      {
         _items = new class_24();
         super();
         var_247 = String(param1.@id);
         _animationFrame = parseInt(param1.@frame);
         var_3203 = parseInt(param1.@dx);
         var_3193 = parseInt(param1.@dy);
         var_3280 = parseInt(param1.@dz);
         _directionOffset = parseInt(param1.@dd);
         var_271 = param2;
         var_632 = String(param1.@base);
         for each(var _loc5_ in param1.item)
         {
            _items[String(_loc5_.@id)] = String(_loc5_.@base);
         }
         var _loc4_:String = "";
         if(var_632 != "")
         {
            _loc4_ = String(baseAsInt());
         }
         if(param3 != null)
         {
            _action = new ActiveActionData(param3.state,base);
            _action.definition = param3;
         }
      }
      
      public function get items() : class_24
      {
         return _items;
      }
      
      private function baseAsInt() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < var_632.length)
         {
            _loc2_ += var_632.charCodeAt(_loc1_);
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function get id() : String
      {
         return var_247;
      }
      
      public function get animationFrame() : int
      {
         return _animationFrame;
      }
      
      public function get dx() : int
      {
         return var_3203;
      }
      
      public function get dy() : int
      {
         return var_3193;
      }
      
      public function get dz() : int
      {
         return var_3280;
      }
      
      public function get directionOffset() : int
      {
         return _directionOffset;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get base() : String
      {
         return var_632;
      }
      
      public function get action() : class_3311
      {
         return _action;
      }
   }
}

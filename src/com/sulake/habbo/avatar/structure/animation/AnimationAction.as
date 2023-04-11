package com.sulake.habbo.avatar.structure.animation
{
   import com.sulake.core.utils.class_24;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class AnimationAction
   {
      
      public static const DEFAULT_OFFSET:Point = new Point(0,0);
       
      
      private var var_247:String;
      
      private var var_3324:Dictionary;
      
      private var var_3625:class_24;
      
      private var var_1959:int;
      
      private var var_2000:Array;
      
      public function AnimationAction(param1:XML)
      {
         var _loc10_:AnimationActionPart = null;
         var _loc5_:int = 0;
         var _loc12_:class_24 = null;
         var _loc6_:int = 0;
         var _loc4_:class_24 = null;
         var _loc11_:String = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc3_:int = 0;
         var_3625 = new class_24();
         super();
         var_247 = String(param1.@id);
         var_3324 = new Dictionary();
         for each(var _loc8_ in param1.part)
         {
            _loc10_ = new AnimationActionPart(_loc8_);
            var_3324[String(_loc8_["set-type"])] = _loc10_;
            var_1959 = Math.max(var_1959,_loc10_.frames.length);
         }
         var_2000 = [];
         for each(var _loc2_ in param1.offsets.frame)
         {
            _loc5_ = parseInt(_loc2_.@id);
            var_1959 = Math.max(var_1959,_loc5_);
            _loc12_ = new class_24();
            var_3625[_loc5_] = _loc12_;
            for each(var _loc9_ in _loc2_.directions.direction)
            {
               _loc6_ = parseInt(_loc9_.@id);
               _loc4_ = new class_24();
               _loc12_[_loc6_] = _loc4_;
               for each(var _loc7_ in _loc9_.bodypart)
               {
                  _loc11_ = String(_loc7_.@id);
                  _loc13_ = _loc7_.hasOwnProperty("@dx") ? parseInt(_loc7_.@dx) : 0;
                  _loc14_ = _loc7_.hasOwnProperty("@dy") ? parseInt(_loc7_.@dy) : 0;
                  _loc4_[_loc11_] = new Point(_loc13_,_loc14_);
               }
            }
            var_2000.push(_loc5_);
            _loc3_ = parseInt(_loc2_.@repeats);
            if(_loc3_ > 1)
            {
               while(true)
               {
                  _loc3_--;
                  if(_loc3_ <= 0)
                  {
                     break;
                  }
                  var_2000.push(_loc5_);
               }
            }
         }
      }
      
      public function getPart(param1:String) : AnimationActionPart
      {
         return var_3324[param1] as AnimationActionPart;
      }
      
      public function get id() : String
      {
         return var_247;
      }
      
      public function get parts() : Dictionary
      {
         return var_3324;
      }
      
      public function get frameCount() : int
      {
         return var_1959;
      }
      
      public function getFrameBodyPartOffset(param1:int, param2:int, param3:String) : Point
      {
         var _loc8_:Point = null;
         var _loc6_:class_24 = null;
         var _loc7_:int = param2 % 0;
         var _loc4_:int = 0;
         var _loc5_:class_24;
         if(_loc5_ = var_3625[_loc4_])
         {
            if(_loc6_ = _loc5_[param1])
            {
               _loc8_ = _loc6_[param3];
            }
         }
         return _loc8_ != null ? _loc8_ : DEFAULT_OFFSET;
      }
   }
}

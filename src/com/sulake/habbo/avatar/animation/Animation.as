package com.sulake.habbo.avatar.animation
{
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.avatar.AvatarStructure;
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   
   public class Animation implements IAnimation
   {
      
      private static const const_428:Array = [];
       
      
      private var var_247:String;
      
      private var _description:String;
      
      private var var_1655:Array;
      
      private var var_3712:Vector.<com.sulake.habbo.avatar.animation.ISpriteDataContainer>;
      
      private var var_3719:com.sulake.habbo.avatar.animation.AvatarDataContainer;
      
      private var var_3571:com.sulake.habbo.avatar.animation.DirectionDataContainer;
      
      private var var_3322:Array;
      
      private var var_2049:Array;
      
      private var _overriddenActions:class_24;
      
      private var _overrideFrames:class_24;
      
      private var var_3440:Boolean;
      
      public function Animation(param1:AvatarStructure, param2:XML)
      {
         var _loc5_:String = null;
         var _loc7_:String = null;
         var _loc3_:* = null;
         var_1655 = [];
         super();
         var_247 = String(param2.@name);
         if(param2.hasOwnProperty("@desc"))
         {
            _description = String(param2.@desc);
         }
         else
         {
            _description = var_247;
         }
         if(param2.hasOwnProperty("@resetOnToggle"))
         {
            var_3440 = Boolean(param2.@resetOnToggle);
         }
         else
         {
            var_3440 = false;
         }
         if(param2.hasOwnProperty("sprite"))
         {
            var_3712 = new Vector.<com.sulake.habbo.avatar.animation.ISpriteDataContainer>();
            for each(var _loc6_ in param2.sprite)
            {
               var_3712.push(new SpriteDataContainer(this as IAnimation,_loc6_));
            }
         }
         if(param2.hasOwnProperty("avatar"))
         {
            var_3719 = new com.sulake.habbo.avatar.animation.AvatarDataContainer(param2.avatar[0]);
         }
         if(param2.hasOwnProperty("direction"))
         {
            var_3571 = new com.sulake.habbo.avatar.animation.DirectionDataContainer(param2.direction[0]);
         }
         if(param2.hasOwnProperty("remove"))
         {
            var_3322 = [];
            for each(var _loc8_ in param2.remove)
            {
               var_3322.push(String(_loc8_.@id));
            }
         }
         if(param2.hasOwnProperty("add"))
         {
            var_2049 = [];
            for each(var _loc9_ in param2.add)
            {
               var_2049.push(new AddDataContainer(_loc9_));
            }
         }
         if(param2.hasOwnProperty("override"))
         {
            _overrideFrames = new class_24();
            _overriddenActions = new class_24();
            for each(var _loc4_ in param2.name_6)
            {
               _loc5_ = String(_loc4_.@name);
               _loc7_ = _loc4_.@name_6;
               _overriddenActions.add(_loc7_,_loc5_);
               _loc3_ = [];
               parseFrames(_loc3_,_loc4_.frame,param1);
               _overrideFrames.add(_loc5_,_loc3_);
            }
         }
         parseFrames(var_1655,param2.frame,param1);
      }
      
      private function parseFrames(param1:Array, param2:XMLList, param3:AvatarStructure) : void
      {
         var _loc5_:* = null;
         var _loc10_:IActionDefinition = null;
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc12_:AnimationLayerData = null;
         var _loc8_:AnimationLayerData = null;
         for each(var _loc11_ in param2)
         {
            _loc6_ = 1;
            if(_loc11_.@repeats > 1)
            {
               _loc6_ = int(_loc11_.@repeats);
            }
            _loc4_ = 0;
            while(_loc4_ < _loc6_)
            {
               _loc5_ = [];
               for each(var _loc9_ in _loc11_.bodypart)
               {
                  _loc10_ = param3.getActionDefinition(String(_loc9_.@action));
                  _loc12_ = new AnimationLayerData(_loc9_,"bodypart",_loc10_);
                  _loc5_.push(_loc12_);
               }
               for each(var _loc7_ in _loc11_.fx)
               {
                  _loc10_ = param3.getActionDefinition(String(_loc7_.@action));
                  _loc8_ = new AnimationLayerData(_loc7_,"fx",_loc10_);
                  _loc5_.push(_loc8_);
                  if(_loc10_ != null)
                  {
                  }
               }
               param1.push(_loc5_);
               _loc4_++;
            }
         }
      }
      
      public function frameCount(param1:String = null) : int
      {
         var _loc2_:Array = null;
         if(!param1)
         {
            return var_1655.length;
         }
         if(_overrideFrames)
         {
            _loc2_ = _overrideFrames.getValue(param1);
            if(_loc2_)
            {
               return _loc2_.length;
            }
         }
         return 0;
      }
      
      public function hasOverriddenActions() : Boolean
      {
         if(!_overriddenActions)
         {
            return false;
         }
         return false;
      }
      
      public function overriddenActionNames() : Array
      {
         if(!_overriddenActions)
         {
            return null;
         }
         return _overriddenActions.getKeys();
      }
      
      public function overridingAction(param1:String) : String
      {
         if(!_overriddenActions)
         {
            return null;
         }
         return _overriddenActions.getValue(param1);
      }
      
      private function getFrame(param1:int, param2:String = null) : Array
      {
         var _loc3_:Array = null;
         var _loc4_:* = [];
         if(!param2)
         {
            if(false)
            {
               _loc4_ = var_1655[param1 % 0];
            }
         }
         else
         {
            _loc3_ = _overrideFrames.getValue(param2) as Array;
            if(_loc3_ && _loc3_.length > 0)
            {
               _loc4_ = _loc3_[param1 % _loc3_.length];
            }
         }
         return _loc4_;
      }
      
      public function getAnimatedBodyPartIds(param1:int, param2:String = null) : Array
      {
         var _loc4_:* = [];
         for each(var _loc3_ in getFrame(param1,param2))
         {
            if(_loc3_.type == "bodypart")
            {
               _loc4_.push(_loc3_.id);
            }
            else if(_loc3_.type == "fx")
            {
               if(var_2049)
               {
                  for each(var _loc5_ in var_2049)
                  {
                     if(_loc5_.id == _loc3_.id)
                     {
                        _loc4_.push(_loc5_.align);
                     }
                  }
               }
            }
         }
         return _loc4_;
      }
      
      public function getLayerData(param1:int, param2:String, param3:String = null) : AnimationLayerData
      {
         for each(var _loc4_ in getFrame(param1,param3))
         {
            if(_loc4_.id == param2)
            {
               return _loc4_ as AnimationLayerData;
            }
            if(_loc4_.type == "fx")
            {
               for each(var _loc5_ in var_2049)
               {
                  if(_loc5_.align == param2 && _loc5_.id == _loc4_.id)
                  {
                     return _loc4_ as AnimationLayerData;
                  }
               }
            }
         }
         return null;
      }
      
      public function hasAvatarData() : Boolean
      {
         return var_3719 != null;
      }
      
      public function hasDirectionData() : Boolean
      {
         return var_3571 != null;
      }
      
      public function hasAddData() : Boolean
      {
         return var_2049 != null;
      }
      
      public function getAddData(param1:String) : AddDataContainer
      {
         if(var_2049)
         {
            for each(var _loc2_ in var_2049)
            {
               if(_loc2_.id == param1)
               {
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      public function get id() : String
      {
         return var_247;
      }
      
      public function get spriteData() : Vector.<com.sulake.habbo.avatar.animation.ISpriteDataContainer>
      {
         return var_3712;
      }
      
      public function get avatarData() : com.sulake.habbo.avatar.animation.AvatarDataContainer
      {
         return var_3719;
      }
      
      public function get directionData() : com.sulake.habbo.avatar.animation.DirectionDataContainer
      {
         return var_3571;
      }
      
      public function get removeData() : Array
      {
         return !!var_3322 ? var_3322 : const_428;
      }
      
      public function get addData() : Array
      {
         return !!var_2049 ? var_2049 : const_428;
      }
      
      public function toString() : String
      {
         return _description;
      }
      
      public function get resetOnToggle() : Boolean
      {
         return var_3440;
      }
   }
}

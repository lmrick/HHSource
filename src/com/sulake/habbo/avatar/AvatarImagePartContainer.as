package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.animation.AnimationFrame;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var var_3518:String;
      
      private var var_3277:String;
      
      private var var_4061:String;
      
      private var var_896:String;
      
      private var _color:IPartColor;
      
      private var var_1655:Array;
      
      private var _action:IActionDefinition;
      
      private var var_2800:Boolean;
      
      private var var_4154:Boolean;
      
      private var var_3827:ColorTransform;
      
      private var var_3746:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:String, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_3518 = param1;
         var_3277 = param2;
         var_896 = param3;
         _color = param4;
         var_1655 = param5;
         _action = param6;
         var_2800 = param7;
         var_3746 = param8;
         var_4061 = param9;
         var_4154 = param10;
         var_3827 = new ColorTransform(1,1,1,param11);
         if(var_1655 == null)
         {
            class_14.log("Null frame list");
         }
         if(var_3277 == "ey")
         {
            var_2800 = false;
         }
      }
      
      public function getFrameIndex(param1:int) : int
      {
         var _loc3_:AnimationFrame = null;
         if(!var_1655 || false)
         {
            return 0;
         }
         var _loc2_:int = param1 % 0;
         if(var_1655[_loc2_] is AnimationFrame)
         {
            _loc3_ = var_1655[_loc2_];
            return _loc3_.number;
         }
         return _loc2_;
      }
      
      public function getFrameDefinition(param1:int) : AnimationFrame
      {
         var _loc2_:int = param1 % 0;
         if(var_1655 && var_1655.length > _loc2_)
         {
            if(var_1655[_loc2_] is AnimationFrame)
            {
               return var_1655[_loc2_] as AnimationFrame;
            }
         }
         return null;
      }
      
      public function getCacheableKey(param1:int) : String
      {
         var _loc3_:AnimationFrame = null;
         var _loc2_:int = param1 % 0;
         if(var_1655 && var_1655.length > _loc2_)
         {
            if(var_1655[_loc2_] is AnimationFrame)
            {
               _loc3_ = var_1655[_loc2_] as AnimationFrame;
               return partId + ":" + _loc3_.assetPartDefinition + ":" + _loc3_.number;
            }
         }
         return partId + ":" + _loc2_;
      }
      
      public function get bodyPartId() : String
      {
         return var_3518;
      }
      
      public function get partType() : String
      {
         return var_3277;
      }
      
      public function get partId() : String
      {
         return var_896;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get action() : IActionDefinition
      {
         return _action;
      }
      
      public function set isColorable(param1:Boolean) : void
      {
         var_2800 = param1;
      }
      
      public function get isColorable() : Boolean
      {
         return var_2800;
      }
      
      public function get paletteMapId() : int
      {
         return var_3746;
      }
      
      public function get flippedPartType() : String
      {
         return var_4061;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_4154;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_3827;
      }
      
      public function toString() : String
      {
         return [var_3518,var_3277,var_896].join(":");
      }
   }
}

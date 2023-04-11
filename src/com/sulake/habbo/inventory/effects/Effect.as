package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.avatar.class_3356;
   import com.sulake.habbo.inventory.IThumbListDrawableItem;
   import com.sulake.habbo.inventory.class_3141;
   import com.sulake.habbo.ui.widget.memenu.class_3289;
   import flash.display.BitmapData;
   
   public class Effect implements class_3289, IThumbListDrawableItem, class_3356, class_3141
   {
       
      
      private var var_271:int;
      
      private var var_529:int;
      
      private var _duration:int;
      
      private var var_2263:int = 1;
      
      private var var_2934:int;
      
      private var var_1110:Boolean = false;
      
      private var var_2105:Boolean = false;
      
      private var var_3103:Boolean = false;
      
      private var var_3237:Boolean = false;
      
      private var var_2001:BitmapData;
      
      private var var_4004:Date;
      
      public function Effect()
      {
         super();
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get subType() : int
      {
         return var_529;
      }
      
      public function get duration() : int
      {
         return _duration;
      }
      
      public function get amountInInventory() : int
      {
         return var_2263;
      }
      
      public function get isPermanent() : Boolean
      {
         return var_1110;
      }
      
      public function get isActive() : Boolean
      {
         return var_2105;
      }
      
      public function get isInUse() : Boolean
      {
         return var_3237;
      }
      
      public function get isSelected() : Boolean
      {
         return var_3103;
      }
      
      public function get icon() : BitmapData
      {
         return var_2001;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_2001;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_2105)
         {
            _loc1_ = var_2934 - (new Date().valueOf() - var_4004.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_2934;
      }
      
      public function set type(param1:int) : void
      {
         var_271 = param1;
      }
      
      public function set subType(param1:int) : void
      {
         var_529 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         _duration = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_2934 = param1;
      }
      
      public function set isPermanent(param1:Boolean) : void
      {
         var_1110 = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         var_3103 = param1;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_3237 = param1;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_2001 = param1;
      }
      
      public function set amountInInventory(param1:int) : void
      {
         var_2263 = param1;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_2105)
         {
            var_4004 = new Date();
         }
         var_2105 = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         var_2263--;
         if(var_2263 < 0)
         {
            var_2263 = 0;
         }
         var_2934 = _duration;
         var_2105 = false;
         var_3237 = false;
      }
   }
}

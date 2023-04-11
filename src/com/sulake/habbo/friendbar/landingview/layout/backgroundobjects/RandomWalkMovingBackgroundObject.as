package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.events.PathResetEvent;
   import com.sulake.habbo.utils.class_403;
   import flash.events.EventDispatcher;
   
   public class RandomWalkMovingBackgroundObject extends BackgroundObject
   {
       
      
      private var var_3492:int;
      
      private var var_3515:int;
      
      private var var_3766:Number;
      
      private var var_3902:Number;
      
      private var var_3019:Number;
      
      private var var_2931:Number;
      
      private var var_3558:Number;
      
      private var var_1635:uint = 0;
      
      private var var_2529:Number;
      
      private var var_2473:Number;
      
      private var var_3716:Number = 0;
      
      private var var_3573:Number = 0;
      
      private var var_4184:Number = 0;
      
      private var var_4144:Number = 0;
      
      private var var_3630:uint;
      
      public function RandomWalkMovingBackgroundObject(param1:int, param2:class_3151, param3:EventDispatcher, param4:HabboLandingView, param5:String)
      {
         super(param1,param2,param3,param4,param5,false);
         var _loc7_:Array;
         var _loc6_:String = String((_loc7_ = param5.split(";"))[0]);
         var_3492 = int(_loc7_[2]);
         var_3515 = int(_loc7_[3]);
         var_3019 = Number(_loc7_[4]);
         var_2931 = Number(_loc7_[5]);
         var_3766 = Number(_loc7_[6]);
         var_3902 = Number(_loc7_[7]);
         var_3558 = int(_loc7_[8]);
         var_2529 = var_3492;
         var_2473 = var_3515;
         sprite.assetUri = "${image.library.url}" + _loc6_ + ".png";
      }
      
      override public function update(param1:uint) : void
      {
         super.update(param1);
         if(!sprite)
         {
            return;
         }
         var_1635 += param1;
         if(var_1635 - var_3630 > var_3558)
         {
            var_4184 = var_3716;
            var_4144 = var_3573;
            var_3716 = (Math.random() * 2 - 1) * var_3766;
            var_3573 = (Math.random() * 2 - 1) * var_3902;
            var_3630 = var_1635;
         }
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Number = (var_1635 - var_3630) / var_3558;
         var_2529 += param1 / 1000 * (var_3019 + class_403.lerp(_loc3_,var_4184,var_3716));
         var_2473 += param1 / 1000 * (var_2931 + class_403.lerp(_loc3_,var_4144,var_3573));
         sprite.x = var_2529;
         sprite.y = var_2473;
         if(var_3019 > 0 && sprite.x > _loc4_ || var_3019 < 0 && false || var_2931 > 0 && sprite.y > _loc2_ || var_2931 < 0 && false)
         {
            var_2529 = var_3492;
            var_2473 = var_3515;
            events.dispatchEvent(new PathResetEvent("LWMOPRE_MOVING_OBJECT_PATH_RESET",id));
         }
      }
   }
}

package com.sulake.habbo.friendbar.landingview.layout
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.*;
   import flash.events.EventDispatcher;
   
   public class MovingBackgroundObjects implements class_13, class_41
   {
      
      private static const MAX_OBJECTS:int = 20;
       
      
      private var _landingView:HabboLandingView;
      
      private var var_129:Array;
      
      private var var_2223:class_24;
      
      private var name_1:EventDispatcher;
      
      private var var_3489:String = "";
      
      public function MovingBackgroundObjects(param1:HabboLandingView)
      {
         var_129 = [];
         var_2223 = new class_24();
         name_1 = new EventDispatcher();
         super();
         _landingView = param1;
         initializeObjectTypeMapping();
      }
      
      private function initializeObjectTypeMapping() : void
      {
         var_2223.add("line",class_3519.CLASS_LINEAR);
         var_2223.add("spiral",class_3519.CLASS_SPIRAL);
         var_2223.add("animated",class_3519.CLASS_STATIC_ANIMATED);
         var_2223.add("randomwalk",class_3519.CLASS_RANDOM_WALK);
      }
      
      public function dispose() : void
      {
         _landingView = null;
         for each(var _loc1_ in var_129)
         {
            _loc1_.dispose();
         }
         var_129 = null;
         var_2223.reset();
         var_2223 = null;
         name_1 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _landingView == null;
      }
      
      public function initialize(param1:class_3151) : void
      {
         var _loc4_:int = 0;
         var _loc2_:String = null;
         var _loc3_:BackgroundObject = null;
         param1 = class_3151(param1.findChildByName("moving_objects_container"));
         if(param1 == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         _loc4_ = 1;
         while(_loc4_ <= 20)
         {
            if(var_3489 == "")
            {
               _loc2_ = _landingView.getProperty("landing.view.bgobject." + _loc4_);
            }
            else
            {
               _loc2_ = _landingView.getProperty("landing.view." + var_3489 + ".bgobject." + _loc4_);
            }
            if(_loc2_ != "")
            {
               _loc3_ = getObjectByDataContent(_loc4_,_loc2_,param1);
               if(_loc3_ != null)
               {
                  var_129.push(_loc3_);
               }
            }
            _loc4_++;
         }
      }
      
      public function update(param1:uint) : void
      {
         for each(var _loc2_ in var_129)
         {
            _loc2_.update(param1);
         }
      }
      
      private function getObjectByDataContent(param1:int, param2:String, param3:class_3151) : BackgroundObject
      {
         var _loc6_:String = null;
         var _loc5_:Class = null;
         var _loc4_:Array;
         if((_loc4_ = param2.split(";")).length >= 2)
         {
            _loc6_ = String(_loc4_[1]);
            if((_loc5_ = var_2223.getValue(_loc6_)) != null)
            {
               return new _loc5_(param1,param3,name_1,_landingView,param2);
            }
         }
         return null;
      }
      
      public function set timingCode(param1:String) : void
      {
         var_3489 = param1;
      }
   }
}

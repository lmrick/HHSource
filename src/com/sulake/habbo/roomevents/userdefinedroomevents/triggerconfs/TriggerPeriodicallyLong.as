package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import com.sulake.habbo.utils.FriendlyTime;
   import flash.events.Event;
   
   public class class_3426 extends class_3425
   {
       
      
      public function class_3426()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3431.PERIODIC_LONG;
      }
      
      override protected function onSliderChange(param1:Event) : void
      {
         var _loc2_:SliderWindowController = null;
         var _loc4_:Number = NaN;
         var _loc3_:String = null;
         if(param1.type == "change")
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc4_ = _loc2_.getValue();
               _loc3_ = FriendlyTime.getFriendlyTime(roomEvents.localization,_loc4_ * 5);
               roomEvents.localization.registerParameter("wiredfurni.params.setlongtime","time",_loc3_);
            }
         }
      }
   }
}

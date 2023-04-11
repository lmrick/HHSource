package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.IStuffData;
   
   public class MultiProductContainer extends SingleProductContainer
   {
       
      
      public function MultiProductContainer(param1:class_3159, param2:Vector.<class_3169>, param3:HabboCatalog)
      {
         super(param1,param2,param3);
      }
      
      override public function initProductIcon(param1:IRoomEngine, param2:IStuffData = null) : void
      {
         super.initProductIcon(param1);
         var _loc3_:class_3127 = var_1430.findChildByName("multiContainer");
         if(_loc3_)
         {
            _loc3_.visible = true;
         }
         var _loc4_:ITextWindow;
         if(_loc4_ = var_1430.findChildByName("multiCounter") as ITextWindow)
         {
            _loc4_.text = "xundefined";
         }
         this.setClubIconLevel(offer.clubLevel);
      }
   }
}

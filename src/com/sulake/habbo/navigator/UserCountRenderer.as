package com.sulake.habbo.navigator
{
   import com.sulake.core.window.*;
   import com.sulake.core.window.components.*;
   
   public class UserCountRenderer
   {
      
      public static const USERCOUNT_ELEMENT_NAME:String = "usercount";
       
      
      private var _navigator:com.sulake.habbo.navigator.class_1686;
      
      public function UserCountRenderer(param1:com.sulake.habbo.navigator.class_1686)
      {
         super();
         _navigator = param1;
      }
      
      public function dispose() : void
      {
         _navigator = null;
      }
      
      public function refreshUserCount(param1:int, param2:class_3151, param3:int, param4:String, param5:int, param6:int) : void
      {
         var _loc9_:class_3151;
         if((_loc9_ = class_3151(param2.findChildByName("usercount"))) == null)
         {
            (_loc9_ = class_3151(_navigator.getXmlWindow("grs_usercount"))).name = "usercount";
            _loc9_.x = param5;
            _loc9_.y = param6;
            param2.addChild(_loc9_);
         }
         IInteractiveWindow(_loc9_).toolTipCaption = param4;
         var _loc7_:ITextWindow;
         (_loc7_ = ITextWindow(_loc9_.findChildByName("txt"))).text = "" + param3;
         var _loc8_:String = this.getBgColor(param1,param3);
         refreshBg(_loc9_,_loc8_);
         _loc9_.visible = true;
      }
      
      private function getBgColor(param1:int, param2:int) : String
      {
         if(param2 == 0)
         {
            return "b";
         }
         if(isOverBgColorLimit(param1,param2,"red",92))
         {
            return "r";
         }
         if(isOverBgColorLimit(param1,param2,"orange",80))
         {
            return "o";
         }
         if(isOverBgColorLimit(param1,param2,"yellow",50))
         {
            return "y";
         }
         return "g";
      }
      
      private function isOverBgColorLimit(param1:int, param2:int, param3:String, param4:int) : Boolean
      {
         var _loc7_:String = "navigator.colorlimit." + param3;
         var _loc6_:int = _navigator.getInteger(_loc7_,param4);
         var _loc5_:int = param1 * _loc6_ / 100;
         return param2 >= _loc5_;
      }
      
      private function refreshBg(param1:class_3151, param2:String) : void
      {
         var _loc3_:String = null;
         var _loc4_:class_3282;
         if((_loc4_ = class_3282(param1.findChildByName("usercount_bg"))).tags[0] != param2)
         {
            _loc4_.tags.splice(0,_loc4_.tags.length);
            _loc4_.tags.push(param2);
            _loc3_ = "usercount_fixed_" + param2;
            _loc4_.bitmap = _navigator.getButtonImage(_loc3_);
            _loc4_.disposesBitmap = false;
            _loc4_.invalidate();
         }
      }
      
      private function refreshIcon(param1:class_3151, param2:String, param3:Boolean) : void
      {
         _navigator.refreshButton(param1,param2,param3,null,0);
      }
   }
}

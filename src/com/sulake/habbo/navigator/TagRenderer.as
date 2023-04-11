package com.sulake.habbo.navigator
{
   import com.sulake.core.window.*;
   import com.sulake.core.window.components.*;
   import com.sulake.core.window.enum.*;
   import com.sulake.core.window.events.*;
   
   public class TagRenderer
   {
       
      
      private var _navigator:com.sulake.habbo.navigator.class_1686;
      
      private var var_3077:Function;
      
      private var var_3590:Boolean = false;
      
      public function TagRenderer(param1:com.sulake.habbo.navigator.class_1686, param2:Function = null)
      {
         super();
         _navigator = param1;
         var_3077 = param2;
      }
      
      public function dispose() : void
      {
         _navigator = null;
         var_3077 = null;
      }
      
      public function set useHashTags(param1:Boolean) : void
      {
         var_3590 = param1;
      }
      
      public function refreshTags(param1:class_3151, param2:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:class_3151 = class_3151(param1.findChildByName("tags"));
         _loc4_ = 0;
         while(_loc4_ < 4)
         {
            refreshTag(_loc3_,_loc4_,param2[_loc4_]);
            _loc4_++;
         }
         var _loc5_:int = param1.width - _loc3_.x;
         Util.layoutChildrenInArea(_loc3_,_loc5_,14);
         _loc3_.height = Util.getLowestPoint(_loc3_);
         _loc3_.visible = param2.length > 0;
      }
      
      public function refreshTag(param1:class_3151, param2:int, param3:String) : void
      {
         var _loc4_:ITextWindow = null;
         var _loc5_:String = "tag." + param2;
         var _loc6_:class_3151 = class_3151(param1.getChildByName(_loc5_));
         if(param3 == null || param3 == "")
         {
            if(_loc6_ != null)
            {
               _loc6_.visible = false;
            }
         }
         else
         {
            if(_loc6_ == null)
            {
               (_loc6_ = class_3151(_navigator.getXmlWindow("iro_tag"))).name = _loc5_;
               param1.addChild(_loc6_);
               _loc6_.procedure = tagProcedure;
            }
            (_loc4_ = ITextWindow(_loc6_.findChildByName("txt"))).text = (var_3590 ? "#" : "") + param3;
            _loc4_.width = _loc4_.textWidth + 5;
            _loc6_.width = _loc4_.width + 3;
            refreshTagBg(_loc6_,false);
            _loc6_.visible = true;
         }
      }
      
      private function refreshTagBg(param1:class_3151, param2:Boolean) : void
      {
         refreshBgPiece(param1,"l",param2);
         refreshBgPiece(param1,"m",param2);
         refreshBgPiece(param1,"r",param2);
      }
      
      private function tagProcedure(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:ITextWindow = null;
         var _loc4_:String = null;
         var _loc5_:class_3151;
         if((_loc5_ = param2 as class_3151) == null)
         {
            return;
         }
         if(param1.type == "WME_OVER")
         {
            refreshTagBg(_loc5_,true);
         }
         else if(param1.type == "WME_OUT")
         {
            refreshTagBg(_loc5_,false);
         }
         else if(param1.type == "WME_CLICK")
         {
            _loc3_ = ITextWindow(_loc5_.findChildByName("txt"));
            _loc4_ = var_3590 ? _loc3_.text.substr(1,_loc3_.text.length - 1) : _loc3_.text;
            class_14.log("TAG CLICKED: " + _loc4_);
            _navigator.performTagSearch(_loc4_);
            if(var_3077 != null)
            {
               var_3077();
            }
         }
      }
      
      private function refreshBgPiece(param1:class_3151, param2:String, param3:Boolean) : void
      {
         var _loc4_:String = null;
         var _loc5_:class_3282;
         if((_loc5_ = class_3282(param1.findChildByName("bg_" + param2))).tags[0] != "" + param3)
         {
            _loc5_.tags.splice(0,_loc5_.tags.length);
            _loc5_.tags.push("" + param3);
            _loc4_ = "tag_" + param2 + (param3 ? "_reactive" : "");
            _loc5_.bitmap = _navigator.getButtonImage(_loc4_);
            _loc5_.disposesBitmap = false;
            _loc5_.invalidate();
         }
      }
   }
}

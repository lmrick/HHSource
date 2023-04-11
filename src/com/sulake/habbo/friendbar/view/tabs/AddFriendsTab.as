package com.sulake.habbo.friendbar.view.tabs
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.motion.Combo;
   import com.sulake.core.window.motion.EaseOut;
   import com.sulake.core.window.motion.MoveBy;
   import com.sulake.core.window.motion.ResizeTo;
   import com.sulake.core.window.motion.class_3353;
   import flash.display.BitmapData;
   
   public class AddFriendsTab extends Tab
   {
      
      protected static const ICON:String = "icon";
      
      protected static const const_751:String = "text";
      
      protected static const HEADER:String = "header";
      
      protected static const LABEL:String = "label";
      
      protected static const const_714:String = "button";
      
      private static const const_498:String = "add_friends_tab_xml";
      
      private static const ICON_RESOURCE:String = "find_friends_icon_png";
      
      private static var var_3125:int = -1;
      
      private static const DEFAULT_COLOR:uint = 8374494;
      
      private static const const_567:uint = 9560569;
      
      private static const const_421:Array = [];
      
      private static const const_420:Array = [];
       
      
      public function AddFriendsTab()
      {
         super();
      }
      
      public static function allocate() : AddFriendsTab
      {
         var _loc1_:AddFriendsTab = const_421.length > 0 ? const_421.pop() : new AddFriendsTab();
         _loc1_.var_1501 = false;
         _loc1_._window = _loc1_.allocateEntityWindow();
         return _loc1_;
      }
      
      public function allocateEntityWindow() : class_3151
      {
         var _loc1_:class_3151 = const_420.length > 0 ? const_420.pop() : WINDOWING.buildFromXML(ASSETS.getAssetByName("add_friends_tab_xml").content as XML) as class_3151;
         var _loc4_:IRegionWindow = IRegionWindow(_loc1_.findChildByName("header"));
         _loc1_.addEventListener("WME_CLICK",onMouseClick);
         _loc1_.addEventListener("WME_OVER",onMouseOver);
         _loc1_.addEventListener("WME_OUT",onMouseOut);
         _loc4_.addEventListener("WME_CLICK",onMouseClick);
         _loc4_.addEventListener("WME_OVER",onMouseOver);
         _loc4_.addEventListener("WME_OUT",onMouseOut);
         if(var_3125 < 0)
         {
            var_3125 = _loc1_.height;
         }
         _loc1_.height = HEIGHT;
         var _loc3_:class_3282 = _loc1_.findChildByName("icon") as class_3282;
         _loc3_.disposesBitmap = false;
         if(ASSETS.getAssetByName("find_friends_icon_png") != null)
         {
            _loc3_.bitmap = ASSETS.getAssetByName("find_friends_icon_png").content as BitmapData;
         }
         var _loc2_:class_3127 = _loc1_.findChildByName("button");
         _loc2_.addEventListener("WME_CLICK",onButtonClick);
         var _loc5_:class_3127;
         (_loc5_ = _loc1_.findChildByName("text")).visible = false;
         return _loc1_;
      }
      
      private function releaseEntityWindow(param1:class_3151) : void
      {
         var _loc2_:IRegionWindow = null;
         if(param1 && !param1.disposed)
         {
            param1.procedure = null;
            param1.removeEventListener("WME_CLICK",onMouseClick);
            param1.removeEventListener("WME_OVER",onMouseOver);
            param1.removeEventListener("WME_OUT",onMouseOut);
            _loc2_ = IRegionWindow(param1.findChildByName("header"));
            _loc2_.removeEventListener("WME_CLICK",onMouseClick);
            _loc2_.removeEventListener("WME_OVER",onMouseOver);
            _loc2_.removeEventListener("WME_OUT",onMouseOut);
            param1.findChildByName("button").removeEventListener("WME_CLICK",onButtonClick);
            param1.findChildByName("text").visible = false;
            param1.width = WIDTH;
            param1.height = HEIGHT;
            if(const_420.indexOf(param1) == -1)
            {
               const_420.push(param1);
            }
         }
      }
      
      override public function select(param1:Boolean) : void
      {
         if(!selected)
         {
            if(param1 && false)
            {
               class_3353.runMotion(new Combo(new EaseOut(new ResizeTo(_window,80,_window.width,var_3125),3),new EaseOut(new MoveBy(_window,80,_window.x,-(var_3125 - HEIGHT)),3)));
            }
            else
            {
               _window.height = var_3125;
               _window.y = 0 - (0 - HEIGHT);
            }
            _window.findChildByName("text").visible = true;
            super.select(param1);
         }
      }
      
      override public function deselect(param1:Boolean) : void
      {
         if(selected)
         {
            _window.y = 0;
            _window.height = HEIGHT;
            _window.findChildByName("text").visible = false;
            super.deselect(param1);
         }
      }
      
      override public function recycle() : void
      {
         if(!disposed)
         {
            if(!var_1501)
            {
               if(_window)
               {
                  releaseEntityWindow(_window);
                  _window = null;
               }
               var_1501 = true;
               const_421.push(this);
            }
         }
      }
      
      override protected function expose() : void
      {
         super.expose();
         ITextWindow(_window.findChildByTag("label")).underline = exposed;
         _window.color = exposed ? 9560569 : 8374494;
      }
      
      override protected function conceal() : void
      {
         super.conceal();
         ITextWindow(_window.findChildByTag("label")).underline = exposed;
         _window.color = exposed ? 9560569 : 8374494;
      }
      
      private function onButtonClick(param1:WindowMouseEvent) : void
      {
         if(!disposed && !recycled)
         {
            DATA.findNewFriends();
            deselect(true);
         }
      }
   }
}

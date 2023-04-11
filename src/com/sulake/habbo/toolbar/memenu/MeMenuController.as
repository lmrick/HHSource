package com.sulake.habbo.toolbar.memenu
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.navigator.class_1685;
   import com.sulake.habbo.toolbar.HabboToolbar;
   import com.sulake.habbo.toolbar.ToolbarView;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import package_7.class_313;
   import package_80.class_956;
   
   public class MeMenuController implements class_13
   {
      
      public static const USE_GUIDE_TOOL:String = "USE_GUIDE_TOOL";
       
      
      private var _toolbar:HabboToolbar;
      
      private var var_1527:ToolbarView;
      
      private var _window:class_3151;
      
      private var var_3356:com.sulake.habbo.toolbar.memenu.MeMenuIconLoader;
      
      private var var_3791:Boolean;
      
      private var var_1743:com.sulake.habbo.toolbar.memenu.MeMenuSettingsMenuView;
      
      private var _unseenItemCounters:class_24;
      
      public function MeMenuController(param1:HabboToolbar, param2:ToolbarView)
      {
         super();
         _unseenItemCounters = new class_24();
         _toolbar = param1;
         var_1527 = param2;
         _toolbar.events.addEventListener("HTE_TOOLBAR_CLICK",onToolbarClick);
         var _loc3_:XmlAsset = _toolbar.assets.getAssetByName("me_menu_view_xml") as XmlAsset;
         _window = _toolbar.windowManager.buildFromXML(_loc3_.content as XML,2) as class_3151;
         var_3356 = new com.sulake.habbo.toolbar.memenu.MeMenuIconLoader(_toolbar);
         _window.visible = false;
         _window.procedure = windowProcedure;
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         var _loc5_:IRegionWindow = null;
         var _loc3_:IStaticBitmapWrapperWindow = null;
         var _loc4_:class_1685 = null;
         var _loc6_:String = null;
         if(param2 is IRegionWindow)
         {
            _loc5_ = param2 as IRegionWindow;
            loop0:
            switch(param1.type)
            {
               case "WME_OVER":
                  _loc3_ = _loc5_.findChildByName(param2.name + "_icon") as IStaticBitmapWrapperWindow;
                  if(_loc3_ != null)
                  {
                     _loc3_.assetUri = "toolbar_memenu_" + param2.name + "_color";
                     break;
                  }
                  break;
               case "WME_OUT":
                  _loc3_ = _loc5_.findChildByName(param2.name + "_icon") as IStaticBitmapWrapperWindow;
                  if(_loc3_ != null)
                  {
                     _loc3_.assetUri = "toolbar_memenu_" + param2.name + "_white";
                     break;
                  }
                  break;
               case "WME_CLICK":
                  _window.visible = false;
                  switch(param2.name)
                  {
                     case "profile":
                        _toolbar.connection.send(new class_313(_toolbar.sessionDataManager.userId));
                        break loop0;
                     case "minimail":
                        HabboWebTools.openMinimail("#mail/inbox/");
                        break loop0;
                     case "rooms":
                        if((_loc4_ = _toolbar.navigator) != null)
                        {
                           _loc4_.showOwnRooms();
                           break loop0;
                        }
                        break loop0;
                     case "talents":
                        _loc6_ = _toolbar.sessionDataManager.currentTalentTrack;
                        _toolbar.connection.send(new class_956(_loc6_));
                        break loop0;
                     case "settings":
                        var_1743 = new com.sulake.habbo.toolbar.memenu.MeMenuSettingsMenuView();
                        var_1743.init(this,var_1527);
                        break loop0;
                     case "achievements":
                        _toolbar.questEngine.showAchievements();
                        break loop0;
                     case "guide":
                        _toolbar.toggleWindowVisibility("GUIDE");
                        break loop0;
                     case "clothes":
                        _toolbar.context.createLinkEvent("avatareditor/open");
                  }
            }
         }
      }
      
      private function onToolbarClick(param1:HabboToolbarEvent) : void
      {
         if(var_3791)
         {
            return;
         }
         if(param1.iconId == "HTIE_ICON_MEMENU")
         {
            toggleVisibility();
         }
         else
         {
            _window.visible = false;
            if(var_1743 != null)
            {
               var_1743.dispose();
               var_1743 = null;
            }
         }
      }
      
      private function setGuideToolVisibility(param1:Boolean) : void
      {
         _window.findChildByName("guide").visible = param1;
         _window.height = param1 ? _window.findChildByName("guide").bottom + 5 : _window.findChildByName("achievements").bottom + 5;
      }
      
      public function toggleVisibility() : void
      {
         var _loc1_:Boolean = false;
         if(var_1743 != null)
         {
            var_1743.dispose();
            var_1743 = null;
         }
         _window.visible = true;
         if(false)
         {
            if(!toolbar.getBoolean("talent.track.enabled"))
            {
               _window.findChildByName("guide").rectangle = _window.findChildByName("talents").rectangle;
               _window.findChildByName("talents").visible = false;
            }
            if(_toolbar.getBoolean("guides.enabled"))
            {
               _loc1_ = _toolbar.sessionDataManager.isPerkAllowed("USE_GUIDE_TOOL");
               setGuideToolVisibility(_loc1_);
            }
         }
         reposition();
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(var_1743 != null)
         {
            var_1743.dispose();
            var_1743 = null;
         }
         var_3356.dispose();
         var_3356 = null;
         _toolbar.events.removeEventListener("HTE_TOOLBAR_CLICK",onToolbarClick);
         var_1527 = null;
         _toolbar = null;
      }
      
      public function get disposed() : Boolean
      {
         return _toolbar == null;
      }
      
      public function get toolbar() : HabboToolbar
      {
         return _toolbar;
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
      
      public function reposition() : void
      {
         _window.x = var_1527.window.width + 10;
         _window.y = var_1527.window.bottom - 0;
      }
      
      public function getUnseenItemCounter(param1:String) : class_3151
      {
         var _loc2_:class_3151 = null;
         var _loc4_:*;
         if(!(_loc4_ = param1))
         {
            class_14.log("[Toolbar] Unknown icon type for unseen item counter for iconId: " + param1);
         }
         var _loc3_:class_3151 = _unseenItemCounters.getValue(param1) as class_3151;
         if(!_loc3_)
         {
            _loc3_ = _toolbar.windowManager.createUnseenItemCounter();
            _loc2_ = _window.findChildByName(_loc4_) as class_3151;
            if(_loc2_)
            {
               _loc2_.addChild(_loc3_);
               _loc3_.x = _loc2_.width - _loc3_.width - 5;
               _loc3_.y = 5;
               _unseenItemCounters.add(param1,_loc3_);
            }
         }
         return _loc3_;
      }
      
      public function set achievementCount(param1:int) : void
      {
         setUnseenItemCount("achievements",param1);
      }
      
      public function set minimailCount(param1:int) : void
      {
         setUnseenItemCount("minimail",param1);
      }
      
      public function set newUiEnabled(param1:Boolean) : void
      {
         var_3791 = param1;
      }
      
      public function setUnseenItemCount(param1:String, param2:int) : void
      {
         var _loc3_:class_3151 = getUnseenItemCounter(param1);
         if(!_loc3_)
         {
            return;
         }
         if(param2 < 0)
         {
            _loc3_.visible = true;
            _loc3_.findChildByName("count").caption = " ";
         }
         else if(param2 > 0)
         {
            _loc3_.visible = true;
            _loc3_.findChildByName("count").caption = param2.toString();
         }
         else
         {
            _loc3_.visible = false;
         }
      }
   }
}

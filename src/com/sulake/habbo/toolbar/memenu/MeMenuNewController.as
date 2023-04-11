package com.sulake.habbo.toolbar.memenu
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.navigator.class_1685;
   import com.sulake.habbo.toolbar.BottomBarLeft;
   import com.sulake.habbo.toolbar.HabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.geom.Rectangle;
   import package_7.class_313;
   import package_80.class_956;
   
   public class MeMenuNewController implements class_13
   {
      
      public static const USE_GUIDE_TOOL:String = "USE_GUIDE_TOOL";
       
      
      private var _toolbar:HabboToolbar;
      
      private var var_1527:BottomBarLeft;
      
      private var _window:class_3151;
      
      private var var_3356:com.sulake.habbo.toolbar.memenu.MeMenuNewIconLoader;
      
      private var var_1743:com.sulake.habbo.toolbar.memenu.MeMenuSettingsMenuView;
      
      private var _unseenItemCounters:class_24;
      
      public function MeMenuNewController(param1:HabboToolbar, param2:BottomBarLeft)
      {
         super();
         _unseenItemCounters = new class_24();
         _toolbar = param1;
         var_1527 = param2;
         _toolbar.events.addEventListener("HTE_TOOLBAR_CLICK",onToolbarClick);
         var _loc3_:XmlAsset = _toolbar.assets.getAssetByName("me_menu_new_view_xml") as XmlAsset;
         _window = _toolbar.windowManager.buildFromXML(_loc3_.content as XML,2) as class_3151;
         var_3356 = new com.sulake.habbo.toolbar.memenu.MeMenuNewIconLoader(_toolbar);
         _window.visible = false;
         _window.procedure = windowProcedure;
         if(!_toolbar.getBoolean("guides.enabled"))
         {
            setGuideToolVisibility(false);
         }
         setMinimailVisibility(false);
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         var _loc7_:IRegionWindow = null;
         var _loc6_:IStaticBitmapWrapperWindow = null;
         var _loc4_:IStaticBitmapWrapperWindow = null;
         var _loc5_:ITextWindow = null;
         var _loc3_:class_1685 = null;
         var _loc8_:String = null;
         if(param2 is IRegionWindow)
         {
            _loc6_ = (_loc7_ = param2 as IRegionWindow).findChildByName(param2.name + "_icon_color") as IStaticBitmapWrapperWindow;
            _loc4_ = _loc7_.findChildByName(param2.name + "_icon_grey") as IStaticBitmapWrapperWindow;
            _loc5_ = _loc7_.findChildByName("field_text") as ITextWindow;
            loop0:
            switch(param1.type)
            {
               case "WME_OVER":
                  if(_loc6_ != null && _loc4_ != null)
                  {
                     _loc6_.visible = true;
                     _loc4_.visible = false;
                     if(_loc5_ != null)
                     {
                        _loc5_.textColor = 2215924;
                        break;
                     }
                     break;
                  }
                  break;
               case "WME_OUT":
                  if(_loc6_ != null && _loc4_ != null)
                  {
                     _loc6_.visible = false;
                     _loc4_.visible = true;
                     if(_loc5_ != null)
                     {
                        _loc5_.textColor = 16777215;
                        break;
                     }
                     break;
                  }
                  break;
               case "WME_CLICK":
                  _window.visible = false;
                  if(_toolbar != null)
                  {
                     switch(param2.name)
                     {
                        case "profile":
                           _toolbar.connection.send(new class_313(_toolbar.sessionDataManager.userId));
                           break loop0;
                        case "minimail":
                           HabboWebTools.openMinimail("#mail/inbox/");
                           break loop0;
                        case "rooms":
                           _loc3_ = _toolbar.navigator;
                           if(_loc3_ != null)
                           {
                              _loc3_.showOwnRooms();
                              break loop0;
                           }
                           break loop0;
                        case "talents":
                           _loc8_ = _toolbar.sessionDataManager.currentTalentTrack;
                           _toolbar.connection.send(new class_956(_loc8_));
                           break loop0;
                        case "settings":
                           break loop0;
                        case "achievements":
                           _toolbar.questEngine.showAchievements();
                           break loop0;
                        case "guide":
                           _toolbar.toggleWindowVisibility("GUIDE");
                           break loop0;
                        case "clothes":
                           _toolbar.context.createLinkEvent("avatareditor/open");
                           break loop0;
                        case "forums":
                           _toolbar.context.createLinkEvent("groupforum/list/my");
                     }
                  }
            }
         }
      }
      
      private function onToolbarClick(param1:HabboToolbarEvent) : void
      {
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
      
      private function setMinimailVisibility(param1:Boolean) : void
      {
         _window.findChildByName("minimail").visible = param1;
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
         _window.x = 3;
         _window.y = var_1527.window.top - 0;
      }
      
      public function getIconPosition(param1:String) : Rectangle
      {
         var _loc2_:Rectangle = null;
         var _loc3_:class_3127 = _window.findChildByName(param1);
         if(_loc3_)
         {
            _loc2_ = _loc3_.rectangle;
            _loc2_.x += _window.x + _loc3_.width / 2;
            _loc2_.y += _window.y + _loc3_.height / 2;
            _window.visible = true;
         }
         return _loc2_;
      }
      
      public function getIcon(param1:String) : class_3127
      {
         var _loc2_:class_3127 = _window.findChildByName(param1);
         if(_loc2_)
         {
            _window.visible = true;
         }
         return _loc2_;
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
      
      public function set unseenAchievementsCount(param1:int) : void
      {
         setUnseenItemCount("achievements",param1);
      }
      
      public function set unseenMinimailsCount(param1:int) : void
      {
         setUnseenItemCount("minimail",param1);
      }
      
      public function set unseenForumsCount(param1:int) : void
      {
         setUnseenItemCount("forums",param1);
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

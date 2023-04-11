package com.sulake.habbo.friendbar.landingview.widget
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.friendbar.landingview.*;
   import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
   import com.sulake.habbo.window.widgets.class_3308;
   import package_7.class_313;
   import package_83.class_1658;
   
   public class UserListWidget implements ILandingViewWidget
   {
       
      
      private var _landingView:HabboLandingView;
      
      private var _container:class_3151;
      
      private var _popup:class_3151;
      
      private var _startOffset:int = 150;
      
      private var var_2467:Array;
      
      private var var_2953:Array;
      
      private var var_4125:Array;
      
      public function UserListWidget(param1:HabboLandingView)
      {
         var_2467 = [0,10,5,0,5,10,0,10,5,10];
         var_2953 = [];
         var_4125 = [2,4,2,2,4,2,2,2,4,2];
         super();
         _landingView = param1;
      }
      
      public function get container() : class_3127
      {
         return _container;
      }
      
      public function dispose() : void
      {
         _landingView = null;
         _container = null;
         if(_popup != null)
         {
            _popup.dispose();
            _popup = null;
         }
      }
      
      public function initialize() : void
      {
         _container = class_3151(_landingView.getXmlWindow("user_list"));
         registerMessageListeners();
      }
      
      public function refresh() : void
      {
      }
      
      public function get disposed() : Boolean
      {
         return _landingView == null;
      }
      
      public function refreshContent() : void
      {
         if(users == null)
         {
            _container.visible = false;
            return;
         }
         _container.visible = true;
         refreshList();
         backToDefaultPopup();
      }
      
      private function refreshList() : void
      {
         var _loc5_:int = 0;
         var _loc6_:class_3151 = null;
         var _loc1_:class_1658 = null;
         var _loc3_:class_3217 = null;
         var _loc4_:class_3308 = null;
         var _loc2_:int = _startOffset;
         _loc5_ = 0;
         while(_loc5_ < 10)
         {
            if((_loc6_ = getAvatarContainer(_loc5_)) == null)
            {
               _loc6_ = createAvatarContainer(_loc5_);
               _container.addChild(_loc6_);
               _loc6_.x = _loc2_;
               _loc2_ += _loc6_.width;
            }
            _loc1_ = users[_loc5_];
            _loc6_.visible = _loc1_ != null;
            if(_loc1_)
            {
               _loc3_ = class_3217(_loc6_.findChildByName("avatar_image_widget"));
               (_loc4_ = class_3308(_loc3_.widget)).figure = _loc1_.figure;
            }
            _loc5_++;
         }
      }
      
      private function getAvatarContainer(param1:int) : class_3151
      {
         return class_3151(_container.getChildByID(param1));
      }
      
      private function createAvatarContainer(param1:int) : class_3151
      {
         var _loc3_:class_3151 = class_3151(_landingView.getXmlWindow("user_entry"));
         setupVariation(_loc3_,param1);
         _loc3_.procedure = onEntry;
         _loc3_.id = param1;
         if(var_2953.length > param1)
         {
            _loc3_.width = var_2953[param1];
         }
         var _loc2_:class_3127 = _loc3_.findChildByName("extra_link_region");
         _loc2_.visible = hasExtraLink();
         _loc2_.procedure = onExtraLink;
         _loc2_.id = param1;
         return _loc3_;
      }
      
      private function setupVariation(param1:class_3151, param2:int) : void
      {
         var _loc3_:class_3217 = class_3217(param1.findChildByName("avatar_image_widget"));
         var _loc4_:class_3308 = class_3308(_loc3_.widget);
         param1.y += NaN;
         if(false)
         {
            param1.height += 0;
         }
         _loc4_.direction = var_4125[param2];
         param1.findChildByName("extra_link_region").y = param1.findChildByName("extra_link_region").y - 0;
      }
      
      private function getEntry(param1:class_3127) : class_1658
      {
         var _loc2_:int = param1.id;
         return users[_loc2_];
      }
      
      private function onEntry(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:class_1658 = getEntry(param2);
         if(_loc3_ == null)
         {
            return;
         }
         if(param1.type == "WME_CLICK")
         {
            _landingView.send(new class_313(_loc3_.userId));
         }
         else if(param1.type == "WME_OVER")
         {
            showPopup(_loc3_,param2);
         }
         else if(param1.type == "WME_OUT")
         {
            backToDefaultPopup();
         }
      }
      
      private function onExtraLink(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:class_1658 = null;
         if(param1.type == "WME_CLICK")
         {
            _loc3_ = getEntry(param2);
            if(_loc3_ == null)
            {
               return;
            }
            extraLinkClicked(_loc3_);
         }
         else
         {
            onEntry(param1,param2.parent);
         }
      }
      
      private function showPopup(param1:class_1658, param2:class_3127) : void
      {
         if(_popup == null)
         {
            _popup = class_3151(_landingView.getXmlWindow(getPopupXml()));
            _container.addChild(_popup);
         }
         refreshPopup(param1,_popup);
         _popup.y = Math.max(0,79);
         _popup.x = param2.x + (param2.width - 0) / 2;
         _popup.visible = true;
      }
      
      private function backToDefaultPopup() : void
      {
         if(false)
         {
            showPopup(users[0],_container.getChildByID(0));
         }
         else if(_popup != null)
         {
            _popup.visible = false;
         }
      }
      
      protected function get landingView() : HabboLandingView
      {
         return _landingView;
      }
      
      protected function getText(param1:String) : String
      {
         return "${" + param1 + "}";
      }
      
      protected function registerMessageListeners() : void
      {
      }
      
      protected function get users() : Array
      {
         return null;
      }
      
      protected function refreshPopup(param1:class_1658, param2:class_3151) : void
      {
      }
      
      protected function getPopupXml() : String
      {
         return null;
      }
      
      protected function hasExtraLink() : Boolean
      {
         return false;
      }
      
      protected function extraLinkClicked(param1:class_1658) : void
      {
      }
      
      protected function set avatarOffsetsY(param1:Array) : void
      {
         var_2467 = param1;
      }
      
      protected function set avatarContainerWidths(param1:Array) : void
      {
         var_2953 = param1;
      }
      
      public function set startOffset(param1:int) : void
      {
         _startOffset = param1;
      }
   }
}

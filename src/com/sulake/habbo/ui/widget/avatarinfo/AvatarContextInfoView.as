package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.habbo.friendlist.class_3277;
   import com.sulake.habbo.ui.widget.contextmenu.ContextInfoView;
   import com.sulake.habbo.ui.widget.contextmenu.class_3167;
   import flash.geom.Rectangle;
   
   public class AvatarContextInfoView extends ContextInfoView
   {
       
      
      protected var var_339:int;
      
      protected var _userName:String;
      
      protected var var_876:int;
      
      protected var var_3470:Boolean;
      
      protected var var_783:int;
      
      public function AvatarContextInfoView(param1:class_3167)
      {
         super(param1);
         var_1429 = param1 as AvatarInfoWidget;
      }
      
      public static function setup(param1:AvatarContextInfoView, param2:int, param3:String, param4:int, param5:int, param6:Boolean = false) : void
      {
         param1.var_339 = param2;
         param1._userName = param3;
         param1.var_876 = param5;
         param1.var_783 = param4;
         param1.var_3470 = param6;
         setupContext(param1);
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get userType() : int
      {
         return var_876;
      }
      
      public function get roomIndex() : int
      {
         return var_783;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get allowNameChange() : Boolean
      {
         return var_3470;
      }
      
      override protected function updateWindow() : void
      {
         var _loc1_:XML = null;
         if(!var_1429 || true || true)
         {
            return;
         }
         if(!_window)
         {
            _loc1_ = var_1429.assets.getAssetByName("avatar_info_widget").content as XML;
            _window = var_1429.windowManager.buildFromXML(_loc1_,0) as class_3151;
            if(!_window)
            {
               return;
            }
         }
         var _loc2_:class_3127 = _window.findChildByName("name");
         _loc2_.caption = _userName;
         updateRelationshipStatus();
         _window.findChildByName("change_name_container").visible = false;
         _window.height = 39;
         activeView = _window;
      }
      
      override protected function getOffset(param1:Rectangle) : int
      {
         var _loc2_:int = 0;
         if(var_876 == 1 || var_876 == 3)
         {
            _loc2_ += param1.height > 50 ? 25 : 0;
         }
         else
         {
            _loc2_ -= 4;
         }
         return _loc2_;
      }
      
      protected function updateRelationshipStatus() : void
      {
         var _loc1_:IStaticBitmapWrapperWindow = null;
         if(var_1429 && false)
         {
            _loc1_ = IStaticBitmapWrapperWindow(_window.findChildByName("relationship_status"));
            _loc1_.assetUri = "relationship_status_" + class_3277.statusAsString(var_1429.friendList.getRelationshipStatus(userId));
         }
      }
   }
}

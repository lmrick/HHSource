package com.sulake.habbo.inventory.badges
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.widgets.class_3366;
   
   public class Badge
   {
      
      public static var var_3029:class_3151;
      
      private static const THUMB_COLOR_NORMAL:int = 13421772;
      
      private static const THUMB_COLOR_UNSEEN:int = 10275685;
       
      
      private var var_1420:Boolean = false;
      
      private var var_484:String;
      
      private var var_3237:Boolean;
      
      private var var_3103:Boolean;
      
      private var _window:class_3151;
      
      private var var_2043:class_3127;
      
      private var _isUnseen:Boolean;
      
      private var _name:String;
      
      private var _desc:String;
      
      private var var_1443:com.sulake.habbo.inventory.badges.BadgesModel;
      
      public function Badge(param1:com.sulake.habbo.inventory.badges.BadgesModel, param2:String, param3:String, param4:String, param5:Boolean)
      {
         super();
         var_1443 = param1;
         var_484 = param2;
         _name = param3;
         _desc = param4;
         _isUnseen = param5;
         this.isSelected = false;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function get badgeId() : String
      {
         return var_484;
      }
      
      public function get badgeName() : String
      {
         return _name;
      }
      
      public function get badgeDescription() : String
      {
         return _desc;
      }
      
      public function get isInUse() : Boolean
      {
         return var_3237;
      }
      
      public function get isSelected() : Boolean
      {
         return var_3103;
      }
      
      public function get window() : class_3151
      {
         if(!var_1420)
         {
            initWindow();
         }
         return _window;
      }
      
      private function initWindow() : void
      {
         _window = var_3029.clone() as class_3151;
         class_3366(class_3217(_window.findChildByName("badge")).widget).badgeId = badgeId;
         _window.findChildByName("badge").visible = true;
         var_2043 = _window.findChildByTag("BG_COLOR");
         var_1420 = true;
         _window.procedure = itemEventProc;
      }
      
      private function itemEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:* = param1.type;
         if("WME_CLICK" === _loc3_)
         {
            var_1443.setBadgeSelected(this.badgeId);
         }
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_3237 = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         var_3103 = param1;
         if(var_2043 == null || _window == null)
         {
            return;
         }
         var_2043.color = _isUnseen ? 10275685 : 13421772;
         _window.findChildByName("outline").visible = param1;
      }
      
      public function set isUnseen(param1:Boolean) : void
      {
         if(_isUnseen != param1)
         {
            _isUnseen = param1;
            this.isSelected = var_3103;
         }
      }
   }
}

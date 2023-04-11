package com.sulake.habbo.ui.widget.chatinput.styleselector
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.class_3213;
   import com.sulake.habbo.session.ISessionDataManager;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ChatStyleGridView implements class_13
   {
      
      private static const SCREEN_LEFT_BORDER:int = 92;
       
      
      private var _window:class_3213;
      
      private var var_3549:com.sulake.habbo.ui.widget.chatinput.styleselector.ChatStyleSelector;
      
      public function ChatStyleGridView(param1:com.sulake.habbo.ui.widget.chatinput.styleselector.ChatStyleSelector, param2:ISessionDataManager)
      {
         super();
         var_3549 = param1;
         var _loc3_:class_21 = param1.chatInputView.widget.assets;
         _window = class_3213(param1.chatInputView.widget.windowManager.buildFromXML(XML(_loc3_.getAssetByName("styleselector_menu_new_xml").content)));
         _window.visible = false;
      }
      
      public function dispose() : void
      {
         _window.dispose();
         _window = null;
         var_3549 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _window == null;
      }
      
      public function get grid() : IItemGridWindow
      {
         return IItemGridWindow(_window.findChildByName("itemgrid"));
      }
      
      public function get window() : class_3213
      {
         return _window;
      }
      
      public function alignToSelector(param1:class_3151) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Rectangle = new Rectangle();
         param1.getGlobalRectangle(_loc4_);
         var _loc3_:class_3151 = class_3151(_window.parent);
         _loc3_.x = _loc4_.right - 0;
         _loc3_.y = _loc4_.bottom - 0;
         var _loc5_:Point = new Point();
         _loc3_.getGlobalPosition(_loc5_);
         if(_loc5_.x < 92)
         {
            _loc2_ = 92 - _loc5_.x;
            _loc3_.x += _loc2_;
         }
         _loc3_.x = _loc4_.x;
         _loc3_.y = _loc4_.bottom - 35 - 0;
      }
   }
}

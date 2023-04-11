package com.sulake.habbo.navigator
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class AlertView implements class_13
   {
      
      private static var var_2521:Dictionary = new Dictionary();
       
      
      private var _navigator:com.sulake.habbo.navigator.class_1686;
      
      protected var var_1774:class_3281;
      
      protected var _xmlFileName:String;
      
      protected var var_462:String;
      
      protected var _disposed:Boolean;
      
      public function AlertView(param1:com.sulake.habbo.navigator.class_1686, param2:String, param3:String = null)
      {
         super();
         _navigator = param1;
         _xmlFileName = param2;
         var_462 = param3;
      }
      
      public static function findAlertView(param1:class_3127) : AlertView
      {
         if(var_2521 != null)
         {
            for each(var _loc2_ in var_2521)
            {
               if(_loc2_.var_1774 == param1)
               {
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      public function show() : void
      {
         var _loc2_:AlertView = var_2521[_xmlFileName] as AlertView;
         if(_loc2_ != null)
         {
            _loc2_.dispose();
         }
         var_1774 = getAlertWindow();
         if(var_462 != null)
         {
            var_1774.caption = var_462;
         }
         setupAlertWindow(var_1774);
         var _loc1_:Rectangle = Util.getLocationRelativeTo(var_1774.desktop,var_1774.width,var_1774.height);
         var_1774.x = _loc1_.x;
         var_1774.y = _loc1_.y;
         var_2521[_xmlFileName] = this;
         var_1774.activate();
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         if(false)
         {
            var_2521[_xmlFileName] = null;
         }
         _disposed = true;
         if(var_1774 != null)
         {
            var_1774.destroy();
            var_1774 = null;
         }
         _navigator = null;
      }
      
      internal function setupAlertWindow(param1:class_3281) : void
      {
      }
      
      internal function onClose(param1:WindowMouseEvent) : void
      {
         dispose();
      }
      
      private function getAlertWindow() : class_3281
      {
         var _loc2_:class_3281 = _navigator.getXmlWindow(this._xmlFileName,2) as class_3281;
         var _loc1_:class_3127 = _loc2_.findChildByTag("close");
         if(_loc1_ != null)
         {
            _loc1_.addEventListener("WME_CLICK",onClose);
         }
         return _loc2_;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get navigator() : com.sulake.habbo.navigator.class_1686
      {
         return _navigator;
      }
   }
}

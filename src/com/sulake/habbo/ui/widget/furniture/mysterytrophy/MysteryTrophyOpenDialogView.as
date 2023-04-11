package com.sulake.habbo.ui.widget.furniture.mysterytrophy
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;
   import com.sulake.habbo.window.class_1684;
   import package_21.class_529;
   
   public class MysteryTrophyOpenDialogView implements class_13
   {
      
      private static const const_563:String = "header_button_close";
      
      private static const const_530:String = "cancel";
      
      private static const const_515:String = "ok";
       
      
      private var _window:class_3151;
      
      private var _disposed:Boolean = false;
      
      private var var_1429:FurnitureContextMenuWidget;
      
      private var _windowManager:class_1684;
      
      private var _assets:class_21;
      
      private var var_3004:int;
      
      public function MysteryTrophyOpenDialogView(param1:FurnitureContextMenuWidget)
      {
         super();
         var_1429 = param1;
         _windowManager = param1.windowManager;
         _assets = var_1429.assets;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         _disposed = true;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function open(param1:int) : void
      {
         var_3004 = param1;
         setWindowContent();
         _window.visible = true;
      }
      
      private function setWindowContent() : void
      {
         var _loc1_:String = null;
         if(!_window)
         {
            _loc1_ = "mysterytrophy_xml";
            _window = _windowManager.buildFromXML(_assets.getAssetByName(_loc1_).content as XML) as class_3151;
            addClickListener("ok");
            addClickListener("cancel");
            addClickListener("header_button_close");
            _window.center();
         }
      }
      
      public function close() : void
      {
         if(_window != null)
         {
            _window.visible = false;
         }
      }
      
      private function addClickListener(param1:String) : void
      {
         _window.findChildByName(param1).addEventListener("WME_CLICK",onMouseClick);
      }
      
      private function onMouseClick(param1:WindowMouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.target.name)
         {
            case "header_button_close":
            case "cancel":
               close();
               break;
            case "ok":
               _loc2_ = getTrophyInscription();
               connection.send(new class_529(var_3004,_loc2_));
               close();
         }
      }
      
      private function getTrophyInscription() : String
      {
         var _loc1_:ITextFieldWindow = null;
         if(_window)
         {
            _loc1_ = _window.findChildByName("input") as ITextFieldWindow;
            if(_loc1_)
            {
               return _loc1_.text;
            }
         }
         return null;
      }
      
      private function get connection() : IConnection
      {
         return var_1429.handler.container.connection;
      }
   }
}

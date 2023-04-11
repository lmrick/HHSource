package com.sulake.habbo.friendbar.view.tabs
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.WindowMouseEvent;
   
   public class NewOpenMessengerTab extends Tab
   {
      
      protected static const ICON:String = "icon";
      
      protected static const HEADER:String = "header";
      
      private static const const_498:String = "new_open_messenger_tab_xml";
      
      private static const DEFAULT_COLOR:uint = 8374494;
      
      private static const const_567:uint = 9560569;
      
      private static const FRIENDS_Y_PADDING:int = 10;
      
      private static const const_421:Array = [];
      
      private static const const_420:Array = [];
       
      
      public function NewOpenMessengerTab()
      {
         super();
      }
      
      public static function allocate() : NewOpenMessengerTab
      {
         var _loc1_:NewOpenMessengerTab = const_421.length > 0 ? const_421.pop() : new NewOpenMessengerTab();
         _loc1_.var_1501 = false;
         _loc1_._window = _loc1_.allocateEntityWindow();
         return _loc1_;
      }
      
      public function allocateEntityWindow() : class_3151
      {
         var _loc1_:class_3151 = const_420.length > 0 ? const_420.pop() : WINDOWING.buildFromXML(ASSETS.getAssetByName("new_open_messenger_tab_xml").content as XML) as class_3151;
         _loc1_.addEventListener("WME_CLICK",onButtonClick);
         _loc1_.addEventListener("WME_OVER",onMouseOver);
         _loc1_.addEventListener("WME_OUT",onMouseOut);
         _loc1_.height = HEIGHT;
         return _loc1_;
      }
      
      private function releaseEntityWindow(param1:class_3151) : void
      {
         if(param1 && !param1.disposed)
         {
            param1.procedure = null;
            param1.removeEventListener("WME_CLICK",onMouseClick);
            param1.removeEventListener("WME_OVER",onMouseOver);
            param1.removeEventListener("WME_OUT",onMouseOut);
            param1.width = WIDTH;
            param1.height = HEIGHT;
            if(const_420.indexOf(param1) == -1)
            {
               const_420.push(param1);
            }
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
         _window.color = exposed ? 9560569 : 8374494;
      }
      
      override protected function conceal() : void
      {
         super.conceal();
         _window.color = exposed ? 9560569 : 8374494;
      }
      
      private function onButtonClick(param1:WindowMouseEvent) : void
      {
         if(!disposed && !recycled)
         {
            DATA.toggleMessenger();
         }
      }
   }
}

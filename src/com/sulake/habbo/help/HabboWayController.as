package com.sulake.habbo.help
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.utils.IModalDialog;
   import com.sulake.habbo.window.widgets.class_3293;
   
   public class HabboWayController
   {
       
      
      private const START_PAGE:int = 0;
      
      private var var_1065:int = 0;
      
      private var var_1622:int = 0;
      
      private var _habboHelp:com.sulake.habbo.help.HabboHelp;
      
      private var var_1680:IModalDialog;
      
      private var _window:class_3151;
      
      private var _disposed:Boolean = false;
      
      public function HabboWayController(param1:com.sulake.habbo.help.HabboHelp)
      {
         super();
         _habboHelp = param1;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            closeWindow();
            if(_habboHelp)
            {
               _habboHelp = null;
            }
            _disposed = true;
         }
      }
      
      private function get finalPage() : int
      {
         return _habboHelp.getInteger("help.habboway.page.count",6);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function showHabboWay() : void
      {
         closeWindow();
         var_1680 = _habboHelp.getModalXmlWindow("habbo_way");
         _window = class_3151(var_1680.rootWindow);
         _window.procedure = onWindowEvent;
         class_3293(class_3217(_window.findChildByName("page_widget")).widget).size = finalPage;
         setCurrentPage(0);
      }
      
      public function closeWindow() : void
      {
         _window = null;
         if(var_1680)
         {
            var_1680.dispose();
            var_1680 = null;
         }
      }
      
      private function onWindowEvent(param1:class_3134, param2:class_3127) : void
      {
         if(_disposed || !_window || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "header_button_close":
               closeWindow();
               break;
            case "next_button":
               setCurrentPage(Math.min(finalPage,var_1622 + 1));
               _habboHelp.trackGoogle("habboWay","clickNextPage_" + var_1622);
               break;
            case "back_button":
            case "previous_button":
               setCurrentPage(Math.max(0,var_1622 - 1));
               _habboHelp.trackGoogle("habboWay","clickPrevPage_" + var_1622);
               break;
            case "quiz_button":
               _habboHelp.trackGoogle("habboWay","clickQuiz");
               _habboHelp.showHabboWayQuiz();
         }
      }
      
      private function setCurrentPage(param1:int) : void
      {
         var_1622 = param1;
         if(var_1622 < finalPage)
         {
            if(var_1622 == 0)
            {
               _window.findChildByName("previous_button").visible = false;
            }
            else
            {
               _window.findChildByName("previous_button").visible = true;
            }
            IStaticBitmapWrapperWindow(_window.findChildByName("illustration")).assetUri = "${image.library.url}habboway/page_" + var_1622 + ".png";
            IStaticBitmapWrapperWindow(_window.findChildByName("dove_image")).assetUri = "help_habboway_dove_off";
            class_3293(class_3217(_window.findChildByName("page_widget")).widget).position = var_1622 + 1;
            _window.findChildByName("correct_title").caption = "${habbo.way.page." + var_1622 + ".correct.title}";
            _window.findChildByName("correct_description").caption = "${habbo.way.page." + var_1622 + ".correct.description}";
            _window.findChildByName("wrong_title").caption = "${habbo.way.page." + var_1622 + ".wrong.title}";
            _window.findChildByName("wrong_description").caption = "${habbo.way.page." + var_1622 + ".wrong.description}";
            _window.findChildByName("page_container").visible = true;
            _window.findChildByName("final_page").visible = false;
            _window.findChildByName("page_container").invalidate();
         }
         else
         {
            IStaticBitmapWrapperWindow(_window.findChildByName("illustration")).assetUri = "${image.library.url}habboway/page_end.png";
            IStaticBitmapWrapperWindow(_window.findChildByName("dove_image")).assetUri = "help_habboway_dove_on";
            class_3293(class_3217(_window.findChildByName("page_widget")).widget).position = 0;
            _window.findChildByName("page_container").visible = false;
            _window.findChildByName("final_page").visible = true;
            _window.findChildByName("final_page").invalidate();
         }
      }
   }
}

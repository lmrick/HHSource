package com.sulake.habbo.avatar.legs
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.avatar.common.CategoryBaseView;
   import com.sulake.habbo.avatar.common.class_3319;
   import com.sulake.habbo.avatar.common.class_3414;
   
   public class LegsView extends CategoryBaseView implements class_3414
   {
       
      
      public function LegsView(param1:class_3319)
      {
         super(param1);
      }
      
      override public function init() : void
      {
         if(!_window)
         {
            _window = var_1443.controller.view.getCategoryContainer("legs") as class_3151;
            _window.visible = false;
            _window.procedure = windowEventProc;
         }
         var_1420 = true;
         if(var_1443 && var_1508 == "")
         {
            var_1443.switchCategory("lg");
         }
      }
      
      public function switchCategory(param1:String) : void
      {
         if(_window == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         param1 = param1 == "" ? var_1508 : param1;
         inactivateTab(_currentTabName);
         switch(param1)
         {
            case "lg":
               _currentTabName = "tab_pants";
               break;
            case "sh":
               _currentTabName = "tab_shoes";
               break;
            case "wa":
               _currentTabName = "tab_belts";
               break;
            default:
               throw new Error("[LegsView] Unknown item category: \"" + param1 + "\"");
         }
         var_1508 = param1;
         activateTab(_currentTabName);
         if(!var_1420)
         {
            init();
         }
         updateGridView(var_1508);
      }
      
      private function windowEventProc(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            switch(param2.name)
            {
               case "tab_pants":
                  switchCategory("lg");
                  break;
               case "tab_shoes":
                  switchCategory("sh");
                  break;
               case "tab_belts":
                  switchCategory("wa");
            }
         }
         else if(param1.type == "WME_OVER")
         {
            switch(param2.name)
            {
               case "tab_pants":
               case "tab_shoes":
               case "tab_belts":
                  activateTab(param2.name);
            }
         }
         else if(param1.type == "WME_OUT")
         {
            switch(param2.name)
            {
               case "tab_pants":
               case "tab_shoes":
               case "tab_belts":
                  if(_currentTabName != param2.name)
                  {
                     inactivateTab(param2.name);
                     break;
                  }
            }
         }
      }
   }
}

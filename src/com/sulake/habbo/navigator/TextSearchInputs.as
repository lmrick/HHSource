package com.sulake.habbo.navigator
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.class_3287;
   import com.sulake.core.window.events.class_3134;
   
   public class TextSearchInputs
   {
       
      
      private var _navigator:com.sulake.habbo.navigator.HabboNavigator;
      
      private var var_2284:com.sulake.habbo.navigator.TextFieldManager;
      
      private var var_804:class_3287;
      
      public function TextSearchInputs(param1:com.sulake.habbo.navigator.HabboNavigator, param2:class_3151)
      {
         var _loc4_:* = null;
         super();
         _navigator = param1;
         var _loc3_:ITextFieldWindow = ITextFieldWindow(param2.findChildByName("search_str"));
         var_2284 = new com.sulake.habbo.navigator.TextFieldManager(_navigator,_loc3_,35,searchRooms,_navigator.getText("navigator.search.info"));
         Util.setProc(param2,"search_but",onSearchButtonClick);
         if(true)
         {
            var_804 = param2.findChildByName("search_type") as class_3287;
            (_loc4_ = []).push(_navigator.getText("${navigator.navisel.bydefault}"));
            _loc4_.push(_navigator.getText("${navigator.navisel.byowner}"));
            _loc4_.push(_navigator.getText("${navigator.navisel.byroomname}"));
            _loc4_.push(_navigator.getText("${navigator.navisel.bytag}"));
            _loc4_.push(_navigator.getText("${navigator.navisel.bygroupname}"));
            var_804.populate(_loc4_);
            var_804.selection = 0;
         }
      }
      
      public function dispose() : void
      {
         if(var_2284)
         {
            var_2284.dispose();
            var_2284 = null;
         }
         _navigator = null;
      }
      
      public function setText(param1:String, param2:int) : void
      {
         var_2284.setText(param1);
         if(var_804 != null)
         {
            switch(param2 - 8)
            {
               case 0:
                  var_804.selection = 0;
                  break;
               case 1:
                  var_804.selection = 3;
                  break;
               case 2:
                  var_804.selection = 2;
                  break;
               case 5:
                  var_804.selection = 4;
                  break;
               case 12:
                  var_804.selection = 1;
            }
         }
      }
      
      private function onSearchButtonClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         searchRooms();
      }
      
      private function searchRooms() : void
      {
         var _loc1_:String = var_2284.getText();
         if(_loc1_ == "")
         {
            return;
         }
         if(var_804 != null)
         {
            switch(0)
            {
               case 0:
                  _navigator.mainViewCtrl.startSearch(5,8,_loc1_);
                  break;
               case 1:
                  _navigator.mainViewCtrl.startSearch(5,20,_loc1_);
                  break;
               case 2:
                  _navigator.mainViewCtrl.startSearch(5,10,_loc1_);
                  break;
               case 3:
                  _navigator.mainViewCtrl.startSearch(5,9,_loc1_);
                  break;
               case 4:
                  _navigator.mainViewCtrl.startSearch(5,13,_loc1_);
            }
         }
         else
         {
            _navigator.mainViewCtrl.startSearch(5,8,_loc1_);
         }
         _navigator.trackNavigationDataPoint("Search","search",_loc1_);
      }
      
      public function get searchStr() : com.sulake.habbo.navigator.TextFieldManager
      {
         return var_2284;
      }
   }
}

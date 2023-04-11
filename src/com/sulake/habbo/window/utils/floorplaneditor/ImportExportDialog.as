package com.sulake.habbo.window.utils.floorplaneditor
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import package_105.class_875;
   
   public class ImportExportDialog
   {
       
      
      private var _bcFloorPlanEditor:com.sulake.habbo.window.utils.floorplaneditor.BCFloorPlanEditor;
      
      private var _layout:XML;
      
      private var _window:class_3281 = null;
      
      public function ImportExportDialog(param1:com.sulake.habbo.window.utils.floorplaneditor.BCFloorPlanEditor, param2:XML)
      {
         super();
         _bcFloorPlanEditor = param1;
         _layout = param2;
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(_window == null)
         {
            _window = class_3281(_bcFloorPlanEditor.windowManager.buildFromXML(_layout));
            _window.center();
            _window.procedure = windowProcedure;
         }
         if(param1)
         {
            _window.visible = true;
            _window.findChildByName("data").caption = _bcFloorPlanEditor.floorPlanCache.getData();
            if(_bcFloorPlanEditor.windowManager.sessionDataManager.hasSecurity(4))
            {
               _window.findChildByName("save").enable();
            }
            else
            {
               _window.findChildByName("save").disable();
            }
            _window.activate();
         }
         else
         {
            _window.visible = false;
         }
      }
      
      public function get visible() : Boolean
      {
         if(!_window)
         {
            return false;
         }
         return _window.visible;
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            switch(param2.name)
            {
               case "header_button_close":
                  visible = false;
                  break;
               case "revert":
                  _window.findChildByName("data").caption = _bcFloorPlanEditor.lastReceivedFloorPlan;
                  break;
               case "save":
                  _bcFloorPlanEditor.windowManager.communication.connection.send(new class_875(_window.findChildByName("data").caption,_bcFloorPlanEditor.floorPlanCache.entryPoint.x,_bcFloorPlanEditor.floorPlanCache.entryPoint.y,_bcFloorPlanEditor.floorPlanCache.entryPointDir,com.sulake.habbo.window.utils.floorplaneditor.BCFloorPlanEditor.getThicknessSettingBySelectionIndex(_bcFloorPlanEditor.wallThickness),com.sulake.habbo.window.utils.floorplaneditor.BCFloorPlanEditor.getThicknessSettingBySelectionIndex(_bcFloorPlanEditor.floorThickness)));
            }
         }
      }
   }
}

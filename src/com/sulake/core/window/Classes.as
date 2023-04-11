package com.sulake.core.window
{
   import com.sulake.core.window.components.*;
   import flash.utils.Dictionary;
   
   public class Classes
   {
      
      protected static var var_1435:Dictionary;
       
      
      public function Classes()
      {
         super();
      }
      
      public static function init() : void
      {
         if(!var_1435)
         {
            var_1435 = new Dictionary();
            var_1435[0] = WindowController;
            var_1435[40] = ActivatorController;
            var_1435[2] = BackgroundController;
            var_1435[30] = BorderController;
            var_1435[17] = BoxSizerController;
            var_1435[45] = BubbleController;
            var_1435[46] = WindowController;
            var_1435[47] = WindowController;
            var_1435[48] = WindowController;
            var_1435[49] = WindowController;
            var_1435[60] = ButtonController;
            var_1435[61] = ButtonController;
            var_1435[67] = SelectableButtonController;
            var_1435[68] = SelectableButtonController;
            var_1435[69] = SelectableButtonController;
            var_1435[21] = BitmapWrapperController;
            var_1435[70] = CheckBoxController;
            var_1435[4] = ContainerController;
            var_1435[41] = ContainerButtonController;
            var_1435[72] = CloseButtonController;
            var_1435[20] = DisplayObjectWrapperController;
            var_1435[76] = ScrollBarLiftController;
            var_1435[102] = DropMenuController;
            var_1435[103] = DropMenuItemController;
            var_1435[105] = DropListController;
            var_1435[106] = DropListItemController;
            var_1435[15] = FormattedTextController;
            var_1435[35] = FrameController;
            var_1435[6] = HeaderController;
            var_1435[11] = HTMLTextController;
            var_1435[1] = IconController;
            var_1435[50] = ItemListController;
            var_1435[51] = ItemListController;
            var_1435[50] = ItemListController;
            var_1435[52] = ItemGridController;
            var_1435[54] = ItemGridController;
            var_1435[53] = ItemGridController;
            var_1435[12] = TextLabelController;
            var_1435[14] = TextLinkController;
            var_1435[78] = PasswordFieldController;
            var_1435[71] = RadioButtonController;
            var_1435[5] = RegionController;
            var_1435[120] = ScalerController;
            var_1435[130] = ScrollBarController;
            var_1435[131] = ScrollBarController;
            var_1435[139] = ButtonController;
            var_1435[137] = ButtonController;
            var_1435[138] = ButtonController;
            var_1435[136] = ButtonController;
            var_1435[132] = ScrollBarLiftController;
            var_1435[133] = ScrollBarLiftController;
            var_1435[134] = WindowController;
            var_1435[135] = WindowController;
            var_1435[56] = ScrollableItemListWindow;
            var_1435[140] = ScrollableItemGridWindow;
            var_1435[42] = SelectorController;
            var_1435[43] = SelectorListController;
            var_1435[23] = StaticBitmapWrapperController;
            var_1435[93] = TabButtonController;
            var_1435[94] = TabContainerButtonController;
            var_1435[90] = ContainerController;
            var_1435[91] = TabContextController;
            var_1435[92] = SelectorListController;
            var_1435[10] = TextController;
            var_1435[77] = TextFieldController;
            var_1435[8] = ToolTipController;
            var_1435[16] = WidgetWindowController;
         }
      }
      
      public static function getWindowClassByType(param1:uint) : Class
      {
         return var_1435[param1];
      }
   }
}

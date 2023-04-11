package onBoardingHcUi
{
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.localization.class_17;
   import flash.display.Sprite;
   
   public class LocalizedSprite extends Sprite implements ILocalizable
   {
      
      private static var _localizationManager:class_17;
      
      protected var _localized:Boolean = false;
      
      public function LocalizedSprite()
      {
         super();
      }
      
      public static function set localizationManager(param1:class_17) : void
      {
         _localizationManager = param1;
      }
      
      public static function get localizationManager() : class_17
      {
         return _localizationManager;
      }
      
      public function dispose() : void
      {
         var _loc1_:String = "";
         if(this is Button)
         {
            _loc1_ = (this as Button).label;
         }
         removeOldLocalization(_loc1_);
      }
      
      public function set localization(param1:String) : void
      {
         if(this is Button)
         {
            (this as Button).localizedText = param1;
         }
      }
      
      protected function removeOldLocalization(param1:String) : void
      {
         if(_localized)
         {
            localizationManager.removeListener(param1.slice(2,param1.indexOf("}")),this);
            _localized = false;
         }
      }
      
      protected function checkLocalization(param1:String) : void
      {
         if(localizationManager && param1 && param1.charAt(0) == "$" && param1.charAt(1) == "{")
         {
            _localized = true;
            localizationManager.registerListener(param1.slice(2,param1.indexOf("}")),this);
         }
      }
   }
}

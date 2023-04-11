package
{
   import com.sulake.bootstrap.HabboLocalizationManagerBootstrap;
   import com.sulake.core.localization.class_17;
   import com.sulake.habbo.localization.HabboLocalizationManager;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.iid.IIDCoreLocalizationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import mx.core.SimpleApplication;

   public class HabboLocalizationCom extends SimpleApplication
   {
      
      public static var requiredClasses:Array = new Array(HabboLocalizationManagerBootstrap,IIDCoreLocalizationManager,IIDHabboLocalizationManager,class_17,class_18,HabboLocalizationManager);
      
      public static var manifest:Class = class_85;
      
      public static var default_localizations_pt:Class = class_74;
      
      public static var default_localizations_de:Class = default_localizations_de;
      
      public static var default_localizations_tr:Class = class_76;
      
      public static var default_localizations_dk:Class = default_localizations_dk;
      
      public static var default_localizations_es:Class = default_localizations_es;
      
      public static var default_localizations_fi:Class = class_69;
      
      public static var default_localizations_fr:Class = class_70;
      
      public static var default_localizations_it:Class = class_71;
      
      public static var default_localizations_nl:Class = class_72;
      
      public static var default_localizations_no:Class = class_73;
      
      public static var default_localizations_se:Class = class_75;
      
      public static var default_localizations_en:Class = default_localizations_en;
       
      
      public function HabboLocalizationCom()
      {
         super();
      }
   }
}

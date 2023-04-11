package
{
   import com.sulake.bootstrap.HabboConfigurationManagerBootstrap;
   import com.sulake.habbo.configuration.HabboConfigurationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import mx.core.SimpleApplication;
 
   public class HabboConfigurationCom extends SimpleApplication
   {
      
      public static var requiredClasses:Array = new Array(HabboConfigurationManagerBootstrap,IIDHabboConfigurationManager,HabboConfigurationManager);
      
      public static var manifest:Class = class_86;
      
      public static var common_configuration:Class = common_configuration;
      
      public static var localization_configuration:Class = class_84;
       
      
      public function HabboConfigurationCom()
      {
         super();
      }
   }
}

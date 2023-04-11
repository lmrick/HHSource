package
{
   import com.sulake.bootstrap.RoomObjectVisualizationFactoryBootstrap;
   import com.sulake.iid.IIDRoomObjectVisualizationFactory;
   import mx.core.SimpleApplication;

   public class HabboRoomObjectVisualizationLib extends SimpleApplication
   {
      
      public static var manifest:Class = manifest;
      
      public static var pet_experience_bubble_png:Class = pet_experience_bubble;
      
      public static var snowball_small_png:Class = snowball_small;
      
      public static var snowball_small_shadow_png:Class = class_2893;
      
      public static var snowball_big_png:Class = class_2891;
      
      public static var snowball_splash_1:Class = class_2894;
      
      public static var snowball_splash_2:Class = class_2895;
      
      public static var snowball_splash_3:Class = class_2896;
      
      public static var requiredClasses:Array = new Array(RoomObjectVisualizationFactoryBootstrap,IIDRoomObjectVisualizationFactory);
       
      
      public function HabboRoomObjectVisualizationLib()
      {
         super();
      }
   }
}

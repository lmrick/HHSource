package
{
   import com.sulake.bootstrap.RoomObjectFactoryBootstrap;
   import com.sulake.iid.IIDRoomObjectFactory;
   import mx.core.SimpleApplication;
   

   public class HabboRoomObjectLogicLib extends SimpleApplication
   {
      
      public static var manifest:Class = manifest;
      
      public static var requiredClasses:Array = new Array(RoomObjectFactoryBootstrap,IIDRoomObjectFactory);
       
      
      public function HabboRoomObjectLogicLib()
      {
         super();
      }
   }
}

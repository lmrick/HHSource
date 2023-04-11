package
{
   import com.sulake.bootstrap.RoomSessionManagerBootstrap;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import mx.core.SimpleApplication;

   public class HabboRoomSessionManagerLib extends SimpleApplication
   {
      
      public static var manifest:Class = class_2606;
      
      public static var requiredClasses:Array = new Array(RoomSessionManagerBootstrap,IIDHabboRoomSessionManager);
       
      
      public function HabboRoomSessionManagerLib()
      {
         super();
      }
   }
}

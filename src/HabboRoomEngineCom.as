package
{
   import com.sulake.bootstrap.RoomEngineBootstrap;
   import com.sulake.iid.IIDRoomEngine;
   import mx.core.SimpleApplication;

   public class HabboRoomEngineCom extends SimpleApplication
   {
      
      public static var manifest:Class = manifest;
      
      public static var requiredClasses:Array = new Array(RoomEngineBootstrap,IIDRoomEngine);
       
      
      public function HabboRoomEngineCom()
      {
         super();
      }
   }
}

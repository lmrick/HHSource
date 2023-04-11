package
{
   import com.sulake.bootstrap.RoomManagerBootstrap;
   import com.sulake.iid.IIDRoomManager;
   import mx.core.SimpleApplication;
   
   [SecureSWF(rename="false")]
   public class RoomManagerLib extends SimpleApplication
   {
      
      public static var manifest:Class = manifest_xml$3c30b3150b44a51a72956e3dd062db0f1553746401;
      
      public static var requiredClasses:Array = new Array(RoomManagerBootstrap,IIDRoomManager);
       
      
      public function RoomManagerLib()
      {
         super();
      }
   }
}

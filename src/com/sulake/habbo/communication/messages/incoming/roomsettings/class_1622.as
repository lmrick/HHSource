package package_78
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1622
   {
      
      public static const const_227:int = 0;
      
      public static const const_243:int = 1;
      
      public static const const_310:int = 0;
      
      public static const const_35:int = 1;
      
      public static const const_347:int = 2;
      
      public static const const_194:int = 0;
      
      public static const const_107:int = 1;
      
      public static const const_394:int = 2;
      
      public static const const_346:int = 0;
      
      public static const const_365:int = 1;
      
      public static const const_378:int = 2;
       
      
      private var var_773:int = 0;
      
      private var var_942:int = 1;
      
      private var var_1324:int = 1;
      
      private var var_1274:int = 1;
      
      private var var_1289:int = 14;
      
      public function class_1622(param1:IMessageDataWrapper)
      {
         super();
         var_773 = param1.readInteger();
         var_942 = param1.readInteger();
         var_1324 = param1.readInteger();
         var_1289 = param1.readInteger();
         var_1274 = param1.readInteger();
      }
      
      public function get mode() : int
      {
         return var_773;
      }
      
      public function get bubbleWidth() : int
      {
         return var_942;
      }
      
      public function get scrollSpeed() : int
      {
         return var_1324;
      }
      
      public function get fullHearRange() : int
      {
         return var_1289;
      }
      
      public function get floodSensitivity() : int
      {
         return var_1274;
      }
   }
}

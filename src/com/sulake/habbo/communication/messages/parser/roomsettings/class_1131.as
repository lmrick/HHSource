package package_126
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1131 implements IMessageParser
   {
      
      public static const const_207:int = 1;
      
      public static const const_324:int = 2;
      
      public static const const_405:int = 3;
      
      public static const const_391:int = 4;
      
      public static const const_24:int = 5;
      
      public static const const_105:int = 6;
      
      public static const const_258:int = 7;
      
      public static const const_73:int = 8;
      
      public static const const_280:int = 9;
      
      public static const const_220:int = 10;
      
      public static const const_136:int = 11;
      
      public static const const_329:int = 12;
      
      public static const const_358:int = 13;
       
      
      private var var_354:int;
      
      private var var_413:int;
      
      private var var_1089:String;
      
      public function class_1131()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_354 = param1.readInteger();
         var_413 = param1.readInteger();
         var_1089 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get errorCode() : int
      {
         return var_413;
      }
      
      public function get info() : String
      {
         return var_1089;
      }
   }
}

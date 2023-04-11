package package_146
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1296 implements IMessageParser
   {
       
      
      private var var_400:int;
      
      private var var_571:int;
      
      private var var_333:int;
      
      private var var_458:int;
      
      private var var_356:int;
      
      public function class_1296()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return var_400;
      }
      
      public function get currentPosition() : int
      {
         return var_571;
      }
      
      public function get nextSongId() : int
      {
         return var_333;
      }
      
      public function get nextPosition() : int
      {
         return var_458;
      }
      
      public function get syncCount() : int
      {
         return var_356;
      }
      
      public function flush() : Boolean
      {
         var_400 = -1;
         var_571 = -1;
         var_333 = -1;
         var_458 = -1;
         var_356 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_400 = param1.readInteger();
         var_571 = param1.readInteger();
         var_333 = param1.readInteger();
         var_458 = param1.readInteger();
         var_356 = param1.readInteger();
         return true;
      }
   }
}

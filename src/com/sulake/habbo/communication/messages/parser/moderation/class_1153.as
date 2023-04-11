package package_137
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1153 implements IMessageParser
   {
       
      
      private var var_557:int;
      
      private var var_473:int;
      
      private var _windowWidth:int;
      
      private var var_352:int;
      
      public function class_1153()
      {
         super();
      }
      
      public function get windowX() : int
      {
         return var_557;
      }
      
      public function get windowY() : int
      {
         return var_473;
      }
      
      public function get windowWidth() : int
      {
         return _windowWidth;
      }
      
      public function get windowHeight() : int
      {
         return var_352;
      }
      
      public function flush() : Boolean
      {
         var_557 = 0;
         var_473 = 0;
         _windowWidth = 0;
         var_352 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_557 = param1.readInteger();
         var_473 = param1.readInteger();
         _windowWidth = param1.readInteger();
         var_352 = param1.readInteger();
         return true;
      }
   }
}

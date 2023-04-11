package package_142
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1240 implements IMessageParser
   {
       
      
      private var var_557:int;
      
      private var var_473:int;
      
      private var _windowWidth:int;
      
      private var var_352:int;
      
      private var var_448:Boolean;
      
      private var var_433:int;
      
      public function class_1240()
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
      
      public function get leftPaneHidden() : Boolean
      {
         return var_448;
      }
      
      public function get resultsMode() : int
      {
         return var_433;
      }
      
      public function flush() : Boolean
      {
         var_557 = 0;
         var_473 = 0;
         _windowWidth = 0;
         var_352 = 0;
         var_448 = false;
         var_433 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_557 = param1.readInteger();
         var_473 = param1.readInteger();
         _windowWidth = param1.readInteger();
         var_352 = param1.readInteger();
         var_448 = param1.readBoolean();
         var_433 = param1.readInteger();
         return true;
      }
   }
}

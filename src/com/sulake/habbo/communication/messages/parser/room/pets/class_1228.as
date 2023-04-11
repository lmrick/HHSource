package package_134
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_144.class_1552;
   
   [SecureSWF(rename="true")]
   public class class_1228 implements IMessageParser
   {
       
      
      private var var_783:int;
      
      private var var_421:int;
      
      private var var_117:class_1552;
      
      private var var_1132:Boolean;
      
      private var var_1018:Boolean;
      
      public function class_1228()
      {
         super();
      }
      
      public function get roomIndex() : int
      {
         return var_783;
      }
      
      public function get petId() : int
      {
         return var_421;
      }
      
      public function get figureData() : class_1552
      {
         return var_117;
      }
      
      public function get hasSaddle() : Boolean
      {
         return var_1132;
      }
      
      public function get isRiding() : Boolean
      {
         return var_1018;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_783 = param1.readInteger();
         var_421 = param1.readInteger();
         var_117 = new class_1552(param1);
         var_1132 = param1.readBoolean();
         var_1018 = param1.readBoolean();
         return true;
      }
   }
}

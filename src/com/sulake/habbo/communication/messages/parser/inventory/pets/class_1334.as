package package_144
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1334 implements IMessageParser
   {
      
      public static const const_11:int = 1;
      
      public static const const_15:int = 2;
      
      public static const const_61:int = 3;
       
      
      private var var_159:int;
      
      private var var_1002:int;
      
      private var var_1226:int;
      
      public function class_1334()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_159 = param1.readInteger();
         var_1002 = param1.readInteger();
         var_1226 = param1.readInteger();
         return true;
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function get ownPetId() : int
      {
         return var_1002;
      }
      
      public function get otherPetId() : int
      {
         return var_1226;
      }
   }
}

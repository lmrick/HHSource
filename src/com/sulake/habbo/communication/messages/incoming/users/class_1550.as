package package_5
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1550
   {
       
      
      private var var_896:int;
      
      private var var_749:int;
      
      private var _position:int;
      
      public function class_1550(param1:IMessageDataWrapper)
      {
         super();
         var_896 = param1.readInteger();
         var_749 = param1.readInteger();
         _position = param1.readInteger();
      }
      
      public function get partId() : int
      {
         return var_896;
      }
      
      public function get colorId() : int
      {
         return var_749;
      }
      
      public function get position() : int
      {
         return _position;
      }
   }
}

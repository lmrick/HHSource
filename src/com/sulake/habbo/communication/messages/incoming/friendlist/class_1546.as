package package_24
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1546
   {
       
      
      private var var_247:int;
      
      private var _name:String;
      
      public function class_1546(param1:IMessageDataWrapper)
      {
         super();
         this.var_247 = param1.readInteger();
         this._name = param1.readString();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get name() : String
      {
         return _name;
      }
   }
}

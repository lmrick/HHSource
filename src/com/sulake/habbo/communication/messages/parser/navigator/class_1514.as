package package_132
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1514 implements IMessageParser
   {
       
      
      private var _flatId:int;
      
      private var var_987:String;
      
      public function class_1514()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._flatId = param1.readInteger();
         this.var_987 = param1.readString();
         class_14.log("FLAT CREATED: " + this._flatId + ", " + this.var_987);
         return true;
      }
      
      public function get flatId() : int
      {
         return _flatId;
      }
      
      public function get flatName() : String
      {
         return var_987;
      }
   }
}

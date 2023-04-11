package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1215 implements IMessageParser
   {
       
      
      private var var_332:int;
      
      private var var_247:int;
      
      private var _newName:String;
      
      public function class_1215()
      {
         super();
      }
      
      public function get webId() : int
      {
         return var_332;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get newName() : String
      {
         return _newName;
      }
      
      public function flush() : Boolean
      {
         var_332 = -1;
         var_247 = -1;
         _newName = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_332 = param1.readInteger();
         var_247 = param1.readInteger();
         _newName = param1.readString();
         return true;
      }
   }
}

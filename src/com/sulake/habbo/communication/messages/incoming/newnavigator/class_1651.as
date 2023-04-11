package package_18
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1651
   {
       
      
      private var var_932:String;
      
      private var var_1192:Vector.<package_18.class_1597>;
      
      public function class_1651(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         var_1192 = new Vector.<package_18.class_1597>(0);
         super();
         var_932 = param1.readString();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            quickLinks.push(new package_18.class_1597(param1));
            _loc3_++;
         }
      }
      
      public function get searchCode() : String
      {
         return var_932;
      }
      
      public function get quickLinks() : Vector.<package_18.class_1597>
      {
         return var_1192;
      }
   }
}

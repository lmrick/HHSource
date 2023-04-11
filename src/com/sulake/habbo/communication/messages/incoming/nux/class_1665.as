package package_74
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1665
   {
       
      
      private var var_638:Vector.<package_74.class_1675>;
      
      private var var_254:String;
      
      public function class_1665(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         super();
         var_254 = param1.readString();
         if(var_254 == "")
         {
            var_254 = null;
         }
         var_638 = new Vector.<package_74.class_1675>();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_638.push(new package_74.class_1675(param1));
            _loc3_++;
         }
      }
      
      public function get productOfferList() : Vector.<package_74.class_1675>
      {
         return var_638;
      }
      
      public function get thumbnailUrl() : String
      {
         return var_254;
      }
   }
}

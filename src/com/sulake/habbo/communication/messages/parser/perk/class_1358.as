package package_178
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1358 implements IMessageParser
   {
       
      
      private var var_215:Vector.<package_178.class_1585>;
      
      public function class_1358()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_215 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:package_178.class_1585 = null;
         var_215 = new Vector.<package_178.class_1585>();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            (_loc4_ = new package_178.class_1585()).code = param1.readString();
            _loc4_.errorMessage = param1.readString();
            _loc4_.isAllowed = param1.readBoolean();
            var_215.push(_loc4_);
            _loc3_++;
         }
         return true;
      }
      
      public function getPerks() : Vector.<package_178.class_1585>
      {
         return var_215;
      }
      
      public function isPerkAllowed(param1:String) : Boolean
      {
         var _loc2_:package_178.class_1585 = getPerk(param1);
         return _loc2_ != null && _loc2_.isAllowed;
      }
      
      public function getPerk(param1:String) : package_178.class_1585
      {
         for each(var _loc2_ in var_215)
         {
            if(_loc2_.code == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}

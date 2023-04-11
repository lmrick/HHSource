package package_136
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1298 implements IMessageParser
   {
       
      
      private var var_970:Boolean;
      
      private var _furniTypeName:String;
      
      private var var_1176:Boolean;
      
      private var var_342:int;
      
      private var var_538:int;
      
      private var var_349:int;
      
      public function class_1298()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_970 = param1.readBoolean();
         _furniTypeName = param1.readString();
         var_1176 = param1.readBoolean();
         var_342 = param1.readInteger();
         var_538 = param1.readInteger();
         var_349 = param1.readInteger();
         return true;
      }
      
      public function get isWallItem() : Boolean
      {
         return var_970;
      }
      
      public function get furniTypeName() : String
      {
         return _furniTypeName;
      }
      
      public function get buyout() : Boolean
      {
         return var_1176;
      }
      
      public function get priceInCredits() : int
      {
         return var_342;
      }
      
      public function get priceInActivityPoints() : int
      {
         return var_538;
      }
      
      public function get activityPointType() : int
      {
         return var_349;
      }
   }
}

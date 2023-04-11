package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.room.object.data.class_1610;
   
   [SecureSWF(rename="true")]
   public class class_1283 implements IMessageParser
   {
       
      
      private var var_247:int = 0;
      
      private var var_159:int = 0;
      
      private var var_45:IStuffData;
      
      public function class_1283()
      {
         super();
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function get data() : IStuffData
      {
         return var_45;
      }
      
      public function flush() : Boolean
      {
         var_159 = 0;
         var_45 = new class_1610() as IStuffData;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc3_:String = param1.readString();
         var_247 = int(_loc3_);
         var_45 = class_1538.parseStuffData(param1);
         var _loc2_:Number = parseFloat(var_45.getLegacyString());
         if(!isNaN(_loc2_))
         {
            var_159 = int(var_45.getLegacyString());
         }
         return true;
      }
   }
}
